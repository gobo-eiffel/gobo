indexing

	description:

		"Eiffel class interface checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERFACE_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

	ET_SHARED_FEATURE_NAME_TESTER

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new interface checker for classes in `a_universe'.
		do
			precursor (a_universe)
			create parent_checker3.make (a_universe)
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Flatten fetaures of `a_class' is not already done.
			-- Then check validity of the constraint creations of
			-- formal parameters of `a_class' and of the actual
			-- paramaters of its parents after having done
			-- so for its parent classes recursively.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_interface_checked
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaad_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			interface_checked: a_class.interface_checked
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_interface_checked
			a_class.set_interface_error
		ensure then
			interface_checked: a_class.interface_checked
			has_interface_error: a_class.has_interface_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Flatten fetaures of `a_class' is not already done.
			-- Then check validity of the constraint creations of
			-- formal parameters of `a_class' and of the actual
			-- paramaters of its parents after having done
			-- so for its parent classes recursively.
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.interface_checked then
					-- Flatten features of `current_class' if not already done.
				current_class.process (universe.feature_flattener)
				if current_class.features_flattened and then not current_class.has_flattening_error then
					current_class.set_interface_checked
						-- Process parents first.
					a_parents := current_class.parents
					if a_parents = Void or else a_parents.is_empty then
						if current_class = universe.general_class then
							a_parents := Void
						elseif current_class = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY as class root now.
							a_parents := Void
						else
							a_parents := universe.any_parents
						end
					end
					if a_parents /= Void then
						nb := a_parents.count
						from i := 1 until i > nb loop
								-- This is a controlled recursive call to `internal_process_class'.
							a_parent_class := a_parents.parent (i).type.direct_base_class (universe)
							internal_process_class (a_parent_class)
							if a_parent_class.has_interface_error then
								set_fatal_error (current_class)
							end
							i := i + 1
						end
					end
					if not current_class.has_interface_error then
						error_handler.report_compilation_status (Current, current_class)
						check_constraint_creations_validity
						check_parents_validity
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			interface_checked: a_class.interface_checked
		end

feature {NONE} -- Constraint creation validity

	check_constraint_creations_validity is
			-- Check validity of the constraint creations
			-- of `current_class' if any.
		local
			a_formals: ET_FORMAL_PARAMETER_LIST
			i, nb: INTEGER
		do
			a_formals := current_class.formal_parameters
			if a_formals /= Void then
				nb := a_formals.count
				from i := 1 until i > nb loop
					check_constraint_creation_validity (a_formals.formal_parameter (i))
					i := i + 1
				end
			end
		end

	check_constraint_creation_validity (a_formal: ET_FORMAL_PARAMETER) is
			-- Check validity of the constraint creation
			-- of `a_formal' if any.
		require
			a_formal_not_void: a_formal /= Void
		local
			a_creator: ET_CONSTRAINT_CREATOR
			a_name, other_name: ET_FEATURE_NAME
			a_base_type: ET_BASE_TYPE
			a_procedure: ET_PROCEDURE
			a_query: ET_QUERY
			a_class: ET_CLASS
			i, j, nb: INTEGER
		do
			a_creator := a_formal.creation_procedures
			if a_creator /= Void then
				a_base_type := a_formal.constraint_base_type
				if a_base_type /= Void then
					a_class := a_base_type.direct_base_class (universe)
				else
						-- We know that the constraint is not
						-- void since we have a creation clause.
						-- So we must have something like that:
						-- "[G -> H create make end, H -> G]".
						-- We consider that the base class of the
						-- constraint in ANY in that case.
					a_class := universe.any_class
				end
					-- Build the feature table.
				a_class.process (universe.feature_flattener)
				if not a_class.features_flattened or else a_class.has_flattening_error then
					set_fatal_error (current_class)
				else
					nb := a_creator.count
					from i := 1 until i > nb loop
						a_name := a_creator.feature_name (i)
						from j := 1 until j >= i loop
							other_name := a_creator.feature_name (j)
							if other_name.same_feature_name (a_name) then
									-- Feature name appears twice in Creation clause.
									-- This is not considered as a fatal error.
								error_handler.report_vgcp3c_error (current_class, other_name, a_name)
							end
							j := j + 1
						end
						a_procedure := a_class.named_procedure (a_name)
						if a_procedure /= Void then
								-- We finally got a valid creation
								-- procedure. Record its seed.
							a_name.set_seed (a_procedure.first_seed)
						else
							a_query := a_class.named_query (a_name)
							if a_query /= Void then
									-- This feature is not a procedure.
								set_fatal_error (current_class)
								error_handler.report_vtgc0b_error (current_class, a_name, a_query, a_class)
							else
									-- This name is not the final name of
									-- a feature on `current_class'.
								set_fatal_error (current_class)
								error_handler.report_vtgc0a_error (current_class, a_name, a_class)
							end
						end
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Parents validity

	check_parents_validity is
			-- Check validity of parents of `current_class'.
		local
			old_class: ET_CLASS
		do
				-- There might be controlled recursive calls
				-- to `process', hence the following precaution
				-- with `current_class'.
			old_class := current_class
			current_class := unknown_class
			parent_checker3.check_parents_validity (old_class)
			if parent_checker3.has_fatal_error then
				set_fatal_error (old_class)
			end
			current_class := old_class
		end

	parent_checker3: ET_PARENT_CHECKER3
			-- Parent validity checker (third pass)

invariant

	parent3_checker_not_void: parent_checker3 /= Void

end
