indexing

	description:

		"Eiffel flat implementation checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FLAT_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new flat implementation checker for classes in `a_universe'.
		do
			precursor (a_universe)
			create feature_checker.make (a_universe)
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Check interface of `a_class' is not already done.
			-- Then check the immediate and inherited features
			-- of `a_class' after having done so for its parent
			-- classes recursively.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_implementation_checked
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giabf_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			implementation_checked: a_class.implementation_checked
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_implementation_checked
			a_class.set_implementation_error
		ensure then
			implementation_checked: a_class.implementation_checked
			has_implementation_error: a_class.has_implementation_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Check interface of `a_class' is not already done.
			-- Then check the immediate and inherited features
			-- of `a_class' after having done so for its parent
			-- classes recursively.
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
			if not current_class.implementation_checked then
					-- Check interface of `current_class' if not already done.
				current_class.process (universe.interface_checker)
				if not current_class.has_interface_error then
					current_class.set_implementation_checked
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
							if a_parent_class.has_implementation_error then
								set_fatal_error (current_class)
							end
							i := i + 1
						end
					end
					if not current_class.has_implementation_error then
						error_handler.report_compilation_status (Current, current_class)
						check_features_validity
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			implementation_checked: a_class.implementation_checked
		end

feature {NONE} -- Feature validity

	check_features_validity is
			-- Check validity of immediate and inherited features
			-- of `current_class'.
		local
			a_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
			i, nb: INTEGER
		do
			a_features := current_class.features
			nb := a_features.count
			from i := 1 until i > nb loop
				a_feature := a_features.item (i)
				feature_checker.check_feature_validity (a_feature, current_class)
				i := i + 1
			end
		end

	feature_checker: ET_FEATURE_CHECKER
			-- Feature checker

invariant

	feature_checker_not_void: feature_checker /= Void

end
