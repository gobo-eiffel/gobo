indexing

	description:

		"Eiffel type checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPE_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_feature,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_like_feature,
			process_qualified_braced_type,
			process_qualified_like_current,
			process_qualified_like_feature,
			process_qualified_like_type,
			process_tuple_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new type checker.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when resolving last type?

feature -- Validity checking

	check_type_validity (a_type: ET_TYPE; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_type' when it appears in `a_feature' viewed
			-- from `a_class'. Resolve identifiers (such as 'like identifier'
			-- and 'BIT identifier') in type `a_type' if not already done.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			internal_call := True
			a_type.process (Current)
			internal_call := False
			current_class := old_class
			current_feature := old_feature
		end

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_feature: ET_FEATURE; a_class: ET_CLASS; a_position: ET_POSITION) is
			-- Check validity of `a_type' as base type of a creation type
			-- appearing in `a_feature' and viewed from `a_class'. Note that
			-- `a_type' should already be a valid type by itself (call
			-- `check_type_validity' for that).
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_position_not_void: a_position /= Void
		local
			a_type_class: ET_CLASS
			a_base_class: ET_CLASS
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_creator: ET_CONSTRAINT_CREATOR
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			a_creation_feature: ET_FEATURE
			a_class_type: ET_CLASS_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			an_index: INTEGER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_creator: ET_CONSTRAINT_CREATOR
			has_formal_type_error: BOOLEAN
			i, nb: INTEGER
			j, nb2: INTEGER
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			an_actuals := a_type.actual_parameters
			if an_actuals /= Void and then not an_actuals.is_empty then
				a_type_class := a_type.direct_base_class (universe)
				a_formals := a_type_class.formal_parameters
				nb := an_actuals.count
				if a_formals = Void or else a_formals.count /= nb then
						-- Internal error: `a_type' is supposed to be a valid type.
					set_fatal_error
					error_handler.report_giaay_error
				else
					a_formal_parameters := a_class.formal_parameters
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						a_formal := a_formals.formal_parameter (i)
						a_creator := a_formal.creation_procedures
						if a_creator /= Void and then not a_creator.is_empty then
							a_base_class := an_actual.base_class (a_class, universe)
							a_formal_type ?= an_actual
							if a_formal_type /= Void then
								an_index := a_formal_type.index
								if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
										-- Internal error: `a_formal_parameter' is supposed
										-- to be a formal parameter of `a_class'.
									has_formal_type_error := True
									set_fatal_error
									error_handler.report_giabi_error
								else
									has_formal_type_error := False
									a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
									a_formal_creator := a_formal_parameter.creation_procedures
								end
							end
							nb2 := a_creator.count
							if nb2 > 0 then
								a_base_class.process (universe.interface_checker)
								if a_base_class.has_interface_error then
									set_fatal_error
								else
									from j := 1 until j > nb2 loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										a_creation_feature := a_base_class.seeded_feature (a_seed)
										if a_creation_feature = Void then
												-- Internal error: `a_type' is supposed to be a valid type.
											set_fatal_error
											error_handler.report_giabj_error
										elseif a_formal_type /= Void then
											if not has_formal_type_error then
												if a_formal_creator = Void or else not a_formal_creator.has_feature (a_creation_feature) then
													set_fatal_error
													a_class_impl := a_feature.implementation_class
													if a_class = a_class_impl then
														error_handler.report_vtcg4c_error (a_class, a_position, i, a_name, a_formal_parameter, a_type_class)
													else
														error_handler.report_vtcg4d_error (a_class, a_class_impl, a_position, i, a_name, a_formal_parameter, a_type_class)
													end
												end
											end
										elseif
											not a_creation_feature.is_creation_exported_to (a_type_class, a_base_class, universe.ancestor_builder) and then
											(a_base_class.creators /= Void or else not a_creation_feature.has_seed (universe.default_create_seed))
										then
											set_fatal_error
											a_class_impl := a_feature.implementation_class
											if a_class = a_class_impl then
												error_handler.report_vtcg4a_error (a_class, a_position, i, a_name, a_base_class, a_type_class)
											else
												error_handler.report_vtcg4b_error (a_class, a_class_impl, a_position, i, a_name, a_base_class, a_type_class)
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
							a_class_type ?= an_actual
							if a_class_type /= Void then
								check
									is_base_type: a_class_type.is_base_type
								end
								had_error := has_fatal_error
								check_creation_type_validity (a_class_type, a_feature, a_class, a_position)
								if had_error then
									set_fatal_error
								end
							end
						else
								-- We need to check whether `an_actual' is expanded.
								-- In that case the creation of an instance of that
								-- type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							a_class_type ?= an_actual
							if a_class_type /= Void and then a_class_type.is_expanded then
								check
									is_base_type: a_class_type.is_base_type
								end
								had_error := has_fatal_error
								check_creation_type_validity (a_class_type, a_feature, a_class, a_position)
								if had_error then
									set_fatal_error
								end
							end
						end
						i := i + 1
					end
				end
			end
		end

	resolved_formal_parameters (a_type: ET_TYPE; a_feature: ET_FEATURE; a_class: ET_CLASS): ET_TYPE is
			-- Replace formal generic parameters in `a_type' by their
			-- corresponding actual parameters if the class where
			-- `a_type' appears is generic and is not `a_class'.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			a_class_impl: ET_CLASS
			an_ancestor: ET_BASE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			has_fatal_error := False
			a_class_impl := a_feature.implementation_class
			if a_class_impl /= a_class and then a_class_impl.is_generic then
					-- We need to replace formal generic parameters in
					-- `a_type' by their corresponding actual parameters.
				a_class.process (universe.ancestor_builder)
				if a_class.has_ancestors_error then
					set_fatal_error
				else
					an_ancestor := a_class.ancestor (a_class_impl, universe)
					if an_ancestor = Void then
							-- Internal error: `a_class' is a descendant of `a_class_impl'.
						set_fatal_error
						error_handler.report_giaba_error
					else
						a_parameters := an_ancestor.actual_parameters
						if a_parameters = Void then
								-- Internal error: we said that `a_class_impl' was generic.
							set_fatal_error
							error_handler.report_giabb_error
						else
							Result := a_type.resolved_formal_parameters (a_parameters)
						end
					end
				end
			else
				Result := a_type
			end
		ensure
			resolved_type_not_void: not has_fatal_error implies Result /= Void
		end

feature {NONE} -- Validity checking

	check_bit_feature_validity (a_type: ET_BIT_FEATURE) is
			-- Resolve 'BIT identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			a_feature: ET_FEATURE
			a_constant: ET_INTEGER_CONSTANT
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
		do
			a_feature := current_class.named_feature (a_type.name)
			if a_feature /= Void then
				a_constant_attribute ?= a_feature.flattened_feature
				if a_constant_attribute /= Void then
					a_constant ?= a_constant_attribute.constant
				end
				if a_constant /= Void then
					a_type.resolve_identifier_type (a_feature.first_seed, a_constant)
					check_bit_type_validity (a_type)
				else
						-- VTBT error (ETL2 page 210): The identifier
						-- in Bit_type must be the final name of a
						-- constant attribute of type INTEGER.
					set_fatal_error
					error_handler.report_vtbt0a_error (current_class, a_type)
				end
			else
					-- VTBT error (ETL2 page 210): The identifier
					-- in Bit_type must be the final name of a feature.
				set_fatal_error
				error_handler.report_vtbt0b_error (current_class, a_type)
			end
		end

	check_bit_type_validity (a_type: ET_BIT_TYPE) is
			-- Check validity of the integer constant.
		require
			a_type_not_void: a_type /= Void
			constant_not_void: a_type.constant /= Void
		do
			a_type.compute_size
			if a_type.has_size_error then
				set_fatal_error
				error_handler.report_vtbt0c_error (current_class, a_type)
			elseif a_type.size = 0 and a_type.constant.is_negative then
					-- Not considered as a fatal error by gelint.
				error_handler.report_vtbt0d_error (current_class, a_type)
			end
		end

	check_like_feature_validity (a_type: ET_LIKE_FEATURE) is
			-- Resolve 'like identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			a_name: ET_FEATURE_NAME
			a_feature: ET_FEATURE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
			an_argument_name: ET_IDENTIFIER
			resolved: BOOLEAN
		do
			a_name := a_type.name
			a_feature := current_class.named_feature (a_name)
			if a_feature /= Void then
					-- This is a 'like feature'.
				a_type.resolve_like_feature (a_feature.first_seed)
				resolved := True
			elseif current_feature /= Void then
					-- This has to be a 'like argument', otherwise
					-- this is an error.
				an_argument_name ?= a_name
				if an_argument_name /= Void then
					args := current_feature.arguments
					if args /= Void then
						an_index := args.index_of (an_argument_name)
						if an_index /= 0 then
							a_type.resolve_like_argument (current_feature.first_seed, an_index)
							resolved := True
						end
					end
				end
			end
			if not resolved then
				set_fatal_error
				if current_feature /= Void then
					error_handler.report_vtat1b_error (current_class, current_feature, a_type)
				else
					error_handler.report_vtat1a_error (current_class, a_type)
				end
			end
		end

	check_qualified_like_current_validity (a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Resolve 'identifier' in 'like Current.identifier'.
		require
			a_type_not_void: a_type /= Void
		local
			a_feature: ET_FEATURE
		do
				-- We consider 'like Current.b' as a 'like b'.
			a_feature := current_class.named_feature (a_type.name)
			if a_feature /= Void then
				a_type.resolve_identifier_type (a_feature.first_seed)
			else
				set_fatal_error
				error_handler.report_vtat1c_error (current_class, a_type)
			end
		end

	check_qualified_type_validity (a_type: ET_QUALIFIED_TYPE) is
			-- Resolve 'identifier' in 'like identifier.b'
			-- and 'like {like identifier}.b'.
		require
			a_type_not_void: a_type /= Void
		do
			check_type_validity (a_type.target_type, current_feature, current_class)
		end

	check_actual_parameters_validity (a_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Resolve the actual parameter types.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				check_type_validity (a_parameters.type (i), current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_bit_feature_validity (a_type)
			end
		end

	process_class (a_type: ET_CLASS) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					check_actual_parameters_validity (a_parameters)
				end
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_like_feature_validity (a_type)
			end
		end

	process_qualified_braced_type (a_type: ET_QUALIFIED_BRACED_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_qualified_type_validity (a_type)
			end
		end

	process_qualified_like_current (a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_qualified_like_current_validity (a_type)
			end
		end

	process_qualified_like_feature (a_type: ET_QUALIFIED_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_qualified_type_validity (a_type)
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_qualified_type_validity (a_type)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					check_actual_parameters_validity (a_type.actual_parameters)
				end
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_class: ET_CLASS
			-- Class where the type appears

	current_feature: ET_FEATURE
			-- Feature where the type appears;
			-- Void if the type does not appear in a feature

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

invariant

	current_class_not_void: current_class /= Void
	current_feature_registered: current_feature /= Void implies current_feature.is_registered

end
