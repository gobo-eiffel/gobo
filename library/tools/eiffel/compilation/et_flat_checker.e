indexing

	description:

		"Eiffel implementation checkers for the immediate and inherited features and invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FLAT_CHECKER

inherit

	ET_IMPLEMENTATION_CHECKER
		redefine
			check_features_validity,
			check_invariants_validity
		end

creation

	make

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
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
				i := i + 1
			end
		end

feature {NONE} -- Invariant validity

	check_invariants_validity is
			-- Check validity of invariants of `current_class'
			-- and of its proper ancestors.
		local
			an_invariants: ET_INVARIANTS
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			i, nb: INTEGER
		do
			an_invariants := current_class.invariants
			if an_invariants /= Void then
				invariant_checker.check_invariants_validity (an_invariants, current_class)
				if invariant_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			an_ancestors := current_class.ancestors
			nb := an_ancestors.count
			from i := 1 until i > nb loop
				an_ancestor := an_ancestors.item (i).direct_base_class (universe)
				an_invariants := an_ancestor.invariants
				if an_invariants /= Void then
					invariant_checker.check_invariants_validity (an_invariants, an_ancestor)
					if invariant_checker.has_fatal_error then
						set_fatal_error (current_class)
					end
				end
				i := i + 1
			end
		end
end
