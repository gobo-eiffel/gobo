note

	description:

		"Eiffel type checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2012, Eric Bezault and others"
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
		undefine
			make
		redefine
			process_bit_feature,
			process_bit_n,
			process_class,
			process_class_type,
			process_generic_class_type,
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

	make
			-- Create a new type checker.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			current_type := tokens.unknown_class
			current_class_impl := tokens.unknown_class
			current_feature_impl := dummy_feature
			create constraint_context.make_with_capacity (current_class, 1)
		end

feature -- Validity checking

	check_type_validity (a_type: ET_TYPE; a_current_feature_impl: ET_CLOSURE; a_current_class_impl: ET_CLASS; a_current_type: ET_BASE_TYPE)
			-- Check validity of `a_type' written in `a_current_feature_impl' in
			-- `a_current_class_impl' viewed from `a_current_type'. Resolve
			-- identifiers (such as 'like identifier', 'BIT identifier',
			-- 'like {A}.identifier or 'like a.identifier') in type `a_type'
			-- if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_current_feature_impl_not_void: a_current_feature_impl /= Void
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
			-- no_cycle: no cycle in anchored types involved.
		local
			old_feature_impl: ET_CLOSURE
			old_type: ET_BASE_TYPE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
		do
			has_fatal_error := False
			old_feature_impl := current_feature_impl
			current_feature_impl := a_current_feature_impl
			old_type := current_type
			current_type := a_current_type
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_current_class_impl
			a_type.process (Current)
			current_class_impl := old_class_impl
			current_class := old_class
			current_type := old_type
			current_feature_impl := old_feature_impl
		end

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_current_class_impl: ET_CLASS; a_current_type: ET_BASE_TYPE; a_position: ET_POSITION)
			-- Check validity of `a_type' as a creation type written in `a_current_class_impl'
			-- and viewed from `a_current_type'. Note that `a_type' should already be a valid
			-- type by itself (call `check_type_validity' for that).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
			a_position_not_void: a_position /= Void
		local
			a_type_class: ET_CLASS
			a_base_class: ET_CLASS
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_named_actual: ET_NAMED_TYPE
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_creator: ET_CONSTRAINT_CREATOR
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			a_creation_procedure: ET_PROCEDURE
			an_index: INTEGER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_creator: ET_CONSTRAINT_CREATOR
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			has_formal_type_error: BOOLEAN
			i, nb: INTEGER
			j, nb2: INTEGER
			had_error: BOOLEAN
			old_type: ET_BASE_TYPE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
		do
			has_fatal_error := False
			old_type := current_type
			current_type := a_current_type
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_current_class_impl
			an_actuals := a_type.actual_parameters
			a_type_class := a_type.base_class
			a_type_class.process (current_system.interface_checker)
			if not a_type_class.interface_checked or else a_type_class.has_interface_error then
				set_fatal_error
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
						a_named_actual := an_actual.shallow_named_type (current_type)
						a_formal := a_formals.formal_parameter (i)
						a_creator := a_formal.creation_procedures
						if a_creator /= Void and then not a_creator.is_empty then
							a_base_class := a_named_actual.base_class (current_type)
							if attached {ET_FORMAL_PARAMETER_TYPE} a_named_actual as l_attached_formal_type then
								a_formal_type := l_attached_formal_type
								an_index := a_formal_type.index
								if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
										-- Internal error: `a_formal_parameter' is supposed to be
										-- a formal parameter of `current_type''s base class.
									has_formal_type_error := True
									set_fatal_error
									error_handler.report_giaaa_error
								else
									has_formal_type_error := False
									a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
									a_formal_creator := a_formal_parameter.creation_procedures
								end
							end
							nb2 := a_creator.count
							if nb2 > 0 then
								a_base_class.process (current_system.interface_checker)
								if not a_base_class.interface_checked or else a_base_class.has_interface_error then
									set_fatal_error
								else
									from j := 1 until j > nb2 loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										a_creation_procedure := a_base_class.seeded_procedure (a_seed)
										if a_creation_procedure = Void then
												-- Internal error: `a_type' is supposed to be a valid type.
											set_fatal_error
											error_handler.report_giaaa_error
										elseif a_formal_type /= Void then
											if not has_formal_type_error then
												if a_formal_creator = Void or else not a_formal_creator.has_feature (a_creation_procedure) then
													set_fatal_error
													error_handler.report_vtcg4b_error (current_class, current_class_impl, a_position, i, a_name, a_formal_parameter, a_type_class)
												end
											end
										elseif not a_creation_procedure.is_creation_exported_to (a_type_class, a_base_class) then
											if current_system.is_ise and then (current_class.is_deferred and an_actual.is_like_current) then
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
												(current_system.is_ise and then current_system.ise_version < ise_6_0_6_7358) and then
												(a_base_class.is_deferred and a_creation_procedure.has_seed (current_system.default_create_seed))
											then
												-- ISE started to report this VTCG error with version 6.0.6.7358.
												-- However we report it anyway, except when the creation procedure
												-- is the version of 'default_create' in a deferred class. There is
												-- no occurrence of the other cases in the code at AXA Rosenberg,
												-- and we don't want new occurrences to appear because it is dangerous
												-- at run-time (we may end up creating instances of deferred classes).
											else
												set_fatal_error
												error_handler.report_vtcg4a_error (current_class, current_class_impl, a_position, i, a_name, a_base_class, a_type_class)
											end
										end
										j := j + 1
									end
								end
							end
								-- Since the corresponding formal generic parameter
								-- has creation procedures associated with it, it
								-- is possible to create instances of `an_actual'
								-- through that means. So we need to check recursively
								-- its validity as a creation type.
							if attached {ET_CLASS_TYPE} a_named_actual as l_class_type then
								had_error := has_fatal_error
								check_creation_type_validity (l_class_type, current_class_impl, current_type, a_position)
								if had_error then
									set_fatal_error
								end
							end
						else
								-- We need to check whether `an_actual' is expanded.
								-- In that case the creation of an instance of that
								-- type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							if attached {ET_CLASS_TYPE} a_named_actual as l_class_type and then l_class_type.is_expanded then
								had_error := has_fatal_error
								check_creation_type_validity (l_class_type, current_class_impl, current_type, a_position)
								if had_error then
									set_fatal_error
								end
							end
						end
						i := i + 1
					end
				end
			end
			current_class_impl := old_class_impl
			current_class := old_class
			current_type := old_type
		end

feature -- Type conversion

	convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_FEATURE
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
				a_source_base_class.process (a_source_base_class.current_system.eiffel_parser)
			end
			Result := a_source_base_class.convert_to_feature (a_target_type, a_source_type)
			if Result = Void then
				a_target_base_class := a_target_type.base_class
					-- Make sure that the class has been parsed before
					-- asking for its conversion features.
				if a_target_base_class.is_preparsed then
					a_target_base_class.process (a_target_base_class.current_system.eiffel_parser)
				end
				Result := a_target_base_class.convert_from_feature (a_source_type, a_target_type)
			end
			if Result = Void then
				a_source_named_type := a_source_type.named_type
				if a_target_base_class.is_preparsed and then a_target_base_class.is_dotnet and a_target_base_class.is_system_object_class then
						-- Needed for Eiffel for .NET.
					create {ET_BUILTIN_CONVERT_FEATURE} Result.make (a_source_named_type)
				end
			end
		end

feature {NONE} -- Validity checking

	check_bit_feature_validity (a_type: ET_BIT_FEATURE)
			-- Check validity of `a_type'.
			-- Resolve identifier in 'BIT identifier' if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			a_query: ET_QUERY
			a_procedure: ET_PROCEDURE
		do
			has_fatal_error := False
-- TODO: should we check whether class BIT is in the universe or not?
			if a_type.constant = Void then
					-- Not resolved yet.
				current_class_impl.process (current_system.interface_checker)
				if not current_class_impl.interface_checked or else current_class_impl.has_interface_error then
					set_fatal_error
				else
					a_query := current_class_impl.named_query (a_type.name)
					if a_query /= Void then
						if attached {ET_CONSTANT_ATTRIBUTE} a_query as a_constant_attribute and then attached {ET_INTEGER_CONSTANT} a_constant_attribute.constant as a_constant then
							a_type.resolve_identifier_type (a_query.first_seed, a_constant)
							check_bit_type_validity (a_type)
						else
								-- VTBT error (ETL2 page 210): The identifier
								-- in Bit_type must be the final name of a
								-- constant attribute of type INTEGER.
							set_fatal_error
							if current_class = current_class_impl then
								error_handler.report_vtbt0a_error (current_class, a_type)
							else
-- TODO: this error should have already been reported when processing `current_class_impl'.
								error_handler.report_vtbt0a_error (current_class_impl, a_type)
							end
						end
					else
						a_procedure := current_class_impl.named_procedure (a_type.name)
						if a_procedure /= Void then
								-- VTBT error (ETL2 page 210): The identifier
								-- in Bit_type must be the final name of a
								-- constant attribute of type INTEGER.
							set_fatal_error
							if current_class = current_class_impl then
								error_handler.report_vtbt0a_error (current_class, a_type)
							else
-- TODO: this error should have already been reported when processing `current_class_impl'.
								error_handler.report_vtbt0a_error (current_class_impl, a_type)
							end
						else
								-- VTBT error (ETL2 page 210): The identifier
								-- in Bit_type must be the final name of a feature.
							set_fatal_error
							if current_class = current_class_impl then
								error_handler.report_vtbt0b_error (current_class, a_type)
							else
-- TODO: this error should have already been reported when processing `current_class_impl'.
								error_handler.report_vtbt0b_error (current_class_impl, a_type)
							end
						end
					end
				end
			end
		end

	check_bit_n_validity (a_type: ET_BIT_N)
			-- Check validity of `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			has_fatal_error := False
-- TODO: should we check whether class BIT is in the universe or not?
			-- The validity of the integer constant has
			-- already been checked during the parsing.
		end

	check_bit_type_validity (a_type: ET_BIT_TYPE)
			-- Check validity of the integer constant.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			constant_not_void: a_type.constant /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			has_fatal_error := False
			a_type.compute_size
			if a_type.has_size_error then
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vtbt0c_error (current_class, a_type)
				else
-- TODO: this error should have already been reported when processing `current_class_impl'.
					error_handler.report_vtbt0c_error (current_class_impl, a_type)
				end
			elseif a_type.size = 0 and a_type.constant.is_negative then
					-- Not considered as a fatal error by gelint.
				if current_class = current_class_impl then
					error_handler.report_vtbt0d_error (current_class, a_type)
				else
-- TODO: this error should have already been reported when processing `current_class_impl'.
					error_handler.report_vtbt0d_error (current_class_impl, a_type)
				end
			end
		end

	check_class_type_validity (a_type: ET_CLASS_TYPE)
			-- Check validity of `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_TYPE
			a_class: ET_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_class := a_type.base_class
			if a_class.is_none then
				if a_type.is_generic then
					set_fatal_error
					if current_class = current_class_impl then
						error_handler.report_vtug1a_error (current_class, a_type)
					else
-- TODO: this error should have already been reported when processing `current_class_impl'.
						error_handler.report_vtug1a_error (current_class_impl, a_type)
					end
				end
			elseif a_class.is_unknown then
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vtct0a_error (current_class, a_type)
				else
-- TODO: this error should have already been reported when processing `current_class_impl'.
					error_handler.report_vtct0a_error (current_class_impl, a_type)
				end
			else
				a_class.process (current_system.interface_checker)
				if not a_class.interface_checked then
					set_fatal_error
				elseif a_class.has_interface_error then
						-- Error should already have been
						-- reported somewhere else.
					set_fatal_error
				elseif not a_class.is_generic then
					if a_type.is_generic then
						set_fatal_error
						if current_class = current_class_impl then
							error_handler.report_vtug1a_error (current_class, a_type)
						else
-- TODO: this error should have already been reported when processing `current_class_impl'.
							error_handler.report_vtug1a_error (current_class_impl, a_type)
						end
					end
				elseif not a_type.is_generic then
					set_fatal_error
					if current_class = current_class_impl then
						error_handler.report_vtug2a_error (current_class, a_type)
					else
-- TODO: this error should have already been reported when processing `current_class_impl'.
						error_handler.report_vtug2a_error (current_class_impl, a_type)
					end
				else
					a_formals := a_class.formal_parameters
					an_actuals := a_type.actual_parameters
					check
						a_class_generic: a_formals /= Void
						a_type_generic: an_actuals /= Void
					end
					if an_actuals.count /= a_formals.count then
						set_fatal_error
						if current_class = current_class_impl then
							error_handler.report_vtug2a_error (current_class, a_type)
						else
-- TODO: this error should have already been reported when processing `current_class_impl'.
							error_handler.report_vtug2a_error (current_class_impl, a_type)
						end
					else
						nb := an_actuals.count
						from i := 1 until i > nb loop
							an_actual := an_actuals.type (i)
							had_error := has_fatal_error
							an_actual.process (Current)
							reset_fatal_error (has_fatal_error or had_error)
							a_formal := a_formals.formal_parameter (i)
							if a_formal.is_expanded then
								if not an_actual.is_type_expanded (current_type) then
									set_fatal_error
									error_handler.report_gvtcg5b_error (current_class, current_class_impl, a_type, an_actual, a_formal)
								end
							elseif a_formal.is_reference then
								if not an_actual.is_type_reference (current_type) then
									set_fatal_error
									error_handler.report_gvtcg5a_error (current_class, current_class_impl, a_type, an_actual, a_formal)
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
							constraint_context.set (a_type, current_type)
							if not an_actual.conforms_to_type (a_constraint, constraint_context, current_type) then
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
								error_handler.report_vtcg3a_error (current_class, current_class_impl, a_type, an_actual, a_constraint)
							end
							i := i + 1
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
			l_query: ET_QUERY
			args: ET_FORMAL_ARGUMENT_LIST
			l_index: INTEGER
			resolved: BOOLEAN
			l_feature: ET_FEATURE
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
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_name := a_type.name
						l_query := current_class.named_query (l_name)
						if l_query /= Void then
								-- This is a 'like feature'.
							a_type.resolve_like_feature (l_query)
							resolved := True
							if in_qualified_anchored_type then
								if  l_query.type.depends_on_qualified_anchored_type (current_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
							end
						else
								-- This has to be a 'like argument', otherwise this is an error.
								-- Note that 'like argument' is not a valid construct in ECMA Eiffel.
								-- This is supported here for backward compatibility.
							if attached {ET_FEATURE} current_feature_impl as l_attached_feature then
								l_feature := l_attached_feature
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
												if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
														-- Error: the type of the anchor appearing in a qualified
														-- anchored type should not depend on a qualified anchored type.
														-- This is a way to avoid cycles in qualified anchored types.
													set_fatal_error
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
							if l_feature /= Void then
								error_handler.report_vtat1b_error (current_class, l_feature, a_type)
							else
									-- 'like argument' not valid in inline agents and invariants.
								error_handler.report_vtat1a_error (current_class, a_type)
							end
						end
					end
				end
			elseif in_qualified_anchored_type then
				if l_seed /= 0 then
						-- Anchored type already resolved.
					if a_type.is_like_argument then
						if a_type.is_procedure then
							l_feature := current_class.seeded_procedure (l_seed)
						else
							l_feature := current_class.seeded_query (l_seed)
						end
						if l_feature /= Void then
							args := l_feature.arguments
							l_index := a_type.index
							if args /= Void and then l_index <= args.count then
								if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
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
						l_query := current_class.seeded_query (l_seed)
						if l_query /= Void then
							if  l_query.type.depends_on_qualified_anchored_type (current_class) then
									-- Error: the type of the anchor appearing in a qualified
									-- anchored type should not depend on a qualified anchored type.
									-- This is a way to avoid cycles in qualified anchored types.
								set_fatal_error
								error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
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
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_class: ET_CLASS
			old_in_qualified_anchored_type: BOOLEAN
		do
			has_fatal_error := False
			old_in_qualified_anchored_type := in_qualified_anchored_type
			in_qualified_anchored_type := True
			l_target_type := a_type.target_type
			l_target_type.process (Current)
			if not has_fatal_error then
				report_qualified_anchored_type_supplier (l_target_type, current_type)
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
						l_class := l_target_type.base_class (current_type)
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_query := l_class.named_query (a_type.name)
							if l_query /= Void then
								a_type.resolve_identifier_type (l_query.first_seed)
-- TODO: check that `l_query' is exported to `current_class'.
								if  l_query.type.depends_on_qualified_anchored_type (l_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
							else
									-- Error: there is no query with this final name.
								set_fatal_error
								error_handler.report_vtat1c_error (current_class, a_type, l_class)
							end
						end
					end
				else
					l_class := l_target_type.base_class (current_type)
					l_class.process (current_system.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
						set_fatal_error
					else
						l_query := l_class.seeded_query (l_seed)
						if l_query /= Void then
-- TODO: check that `l_query' is exported to `current_class'.
							if l_query.type.depends_on_qualified_anchored_type (l_class) then
									-- Error: the type of the anchor appearing in a qualified
									-- anchored type should not depend on a qualified anchored type.
									-- This is a way to avoid cycles in qualified anchored types.
								set_fatal_error
								error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
							end
						else
								-- Internal error: if we got a seed, then `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
			end
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
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
-- TODO: should we check whether class TUPLE is in the universe or not?
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
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

feature -- Client/Supplier relationship

	supplier_handler: ET_SUPPLIER_HANDLER
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
			if supplier_handler /= Void then
				supplier_handler.report_qualified_anchored_type_supplier (a_supplier, a_client)
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE)
			-- Process `a_type'.
		do
			check_bit_feature_validity (a_type)
		end

	process_bit_n (a_type: ET_BIT_N)
			-- Process `a_type'.
		do
			check_bit_n_validity (a_type)
		end

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

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE)
			-- Process `a_type'.
		do
			process_class_type (a_type)
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

	current_type: ET_BASE_TYPE
			-- Base type where the type appears

	in_qualified_anchored_type: BOOLEAN
			-- Is the type being checked contained in a qualified anchored type?

feature {NONE} -- Implementation

	constraint_context: ET_NESTED_TYPE_CONTEXT
			-- Constraint context for type conformance checking

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
	current_type_not_void: current_type /= Void
	valid_current_type: current_type.is_valid_context
	current_class_definition: current_class = current_type.base_class
	current_feature_impl_not_void: current_feature_impl /= Void
	constraint_context_not_void: constraint_context /= Void

end
