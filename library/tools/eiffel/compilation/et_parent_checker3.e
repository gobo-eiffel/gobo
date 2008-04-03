indexing

	description:

		"Eiffel parent validity third pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
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
		undefine
			make
		redefine
			process_class,
			process_class_type,
			process_generic_class_type
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new parent third pass checker.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			create classes_to_be_processed.make (10)
		end

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS) is
			-- Third pass of the validity check of parents of `a_class'.
			-- Check the creation procedures of formal parameters.
			-- Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
			other_class: ET_CLASS
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_parents := current_class.parents
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					a_parents.parent (i).type.process (Current)
					i := i + 1
				end
				from
				until
					classes_to_be_processed.is_empty
				loop
					other_class := classes_to_be_processed.last
					classes_to_be_processed.remove_last
					other_class.process (current_system.interface_checker)
					if not other_class.interface_checked or else other_class.has_interface_error then
						set_fatal_error
					end
				end
			end
			current_class := a_class
		end

feature {NONE} -- Parent validity

	check_class_type_validity (a_type: ET_CLASS_TYPE) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Check whether the
			-- actual generic parameters of `a_type' are equipped with
			-- the creation procedures listed in the corresponding formal
			-- parameters' constraints. Set `has_fatal_error' if an error
			-- occurred.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_creator: ET_CONSTRAINT_CREATOR
			a_class: ET_CLASS
			an_actual_class: ET_CLASS
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			an_index: INTEGER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_creator: ET_CONSTRAINT_CREATOR
			has_formal_type_error: BOOLEAN
			j, nb2: INTEGER
			a_class_type: ET_CLASS_TYPE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			a_creation_procedure: ET_PROCEDURE
			a_constraint_class: ET_CLASS
			a_constraint_base_type: ET_BASE_TYPE
			a_constraint_error: BOOLEAN
		do
			a_class := a_type.base_class
			if not a_class.interface_checked then
				classes_to_be_processed.force_last (a_class)
			end
			if a_class.is_generic then
				a_formals := a_class.formal_parameters
				check a_class_generic: a_formals /= Void end
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
							an_actual_class := an_actual.base_class (current_class)
							a_formal_type ?= an_actual
							if a_formal_type /= Void then
								an_index := a_formal_type.index
								if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
										-- Internal error: `a_formal_parameter' is supposed
										-- to be a formal parameter of `current_class'.
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
									-- Note that we already checked in ET_PARENT_CHECKER1 that
									-- `an_actual_class' had to be preparsed.
								an_actual_class.process (current_system.feature_flattener)
								if not an_actual_class.features_flattened or else an_actual_class.has_flattening_error then
									set_fatal_error
								elseif a_class.interface_checked and then a_class.has_interface_error then
										-- If the interface has already been checked but at error
										-- has been found, then we have to stop here. The case
										-- where the interface has not been checked will be taken
										-- care of below.
									set_fatal_error
								else
									from j := 1 until j > nb2 loop
										a_name := a_creator.feature_name (j)
										a_constraint_error := False
										if a_class.interface_checked then
											a_seed := a_name.seed
										else
												-- Compute the seed of the creation procedure here.
												-- Do not report error, that will be done when `a_class' will be
												-- processed (it has been put in `classes_to_be_processed').
											a_constraint_base_type := a_formal.constraint_base_type
											if a_constraint_base_type /= Void then
												a_constraint_class := a_constraint_base_type.base_class
											else
													-- We know that the constraint is not
													-- void since we have a creation clause.
													-- So we must have something like that:
													-- "[G -> H create make end, H -> G]".
													-- We consider that the base class of the
													-- constraint in ANY in that case.
												a_constraint_class := current_system.any_class
											end
												-- Build the feature table.
											a_constraint_class.process (current_system.feature_flattener)
											if not a_constraint_class.features_flattened or else a_constraint_class.has_flattening_error then
												a_constraint_error := True
											else
												a_creation_procedure := a_constraint_class.named_procedure (a_name)
												if a_creation_procedure /= Void then
													a_seed := a_creation_procedure.first_seed
												else
													a_constraint_error := True
												end
											end
										end
										if a_constraint_error then
											set_fatal_error
										else
											a_creation_procedure := an_actual_class.seeded_procedure (a_seed)
											if a_creation_procedure = Void then
													-- Internal error: the conformance of the actual
													-- parameter to its generic constraint has been
													-- checked during the second pass.
												set_fatal_error
												error_handler.report_giaaa_error
											elseif a_formal_type /= Void then
												if not has_formal_type_error then
													if a_formal_creator = Void or else not a_formal_creator.has_feature (a_creation_procedure) then
														set_fatal_error
														error_handler.report_vtcg4b_error (current_class, current_class, a_type.position, i, a_name, a_formal_parameter, a_class)
													end
												end
											elseif not a_creation_procedure.is_creation_exported_to (a_class, an_actual_class) then
												set_fatal_error
												error_handler.report_vtcg4a_error (current_class, current_class, a_type.position, i, a_name, an_actual_class, a_class)
											end
											j := j + 1
										end
									end
								end
							end
								-- Since the corresponding formal generic parameter
								-- has creation procedures associated with it, it
								-- is possible to create instances of `an_actual'
								-- through that means. So we need to check recursively
								-- its validity as a creation type.
-- TODO: I think that we should take care of the case where `an_actual' is a tuple,
-- eg: inherit   FOO [TUPLE [MY_EXPANDED [BAR]]
-- Somehow, `process_tuple_type' has not been included in this class.
							an_actual.process (Current)
						else
								-- We need to check whether `an_actual' is expanded.
								-- In that case the creation of an instance of that
								-- type will be implicit, so we need to check recursively
								-- its validity as a creation type.
							a_class_type ?= an_actual
							if a_class_type /= Void and then a_class_type.is_expanded then
								an_actual.process (Current)
							end
						end
						i := i + 1
					end
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			check_class_type_validity (a_type)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

feature {NONE} -- Access

	classes_to_be_processed: DS_ARRAYED_LIST [ET_CLASS]
			-- Classes that need to be processed

invariant

	classes_to_be_processed_not_void: classes_to_be_processed /= Void
	no_void_class_to_be_processed: not classes_to_be_processed.has (Void)

end
