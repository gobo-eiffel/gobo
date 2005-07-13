indexing

	description:

		"Eiffel implementation checkers for features and invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IMPLEMENTATION_CHECKER

inherit

	ET_CLASS_PROCESSOR
		rename
			make as make_class_processor
		redefine
			process_class
		end

create

	make, make_with_feature_checker

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new implementation checker for classes in `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			make_class_processor (a_universe)
			create feature_checker.make (a_universe)
		ensure
			universe_set: universe = a_universe
		end

	make_with_feature_checker (a_universe: like universe; a_feature_checker: like feature_checker) is
			-- Create a new implementation checker for classes in `a_universe'
			-- using `a_feature_checker' to check the feature implementation
			-- and their assertions.
		require
			a_universe_not_void: a_universe /= Void
			a_feature_checker_not_void: a_feature_checker /= Void
		do
			make_class_processor (a_universe)
			feature_checker := a_feature_checker
		ensure
			universe_set: universe = a_universe
			feature_checker_set: feature_checker = a_feature_checker
		end

feature -- Status report

	flat_mode: BOOLEAN
			-- Process flat form of `current_class'

	short_mode: BOOLEAN
			-- Process short form of `current_class'

feature -- Status setting

	set_flat_mode (b: BOOLEAN) is
			-- Set `flat_mode' to `b'.
		do
			flat_mode := b
		ensure
			flat_mode_set: flat_mode = b
		end

	set_short_mode (b: BOOLEAN) is
			-- Set `short_mode' to `b'.
		do
			short_mode := b
		ensure
			short_mode_set: short_mode = b
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Check interface of `a_class' is not already done.
			-- Then check the immediate and redeclared features
			-- of `a_class' and its invariants after having done
			-- so for its parent classes recursively.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_implementation_checked
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaae_error
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
			-- Then check the immediate and redeclared features
			-- of `a_class' and its invariants after having done
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
			if not current_class.implementation_checked then
					-- Check interface of `current_class' if not already done.
				current_class.process (universe.interface_checker)
				if current_class.interface_checked and then not current_class.has_interface_error then
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
						check_invariants_validity
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
			-- Check validity of immediate and redeclared features
			-- of `current_class'.
		local
			a_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
			i, nb: INTEGER
		do
			a_features := current_class.features
			if flat_mode then
				nb := a_features.count
			else
				nb := current_class.declared_feature_count
			end
			from i := 1 until i > nb loop
				a_feature := a_features.item (i)
				feature_checker.check_feature_validity (a_feature, current_class)
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
				check_assertions_validity (a_feature, a_feature)
				i := i + 1
			end
		end

	feature_checker: ET_FEATURE_CHECKER
			-- Feature checker

feature {NONE} -- Assertion validity

	check_assertions_validity (a_feature_impl, a_feature: ET_FEATURE) is
			-- Check validity of pre- and postconditions of `a_feature_impl' in `current_class'.
			-- `a_feature' is the version of `a_feature_impl' in `current_class' (useful
			-- when processing inherited assertions).
		require
			a_feature_impl_not_void: a_feature_impl /= Void
			a_feature_not_void: a_feature /= Void
		local
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_class_impl: ET_CLASS
			had_error: BOOLEAN
			l_first_precursor: ET_FEATURE
			l_other_precursors: ET_FEATURE_LIST
			i, nb: INTEGER
		do
			a_preconditions := a_feature_impl.preconditions
			if a_preconditions /= Void then
				feature_checker.check_preconditions_validity (a_preconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					had_error := True
					set_fatal_error (current_class)
				end
			end
			a_postconditions := a_feature_impl.postconditions
			if a_postconditions /= Void then
				feature_checker.check_postconditions_validity (a_postconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					had_error := True
					set_fatal_error (current_class)
				end
			end
			a_class_impl := a_feature_impl.implementation_class
			if current_class = a_class_impl then
				a_feature.set_assertions_checked
				if had_error then
					a_feature.set_assertions_error
				end
			end
			if flat_mode then
				l_first_precursor := a_feature_impl.first_precursor
				if l_first_precursor /= Void then
					check_assertions_validity (l_first_precursor, a_feature)
					l_other_precursors := a_feature_impl.other_precursors
					if l_other_precursors /= Void then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							check_assertions_validity (l_other_precursors.item (i), a_feature)
							i := i + 1
						end
					end
				end
			end
		end

	check_invariants_validity is
			-- Check validity of invariants of `current_class',
			-- and of its proper ancestors in flat mode.
		local
			an_invariants: ET_INVARIANTS
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			i, nb: INTEGER
		do
			an_invariants := current_class.invariants
			if an_invariants /= Void then
				feature_checker.check_invariants_validity (an_invariants, current_class)
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			if flat_mode then
				an_ancestors := current_class.ancestors
				nb := an_ancestors.count
				from i := 1 until i > nb loop
					an_ancestor := an_ancestors.item (i).direct_base_class (universe)
					an_invariants := an_ancestor.invariants
					if an_invariants /= Void then
						feature_checker.check_invariants_validity (an_invariants, an_ancestor)
						if feature_checker.has_fatal_error then
							set_fatal_error (current_class)
						end
					end
					i := i + 1
				end
			end
		end

invariant

	feature_checker_not_void: feature_checker /= Void

end
