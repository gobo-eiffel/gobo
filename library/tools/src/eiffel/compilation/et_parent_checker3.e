note

	description:

		"Eiffel parent validity third pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_CHECKER3

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
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new parent third pass checker.
		do
			precursor (a_system_processor)
		end

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS)
			-- Third pass of the validity check of parents of `a_class'.
			-- Check the creation procedures of formal parameters.
			-- Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			l_parent_list: ET_PARENT_LIST
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if attached current_class.parent_clauses as l_parents then
				nb := l_parents.count
				from i := 1 until i > nb loop
					l_parent_list := l_parents.item (i)
					nb2 := l_parent_list.count
					from j := 1 until j > nb2 loop
						l_parent_list.parent (j).type.process (Current)
						j := j + 1
					end
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Parent validity

	check_class_type_validity (a_type: ET_CLASS_TYPE)
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Check whether the
			-- actual generic parameters of `a_type' are equiped with
			-- the creation procedures listed in the corresponding formal
			-- parameters' constraints. Set `has_fatal_error' if an error
			-- occurred.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actuals: detachable ET_ACTUAL_PARAMETERS
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_creator: detachable ET_CONSTRAINT_CREATOR
			a_class: ET_CLASS
			an_actual_class: ET_CLASS
			an_index: INTEGER
			a_formal_parameters: detachable ET_FORMAL_PARAMETER_LIST
			a_formal_parameter: detachable ET_FORMAL_PARAMETER
			a_formal_creator: detachable ET_CONSTRAINT_CREATOR
			j, nb_creators: INTEGER
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
		do
			a_class := a_type.base_class
			a_class.process (system_processor.interface_checker)
			if not a_class.interface_checked_successfully then
				set_fatal_error
			elseif a_class.is_generic and then attached a_class.formal_parameters as a_formals then
				an_actuals := a_type.actual_parameters
				if an_actuals = Void or else an_actuals.count /= a_formals.count then
						-- Error already reported during first pass of
						-- parent validity checking.
					set_fatal_error
				else
					a_formal_parameters := current_class.formal_parameters
					nb := an_actuals.count
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						a_formal := a_formals.formal_parameter (i)
						a_creator := a_formal.creation_procedures
						if a_creator /= Void and then not a_creator.is_empty then
							nb_creators := a_creator.count
							if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as a_formal_type then
								an_index := a_formal_type.index
								if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
										-- Internal error: `a_formal_parameter' is supposed
										-- to be a formal parameter of `current_class'.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
									a_formal_creator := a_formal_parameter.creation_procedures
									from j := 1 until j > nb_creators loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										if attached a_name.target_type as l_target_type then
											an_actual_class := l_target_type.base_class (current_class)
										else
											an_actual_class := a_formal_type.base_class (current_class)
										end
										an_actual_class.process (system_processor.feature_flattener)
										if not an_actual_class.features_flattened_successfully then
											set_fatal_error
										elseif not attached an_actual_class.seeded_procedure (a_seed) as a_creation_procedure then
												-- Internal error: the conformance of the actual
												-- parameter to its generic constraint has been
												-- checked during the second pass.
											set_fatal_error
											error_handler.report_giaaa_error
										elseif a_formal_creator = Void or else not a_formal_creator.has_feature (a_creation_procedure) then
											set_fatal_error
											error_handler.report_vtcg4b_error (current_class, current_class, a_type.position, i, a_name, a_formal_parameter, a_class)
										end
										j := j + 1
									end
								end
							else
									-- Note that we already checked in ET_PARENT_CHECKER1 that
									-- `an_actual_class' had to be preparsed.
								an_actual_class := an_actual.base_class (current_class)
								an_actual_class.process (system_processor.feature_flattener)
								if not an_actual_class.features_flattened_successfully then
									set_fatal_error
								else
									from j := 1 until j > nb_creators loop
										a_name := a_creator.feature_name (j)
										a_seed := a_name.seed
										if not attached an_actual_class.seeded_procedure (a_seed) as a_creation_procedure then
												-- Internal error: the conformance of the actual
												-- parameter to its generic constraint has been
												-- checked during the second pass.
											set_fatal_error
											error_handler.report_giaaa_error
										elseif not a_creation_procedure.is_creation_exported_to (a_class, an_actual_class, system_processor) then
											set_fatal_error
											error_handler.report_vtcg4a_error (current_class, current_class, a_type.position, i, a_name, an_actual_class, a_class)
										end
										j := j + 1
									end
								end
									-- Since the corresponding formal generic parameter
									-- has creation procedures associated with it, it
									-- is possible to create instances of `an_actual'
									-- through that means. So we need to check recursively
									-- its validity as a creation type.
								an_actual.process (Current)
							end
						elseif attached {ET_CLASS_TYPE} an_actual as a_class_type and then a_class_type.is_expanded then
								-- If `an_actual' is expanded, then the creation of an instance
								-- of that type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							a_class_type.process (Current)
						end
						i := i + 1
					end
				end
			end
		end

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE)
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Check whether the
			-- actual generic parameters of `a_type' are equiped with
			-- the creation procedures listed in the corresponding formal
			-- parameters' constraints. Set `has_fatal_error' if an error
			-- occurred.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
		do
				-- This covers the case where we have:
				--    inherit   FOO [TUPLE [MY_EXPANDED [BAR]]
				-- and FOO was declared as:
				--    class FOO [G -> TUPLE create default_create end]
			if attached a_type.actual_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if attached {ET_CLASS_TYPE} a_parameters.type (i) as a_class_type and then a_class_type.is_expanded then
							-- If the actual parameter is expanded, then the creation of an instance
							-- of that type will be implicit, so we need to check recursively
							-- its validity as a creation type.
						a_class_type.process (Current)
					end
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			check_class_type_validity (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			check_tuple_type_validity (a_type)
		end

end
