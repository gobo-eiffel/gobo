indexing

	description:

		"Eiffel lists of features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_LIST

inherit

	ET_AST_LIST [ET_FEATURE]

creation

	make, make_with_capacity

feature -- Access

	named_feature (a_name: ET_FEATURE_NAME): ET_FEATURE is
			-- Feature named `a_name';
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_feature: ET_FEATURE
		do
			nb := count
			from i := 1 until i > nb loop
				a_feature := item (i)
				if a_feature.name.same_feature_name (a_name) then
					Result := a_feature
					i := nb + 1 -- Jump out of the loop
				else
					i := i + 1
				end
			end
		end

	seeded_feature (a_seed: INTEGER): ET_FEATURE is
			-- Feature with seed `a_seed';
			-- Void if no such feature
		local
			i, nb: INTEGER
			a_feature: ET_FEATURE
		do
			nb := count
			from i := 1 until i > nb loop
				a_feature := item (i)
				if a_feature.has_seed (a_seed) then
					Result := a_feature
					i := nb + 1 -- Jump out of the loop
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FEATURE] is
			-- Fixed array routines
		once
			create Result
		end

end
