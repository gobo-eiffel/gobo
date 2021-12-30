note

	description:

		"Eiffel type checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class,
			process_class_type,
			process_like_current,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new type checker.
		do
			precursor (a_system_processor)
			current_context := tokens.unknown_class
			current_class_impl := tokens.unknown_class
			current_feature_impl := dummy_feature
			create constraint_context.make_with_capacity (current_class, 1)
			create target_context.make_with_capacity (current_class, 10)
			create other_context.make_with_capacity (current_class, 10)
			create adapted_base_class_checker.make (a_system_processor)
			create adapted_base_classes.make (20)
		end

feature -- Validity checking

	check_type_validity (a_type: ET_TYPE; a_current_feature_impl: ET_CLOSURE; a_current_class_impl: ET_CLASS; a_current_context: ET_TYPE_CONTEXT)
			-- Check validity of `a_type' written in `a_current_feature_impl' in
			-- `a_current_class_impl' viewed from `a_current_context'. Resolve
			-- identifiers (such as 'like identifier', 'like {A}.identifier
			-- or 'like a.identifier') in type `a_type' if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_current_feature_impl_not_void: a_current_feature_impl /= Void
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_context_not_void: a_current_context /= Void
			a_current_context_valid: a_current_context.is_valid_context
			a_current_context_root_context: a_current_context.is_root_context
			a_current_class_preparsed: a_current_context.base_class.is_preparsed
			-- no_cycle: no cycle in anchored types involved.
		local
			old_feature_impl: ET_CLOSURE
			old_context: ET_TYPE_CONTEXT
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
		do
			has_fatal_error := False
			old_feature_impl := current_feature_impl
			current_feature_impl := a_current_feature_impl
			old_context := current_context
			current_context := a_current_context
			old_class := current_class
			current_class := current_context.root_context.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_current_class_impl
			a_type.process (Current)
			current_class_impl := old_class_impl
			current_class := old_class
			current_context := old_context
			current_feature_impl := old_feature_impl
		end

	check_creation_type_validity (a_type: ET_BASE_TYPE; a_current_class_impl: ET_CLASS; a_current_context: ET_TYPE_CONTEXT; a_position: ET_POSITION)
			-- Check validity of `a_type' as a creation type written in `a_current_class_impl'
			-- and viewed from `a_current_context'. Note that `a_type' should already be a valid
			-- type by itself (call `check_type_validity' for that).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_context_not_void: a_current_context /= Void
			a_current_context_valid: a_current_context.is_valid_context
			a_current_context_root_context: a_current_context.is_root_context
			a_current_class_preparsed: a_current_context.base_class.is_preparsed
			a_position_not_void: a_position /= Void
		local
			a_type_class: ET_CLASS
			a_base_class: ET_CLASS
			an_actuals: detachable ET_ACTUAL_PARAMETERS
			an_actual: ET_TYPE
			a_named_actual: ET_NAMED_TYPE
			a_formals: detachable ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_creator: detachable ET_CONSTRAINT_CREATOR
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			an_index: INTEGER
			a_formal_parameters: detachable ET_FORMAL_PARAMETER_LIST
			a_formal_parameter: detachable ET_FORMAL_PARAMETER
			a_formal_creator: detachable ET_CONSTRAINT_CREATOR
			a_formal_base_types: ET_CONSTRAINT_BASE_TYPES
			i, nb: INTEGER
			j, nb_creators: INTEGER
			k, nb_base_types: INTEGER
			nb_parameters: INTEGER
			had_error: BOOLEAN
			old_context: ET_TYPE_CONTEXT
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
		do
			has_fatal_error := False
			old_context := current_context
			current_context := a_current_context
			old_class := current_class
			current_class := current_context.root_context.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_current_class_impl
			an_actuals := a_type.actual_parameters
			a_type_class := a_type.base_class
			a_type_class.process (system_processor.interface_checker)
			if not a_type_class.interface_checked or else a_type_class.has_interface_error then
				set_fatal_error
			elseif attached {ET_TUPLE_TYPE} a_type as l_tuple_type then
					-- This covers the case where we have:
					--    FOO [TUPLE [MY_EXPANDED [BAR]]
					-- and FOO was declared as:
					--    class FOO [G -> TUPLE create default_create end]
				if attached l_tuple_type.actual_parameters as a_parameters then
					nb_parameters := a_parameters.count
					from i := 1 until i > nb_parameters loop
						if attached {ET_BASE_TYPE} a_parameters.type (i) as l_base_type and then l_base_type.is_expanded then
								-- If the actual parameter is expanded, then the creation of an instance
								-- of that type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							had_error := has_fatal_error
							check_creation_type_validity (l_base_type, current_class_impl, current_context, a_position)
							if had_error then
								set_fatal_error
							end
						end
						i := i + 1
					end
				end
			elseif an_actuals /= Void and then not an_actuals.is_empty then
				a_formals := a_type_class.formal_parameters
				nb := an_actuals.count
				if a_formals = Void or else a_formals.count /= nb then
						-- Internal error: `a_type' is supposed to be a valid type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					a_formal_parameters := current_class.formal_parameters
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						a_named_actual := an_actual.shallow_named_type (current_context)
						a_formal := a_formals.formal_parameter (i)
						a_creator := a_formal.creation_procedures
						if a_creator /= Void and then not a_creator.is_empty then
							nb_creators := a_creator.count
							if attached {ET_FORMAL_PARAMETER_TYPE} a_named_actual as a_formal_type then
								an_index := a_formal_type.index
								if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
										-- Internal error: `a_formal_parameter' is supposed to be
										-- a formal parameter of `current_context''s base class.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
									a_formal_base_types := a_formal_parameter.constraint_base_types
									a_formal_creator := a_formal_parameter.creation_procedures
									nb_base_types := a_formal_base_types.count
									from j := 1 until j > nb_creators loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										from k := 1 until k > nb_base_types loop
											a_base_class := a_formal_base_types.type_constraint (k).base_class
											a_base_class.process (system_processor.interface_checker)
											if not a_base_class.interface_checked_successfully then
												set_fatal_error
											elseif not attached a_base_class.seeded_procedure (a_seed) as l_creation_procedure then
												-- We are in the case of multiple constraints and the
												-- procedure with this seed comes from another constraint.
											elseif a_formal_creator = Void or else not a_formal_creator.has_feature (l_creation_procedure) then
												set_fatal_error
												if not class_interface_error_only then
													error_handler.report_vtcg4b_error (current_class, current_class_impl, a_position, i, a_name, a_formal_parameter, a_type_class)
												end
											end
											k := k + 1
										end
										j := j + 1
									end
								end
							else
								a_base_class := a_named_actual.base_class (current_context)
								a_base_class.process (system_processor.interface_checker)
								if not a_base_class.interface_checked_successfully then
									set_fatal_error
								else
									from j := 1 until j > nb_creators loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										if not attached a_base_class.seeded_procedure (a_seed) as l_creation_procedure then
												-- Internal error: `a_type' is supposed to be a valid type.
											set_fatal_error
											error_handler.report_giaaa_error
										elseif not l_creation_procedure.is_creation_exported_to (a_type_class, a_base_class, system_processor) then
											if system_processor.is_ise and then (current_class.is_deferred and an_actual.is_like_current) then
												-- ISE accepts code of the form:
												--
												--   class A [G -> B create default_create end]
												--   feature
												--     f
												--       local
												--         b: G
												--       do
												--         create b
												--         print (b.generating_type)
												--       end
												--   end
												--
												--   deferred class B
												--   feature
												--     f
												--        local
												--          a: A [like Current]
												--        do
												--          create a
												--          a.f
												--        end
												--   end
												--
												-- This is indeed safe (i.e. no possible creation of instances of
												-- a deferred class), provided that non-deferred descendants of
												-- class B make their version of 'default_create' available for
												-- creation to class A.
												-- The following case is also accepted:
												--
												--   deferred class B
												--   feature
												--     f
												--        local
												--          a: like a1
												--        do
												--          create a
												--          a.f
												--        end
												--     a1: A [like Current]
												--   end
												--
												-- However, note that it rejects this one:
												--
												--   deferred class B
												--   feature
												--     f
												--        local
												--          a: A [like b]
												--        do
												--          create a
												--          a.f
												--        end
												--     b: like Current
												--   end
												--
												-- which was nevertheless not more unsafe than the other cases above.
											elseif
												system_processor.older_ise_version (ise_6_0_6_7358) and then
												(a_base_class.is_deferred and l_creation_procedure.has_seed (current_system.default_create_seed))
											then
												-- ISE started to report this VTCG error with version 6.0.6.7358.
												-- However we report it anyway, except when the creation procedure
												-- is the version of 'default_create' in a deferred class. There is
												-- no occurrence of the other cases in the code at AXA Rosenberg,
												-- and we don't want new occurrences to appear because it is dangerous
												-- at run-time (we may end up creating instances of deferred classes).
											else
												set_fatal_error
												if not class_interface_error_only then
													error_handler.report_vtcg4a_error (current_class, current_class_impl, a_position, i, a_name, a_base_class, a_type_class)
												end
											end
										end
										j := j + 1
									end
								end
									-- Since the corresponding formal generic parameter
									-- has creation procedures associated with it, it
									-- is possible to create instances of `an_actual'
									-- through that means. So we need to check recursively
									-- its validity as a creation type.
								if attached {ET_BASE_TYPE} a_named_actual as l_base_type then
									had_error := has_fatal_error
									check_creation_type_validity (l_base_type, current_class_impl, current_context, a_position)
									if had_error then
										set_fatal_error
									end
								end
							end
						elseif attached {ET_BASE_TYPE} a_named_actual as l_base_type and then l_base_type.is_expanded then
								-- If `a_named_actual' is expanded, then the creation of an instance
								-- of that type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							had_error := has_fatal_error
							check_creation_type_validity (l_base_type, current_class_impl, current_context, a_position)
							if had_error then
								set_fatal_error
							end
						end
						i := i + 1
					end
				end
			end
			current_class_impl := old_class_impl
			current_class := old_class
			current_context := old_context
		end

feature -- Type conversion

	convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT): detachable ET_CONVERT_FEATURE
			-- Feature to convert `a_source_type' to `a_target_type';
			-- Void if no such feature
		require
			a_source_type_not_void: a_source_type /= Void
			a_source_context_valid: a_source_type.is_valid_context
			a_target_type_not_void: a_target_type /= Void
			a_target_context_valid: a_target_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			a_source_base_class: ET_CLASS
			a_target_base_class: ET_CLASS
			a_source_named_type: ET_NAMED_TYPE
		do
			a_source_base_class := a_source_type.base_class
				-- Make sure that the class has been parsed before
				-- asking for its conversion features.
			if a_source_base_class.is_preparsed then
				a_source_base_class.process (system_processor.eiffel_parser)
			end
			Result := a_source_base_class.convert_to_feature (a_target_type, a_source_type)
			if Result = Void then
				a_target_base_class := a_target_type.base_class
					-- Make sure that the class has been parsed before
					-- asking for its conversion features.
				if a_target_base_class.is_preparsed then
					a_target_base_class.process (system_processor.eiffel_parser)
				end
				Result := a_target_base_class.convert_from_feature (a_source_type, a_target_type)
				if Result = Void then
					a_source_named_type := a_source_type.named_type
					if a_target_base_class.is_preparsed and then a_target_base_class.is_dotnet and a_target_base_class.is_system_object_class then
							-- Needed for Eiffel for .NET.
						create {ET_BUILTIN_CONVERT_FEATURE} Result.make (a_source_named_type)
					end
				end
			end
		end

feature {NONE} -- Validity checking

	check_class_type_validity (a_type: ET_CLASS_TYPE)
			-- Check validity of `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
			l_actuals: detachable ET_ACTUAL_PARAMETERS
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: detachable ET_CONSTRAINT
			a_class: ET_CLASS
			had_error: BOOLEAN
			l_conforms: BOOLEAN
		do
			has_fatal_error := False
			a_class := a_type.base_class
			if a_class.is_none then
				if a_type.is_generic then
						-- Class "NONE" is not generic.
					set_fatal_error
					if not class_interface_error_only then
						if current_class = current_class_impl then
							error_handler.report_vtug1a_error (current_class, a_type)
						else
-- TODO: this error should have already been reported when processing `current_class_impl'.
							error_handler.report_vtug1a_error (current_class_impl, a_type)
						end
					end
				end
			elseif a_class.is_unknown then
				set_fatal_error
				if not class_interface_error_only then
					if current_class = current_class_impl then
						error_handler.report_vtct0a_error (current_class, a_type)
					else
-- TODO: this error should have already been reported when processing `current_class_impl'.
						error_handler.report_vtct0a_error (current_class_impl, a_type)
					end
				end
			else
				a_class.process (system_processor.interface_checker)
				if not a_class.interface_checked then
					set_fatal_error
				elseif a_class.has_interface_error then
						-- Error should already have been
						-- reported somewhere else.
					set_fatal_error
				elseif not a_class.is_generic then
					if a_type.is_generic then
						set_fatal_error
						if not class_interface_error_only then
							if current_class = current_class_impl then
								error_handler.report_vtug1a_error (current_class, a_type)
							else
-- TODO: this error should have already been reported when processing `current_class_impl'.
								error_handler.report_vtug1a_error (current_class_impl, a_type)
							end
						end
					end
				else
					if current_class = current_class_impl then
						a_type.resolve_unfolded_tuple_actual_parameters_1 (current_universe)
					end
					l_actuals := a_type.actual_parameters
					if not a_type.is_generic then
						set_fatal_error
						if not class_interface_error_only then
							if current_class = current_class_impl then
								error_handler.report_vtug2a_error (current_class, a_type)
							else
-- TODO: this error should have already been reported when processing `current_class_impl'.
								error_handler.report_vtug2a_error (current_class_impl, a_type)
							end
						end
					elseif not attached a_class.formal_parameters as a_formals then
							-- Internal error: `a_class' is generic.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_actuals = Void then
							-- Internal error: `a_type' is generic.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						if l_actuals.count /= a_formals.count then
							set_fatal_error
							if not class_interface_error_only then
								if current_class = current_class_impl then
									error_handler.report_vtug2a_error (current_class, a_type)
								else
-- TODO: this error should have already been reported when processing `current_class_impl'.
									error_handler.report_vtug2a_error (current_class_impl, a_type)
								end
							end
						else
							nb := l_actuals.count
								-- We need to process all actual parameters (and hence finish performing
								-- all Tuple-type-unfolding) before trying to run the second phase of
								-- Tuple-type-unfolding. Indeed, we might have a case like
								-- that:
								--
								--  class AA [G -> TUPLE [H], H]
								--
								--  a: AA [TUPLE [PROCEDURE [TUPLE [BB]]], PROCEDURE [BB]]
								--
								-- This should be resolved as:
								--
								--  a: AA [TUPLE [PROCEDURE [TUPLE [BB]]], PROCEDURE [TUPLE [BB]]]
								--
								-- But if we had not processed the second actual parameter of AA beforehand,
								-- we would have ended up with this erroneously resolved type:
								--
								--  a: AA [TUPLE [TUPLE [PROCEDURE [TUPLE [BB]]]], PROCEDURE [TUPLE [BB]]]
								--
								-- which is not valid. Hence the two loops below.
							from i := 1 until i > nb loop
								an_actual := l_actuals.type (i)
								had_error := has_fatal_error
								an_actual.process (Current)
								reset_fatal_error (has_fatal_error or had_error)
								i := i + 1
							end
							from i := 1 until i > nb loop
								an_actual := l_actuals.type (i)
								a_formal := a_formals.formal_parameter (i)
								if a_formal.is_expanded then
									if not an_actual.is_type_expanded (current_context) then
										set_fatal_error
										if not class_interface_error_only then
											error_handler.report_gvtcg5b_error (current_class, current_class_impl, a_type, an_actual, a_formal)
										end
									end
								elseif a_formal.is_reference then
									if not an_actual.is_type_reference (current_context) then
										set_fatal_error
										if not class_interface_error_only then
											error_handler.report_gvtcg5a_error (current_class, current_class_impl, a_type, an_actual, a_formal)
										end
									end
								end
								a_constraint := a_formal.constraint
								if a_constraint = Void then
									a_constraint := current_system.detachable_any_type
								end
									-- If we have:
									--
									--   class A [G, H -> LIST [G]] ...
									--   class X feature foo: A [ANY, LIST [STRING]] ...
									--
									-- we need to check that "LIST [STRING]" conforms to
									-- "LIST [ANY]", not just "LIST [G]".
									-- Likewise if we have:
									--
									--   class A [G -> LIST [G]] ...
									--   class X feature foo: A [LIST [FOO]] ...
									--
									-- we need to check that "LIST [FOO]" conforms to
									-- "LIST [LIST [FOO]]", not just "LIST [G]".
								constraint_context.set (a_type, current_context.root_context)
								l_conforms := an_actual.conforms_to_constraint (a_constraint, constraint_context, current_context, system_processor)
								if not l_conforms then
									if current_class = current_class_impl and then a_class.tuple_constraint_position = i then
										a_type.resolve_unfolded_tuple_actual_parameters_2 (current_context, constraint_context, system_processor)
										if attached a_type.actual_parameters as l_actual_parameters and then l_actual_parameters /= l_actuals then
											l_actuals := l_actual_parameters
											an_actual := l_actuals.type (i)
											l_conforms := an_actual.conforms_to_constraint (a_constraint, constraint_context, current_context, system_processor)
										end
									end
								end
								constraint_context.reset (tokens.unknown_class)
								if not l_conforms then
										-- The actual parameter does not conform to the
										-- constraint of its corresponding formal parameter.
										--
										-- Note that it is possible that the actual paramater conforms
										-- to the constraint in `current_class_impl' but not in `current_class'.
										-- Here is an example:
										--
										--   class A
										--   feature
										--       y: Y [like Current, X [A]]
										--   end
										--
										--   class B
										--   inherit
										--       A
										--   end
										--
										--   class X
										--   end
										--
										--   class Y [G, H -> X [G]]
										--   end
										--
										-- In class B the actual generic parameter 'X [A]' does not conform
										-- to its constraint 'X [like Current]'.
									set_fatal_error
									if not class_interface_error_only then
										error_handler.report_vtcg3a_error (current_class, current_class_impl, a_type, an_actual, a_constraint)
									end
								end
								i := i + 1
							end
						end
					end
				end
			end
		end

	check_like_current_validity (a_type: ET_LIKE_CURRENT)
			-- Check validity of `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			has_fatal_error := False
			-- No validity rule to be checked.
		end

	check_like_feature_validity (a_type: ET_LIKE_FEATURE)
			-- Check validity of `a_type'.
			-- Resolve identifer in 'like identifier' if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			args: detachable ET_FORMAL_ARGUMENT_LIST
			l_index: INTEGER
			resolved: BOOLEAN
		do
			has_fatal_error := False
			l_seed := a_type.seed
			if l_seed = 0 then
					-- Not resolved yet. It needs to be resolved
					-- in the implementation class first.
				if current_class /= current_class_impl then
						-- Internal error: it should have been resolved in
						-- the implementation class.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					current_class.process (system_processor.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_name := a_type.name
						if attached current_class.named_query (l_name) as l_query then
								-- This is a 'like feature'.
							a_type.resolve_like_feature (l_query)
							if in_qualified_anchored_type then
								if system_processor.qualified_anchored_types_cycle_detection_enabled then
									if  l_query.type.depends_on_qualified_anchored_type (current_class) then
											-- Error: the type of the anchor appearing in a qualified
											-- anchored type should not depend on a qualified anchored type.
											-- This is a way to avoid cycles in qualified anchored types.
										set_fatal_error
										if not class_interface_error_only then
											error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
										end
									end
								end
							end
						else
								-- This has to be a 'like argument', otherwise this is an error.
								-- Note that 'like argument' is not a valid construct in ECMA Eiffel.
								-- This is supported here for backward compatibility.
							if attached {ET_FEATURE} current_feature_impl as l_feature then
								if attached {ET_IDENTIFIER} l_name as l_argument_name then
									args := l_feature.arguments
									if args /= Void then
										l_index := args.index_of (l_argument_name)
										if l_index /= 0 then
											l_argument_name.set_seed (l_index)
											l_argument_name.set_argument (True)
											a_type.resolve_like_argument (l_feature)
											resolved := True
											if in_qualified_anchored_type then
												if system_processor.qualified_anchored_types_cycle_detection_enabled then
													if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
															-- Error: the type of the anchor appearing in a qualified
															-- anchored type should not depend on a qualified anchored type.
															-- This is a way to avoid cycles in qualified anchored types.
														set_fatal_error
														if not class_interface_error_only then
															error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
														end
													end
												end
											end
										end
									end
								end
								if not resolved then
									set_fatal_error
									if not class_interface_error_only then
										error_handler.report_vtat1b_error (current_class, l_feature, a_type)
									end
								end
							else
									-- 'like argument' not valid in inline agents and invariants.
								set_fatal_error
								if not class_interface_error_only then
									error_handler.report_vtat1a_error (current_class, a_type)
								end
							end
						end
					end
				end
			elseif in_qualified_anchored_type then
				if l_seed /= 0 then
						-- Anchored type already resolved.
					if a_type.is_like_argument then
						if attached current_class.seeded_feature (l_seed) as l_feature then
							args := l_feature.arguments
							l_index := a_type.index
							if args /= Void and then l_index <= args.count then
								if system_processor.qualified_anchored_types_cycle_detection_enabled then
									if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
											-- Error: the type of the anchor appearing in a qualified
											-- anchored type should not depend on a qualified anchored type.
											-- This is a way to avoid cycles in qualified anchored types.
										set_fatal_error
										if not class_interface_error_only then
											error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
										end
									end
								end
							else
									-- Internal error: it was already checked in previous compilation
									-- pass that we had enough arguments. Even if this is a redeclaration,
									-- signature conformance of the redeclaration imposes that the
									-- number of arguments does not change.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						else
								-- Internal error: if we got a seed, then `l_feature' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						if attached current_class.seeded_query (l_seed) as l_query then
							if system_processor.qualified_anchored_types_cycle_detection_enabled then
								if l_query.type.depends_on_qualified_anchored_type (current_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									if not class_interface_error_only then
										error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
									end
								end
							end
						else
								-- Internal error: if we got a seed, then `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				else
						-- Internal error: the anchored type should have been resolved by the feature flattener.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
		end

	check_qualified_like_identifier_validity (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check validity of `a_type'.
			-- Resolve 'identifier' in 'like identifier.b', 'like a.identifier'
			-- or 'like {A}.identifier' if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			l_target_type: ET_TYPE
			l_class: ET_CLASS
			old_in_qualified_anchored_type: BOOLEAN
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_query: detachable ET_QUERY
			l_target_context_count: INTEGER
		do
			has_fatal_error := False
			old_in_qualified_anchored_type := in_qualified_anchored_type
			in_qualified_anchored_type := True
			l_name := a_type.name
			l_seed := a_type.seed
			l_target_type := a_type.target_type
			l_target_type.process (Current)
			l_adapted_base_classes := adapted_base_classes
			if not has_fatal_error then
				report_qualified_anchored_type_supplier (l_target_type, current_context.root_context)
				target_context.set (l_target_type, current_context.root_context)
				l_target_context_count := target_context.count
				target_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, target_context)
			end
			if has_fatal_error then
				-- Cannot go further.
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
					-- Not resolved yet. It needs to be resolved
					-- in the implementation class first.
				if current_class /= current_class_impl then
						-- Internal error: it should have been resolved in
						-- the implementation class.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
					a_type.resolve_identifier_type (l_query.first_seed)
-- TODO: check that `l_query' is exported to `current_class'.
					if system_processor.qualified_anchored_types_cycle_detection_enabled then
						if l_query.type.depends_on_qualified_anchored_type (l_class) then
								-- Error: the type of the anchor appearing in a qualified
								-- anchored type should not depend on a qualified anchored type.
								-- This is a way to avoid cycles in qualified anchored types.
							set_fatal_error
							if not class_interface_error_only then
								error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
							end
						end
					end
				else
						-- Error: there is no query with this final name.
					set_fatal_error
					if not class_interface_error_only then
						error_handler.report_vtat1c_error (current_class, a_type, l_class)
					end
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- type was written. So, if we got a seed, there should be a query
					-- for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_query (l_seed) as l_query then
-- TODO: check that `l_query' is exported to `current_class'.
						if system_processor.qualified_anchored_types_cycle_detection_enabled then
							if l_query.type.depends_on_qualified_anchored_type (l_class) then
									-- Error: the type of the anchor appearing in a qualified
									-- anchored type should not depend on a qualified anchored type.
									-- This is a way to avoid cycles in qualified anchored types.
								set_fatal_error
								if not class_interface_error_only then
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
							end
						end
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, target_context)
						target_context.force_last (l_query.type)
						if l_first_context /= Void and l_first_adapted_base_class /= Void and l_first_query /= Void then
							if not target_context.same_named_context (l_first_context) then
									-- Two queries with the same seed and different result types.
								set_fatal_error
								error_handler.report_vgmc0e_error (current_class, current_class_impl, l_name, l_first_query, l_first_adapted_base_class, l_query, l_adapted_base_class)
							end
						elseif nb > 1 then
							l_first_context := other_context
							l_first_context.copy_type_context (target_context)
							l_first_adapted_base_class := l_adapted_base_class
							l_first_query := l_query
						end
						target_context.keep_first (l_target_context_count)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- type was written. So, if we got a seed, there should be a query
							-- for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					i := i + 1
				end
			end
			target_context.reset (tokens.unknown_class)
			other_context.reset (tokens.unknown_class)
			l_adapted_base_classes.wipe_out
			in_qualified_anchored_type := old_in_qualified_anchored_type
		end

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE)
			-- Check validity of `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
-- TODO: should we check whether class TUPLE is in the universe or not?
			if attached a_type.actual_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					if has_fatal_error then
						had_error := True
					end
					i := i + 1
				end
			end
			reset_fatal_error (had_error)
		end

feature {NONE} -- Multiple generic constraints

	check_adapted_base_classes_validity (a_name: ET_CALL_NAME; a_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Check validity of `a_adapted_base_classes' in case of multiple generic constraints
			-- when they are the possible base classes of a target of call name `a_name'.
			-- `a_context' represents the type of the target of the call.
			-- Keep in that list:
			-- * only one class when processing `a_name' in the class where the call
			--   was written, or
			-- * all applicable classes when `a_name' was already resolved in a proper
			--   ancestor (or in another generic derivation) of `current_class' where
			--   the call was written.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_adapted_base_classes_not_void: a_adapted_base_classes /= Void
			no_void_adapted_base_class: not a_adapted_base_classes.has_void
			a_context_not_void: a_context /= Void
			a_context_is_valid: a_context.is_valid_context
		do
			has_fatal_error := False
			adapted_base_class_checker.set_class_interface_error_only (class_interface_error_only)
			adapted_base_class_checker.check_adapted_base_classes_validity (a_name, a_adapted_base_classes, a_context, current_class, current_class_impl)
			if adapted_base_class_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			in_implementation_class: (current_class_impl = current_class or a_name.seed = 0) implies a_adapted_base_classes.count = 1
			not_in_implementation_class: (current_class_impl /= current_class and a_name.seed /= 0) implies across a_adapted_base_classes as i_adapted_base_class all a_name.is_tuple_label or else (not i_adapted_base_class.base_class.is_none implies i_adapted_base_class.base_class.seeded_feature (a_name.seed) /= Void) end
		end

	adapted_base_class_checker: ET_ADAPTED_BASE_CLASS_CHECKER
			-- Adapted base class checker

	adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			-- List of adapted base classes

feature -- Error reporting

	class_interface_error_only: BOOLEAN
			-- Should only the errors found when checking class interface (and before) be reported?

	set_class_interface_error_only (b: BOOLEAN)
			-- Set `class_interface_error_only' to `b'.
		do
			class_interface_error_only := b
		ensure
			class_interface_error_only_set: class_interface_error_only = b
		end

feature -- Client/Supplier relationship

	supplier_handler: detachable ET_SUPPLIER_HANDLER
			-- Supplier handler

	set_supplier_handler (a_handler: like supplier_handler)
			-- Set `supplier_handler' to `a_handler'.
		do
			supplier_handler := a_handler
		ensure
			supplier_handler_set: supplier_handler = a_handler
		end

feature {NONE} -- Client/Supplier relationship

	report_qualified_anchored_type_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE)
			-- Report the fact that `a_supplier' is the target type of a
			-- qualified anchored type in a feature or invariant in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
		do
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_qualified_anchored_type_supplier (a_supplier, a_client)
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			check_class_type_validity (a_type)
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		do
			check_like_current_validity (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			check_like_feature_validity (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			check_tuple_type_validity (a_type)
		end

feature {NONE} -- Access

	current_feature_impl: ET_CLOSURE
			-- Feature/invariant/inline agent where the type has been written

	current_class_impl: ET_CLASS
			-- Class where the type has been written
			-- (May be different from `current_class' when the
			-- code has been inherited from an ancestor)

	current_context: ET_TYPE_CONTEXT
			-- Context for the type being processed

	in_qualified_anchored_type: BOOLEAN
			-- Is the type being checked contained in a qualified anchored type?

feature {NONE} -- Implementation

	constraint_context: ET_NESTED_TYPE_CONTEXT
			-- Constraint context for type conformance checking

	target_context: ET_NESTED_TYPE_CONTEXT
			-- Context for type conformance checking

	other_context: ET_NESTED_TYPE_CONTEXT
			-- Context for type conformance checking

	dummy_feature: ET_FEATURE
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_class_impl_not_void: current_class_impl /= Void
	current_context_not_void: current_context /= Void
	valid_current_context: current_context.is_valid_context
	current_context_root_context: current_context.is_root_context
	current_class_definition: current_class = current_context.base_class
	current_feature_impl_not_void: current_feature_impl /= Void
	constraint_context_not_void: constraint_context /= Void
	target_context_not_void: target_context /= Void
	other_context_not_void: other_context /= Void
	adapted_base_class_checker_not_void: adapted_base_class_checker /= Void
	adapted_base_classes_not_void: adapted_base_classes /= Void
	no_void_adapted_base_class: not adapted_base_classes.has_void

end
