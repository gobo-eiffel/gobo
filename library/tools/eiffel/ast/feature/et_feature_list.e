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

	ET_HEAD_LIST [ET_FEATURE]

create

	make, make_with_capacity

feature -- Access

	named_feature (a_name: ET_FEATURE_NAME): ET_FEATURE is
			-- Feature named `a_name';
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			a_feature: ET_FEATURE
			an_id: ET_IDENTIFIER
			a_hash_code: INTEGER
			an_alias_name: ET_ALIAS_NAME
		do
				-- This assignment attempt is to avoid too many polymorphic
				-- calls to `same_feature_name'.
			an_id ?= a_name
			if an_id /= Void then
				a_hash_code := an_id.hash_code
				from i := count - 1 until i < 0 loop
					a_feature := storage.item (i)
					if a_hash_code = a_feature.hash_code then
						if an_id.same_feature_name (a_feature.name) then
							Result := a_feature
							i := -1 -- Jump out of the loop
						else
							i := i - 1
						end
					else
						i := i - 1
					end
				end
			else
				from i := count - 1 until i < 0 loop
					a_feature := storage.item (i)
					if a_feature.name.same_feature_name (a_name) then
						Result := a_feature
						i := -1 -- Jump out of the loop
					else
						an_alias_name := a_feature.alias_name
						if an_alias_name /= Void and then an_alias_name.same_feature_name (a_name) then
							Result := a_feature
							i := -1 -- Jump out of the loop
						else
							i := i - 1
						end
					end
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
			nb := count - 1
			from i := 0 until i > nb loop
				a_feature := storage.item (i)
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
