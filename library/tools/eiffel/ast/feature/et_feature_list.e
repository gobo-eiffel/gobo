indexing

	description:

		"Eiffel lists of features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_LIST

inherit

	ET_HEAD_LIST [ET_FEATURE]

create

	make, make_with_capacity

feature -- Initialization

	reset is
			-- Reset features at index 1 to `declared_count' as they were just after it was last parsed.
		local
			i, nb: INTEGER
		do
				-- The code below takes advantage of the fact that the features
				-- are stored in `storage' from 'count - 1' to '0'.
			nb := count - declared_count
			from i := count - 1 until i < nb loop
				storage.item (i).reset
				i := i - 1
			end
		end

	reset_after_features_flattened is
			-- Reset features at index 1 to `declared_count' as they were just after its features were last flattened.
		local
			i, nb: INTEGER
		do
				-- The code below takes advantage of the fact that the features
				-- are stored in `storage' from 'count - 1' to '0'.
			nb := count - declared_count
			from i := count - 1 until i < nb loop
				storage.item (i).reset_after_features_flattened
				i := i - 1
			end
		end

feature -- Access

	named_feature (a_name: ET_CALL_NAME): like item is
			-- Feature named `a_name';
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			a_feature: like item
			an_id: ET_IDENTIFIER
			a_hash_code: INTEGER
			an_alias_name: ET_ALIAS_NAME
		do
				-- Benchmarks showed that it is more efficient to traverse the
				-- declared features first and then the inherited features.
				--
				-- The code below takes advantage of the fact that the features
				-- are stored in `storage' from 'count - 1' to '0'.
				--
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
					an_alias_name := a_feature.alias_name
					if an_alias_name /= Void and then an_alias_name.same_call_name (a_name) then
						Result := a_feature
						i := -1 -- Jump out of the loop
					else
						i := i - 1
					end
				end
			end
		end

	seeded_feature (a_seed: INTEGER): like item is
			-- Feature with seed `a_seed';
			-- Void if no such feature
		local
			i: INTEGER
			l_declared_count: INTEGER
			l, u, t: INTEGER
			l_first_seed: INTEGER
			done: BOOLEAN
			l_feature: like item
		do
				-- The code below takes advantage of the fact that the features
				-- are stored in `storage' from 'count - 1' to '0'.
			l_declared_count := count - declared_count
			if l_declared_count > 0 then
					-- Features above the `declared_count' thresold (i.e. inherited
					-- features), if any, can be sorted by decreasing first seed
					-- values. Look whether `a_seed' is one of these first seeds
					-- using binary search.
				from
					l := 0
					u := l_declared_count - 1
				until
					done
				loop
					if l = u then
						l_feature := storage.item (l)
						if l_feature.first_seed = a_seed then
							Result := l_feature
						end
						done := True
					elseif l + 1 = u then
						l_feature := storage.item (l)
						if l_feature.first_seed = a_seed then
							Result := l_feature
						else
							l_feature := storage.item (u)
							if l_feature.first_seed = a_seed then
								Result := l_feature
							end
						end
						done := True
					else
						t := l + (u - l) // 2
						l_feature := storage.item (t)
						l_first_seed := l_feature.first_seed
						if a_seed = l_first_seed then
							Result := l_feature
							done := True
						elseif a_seed < l_first_seed then
							u := t - 1
						else
							l := t + 1
						end
					end
				end
			end
			if Result = Void then
					-- If a feature with `a_seed' has not been found yet,
					-- then traverse all features, declared features first,
					-- and inspect all their seeds.
				from i := count - 1 until i < 0 loop
					l_feature := storage.item (i)
					if l_feature.has_seed (a_seed) then
						Result := l_feature
						i := -1 -- Jump out of the loop
					else
						i := i - 1
					end
				end
			end
		end

feature -- Measurement

	declared_count: INTEGER
			-- Number of features declared in the corresponding class
			-- (i.e. appearing in one of its feature clauses).
			-- Note that these features (at indexes between 1 and
			-- `declared_count') are kept in the same order as found
			-- in the feature clauses, whereas features above this
			-- threshold can be sorted by decreasing first seed values.

feature -- Setting

	set_declared_count (a_count: INTEGER) is
			-- Set `declared_count' to `a_count'.
		require
			a_count_large_enough: a_count >= 0
			a_count_small_enough: a_count <= count
		do
			declared_count := a_count
		ensure
			declared_count_set: declared_count = a_count
		end

feature -- Basic operations

	add_overloaded_features (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [like item]) is
			-- Add to `a_list' features whose name or overloaded name is `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has (Void)
		local
			i: INTEGER
			l_feature: like item
			l_id: ET_IDENTIFIER
			l_hash_code: INTEGER
			l_alias_name: ET_ALIAS_NAME
			l_overloaded_alias_name: ET_ALIAS_NAME
			l_found: BOOLEAN
		do
				-- The code below takes advantage of the fact that the features
				-- are stored in `storage' from 'count - 1' to '0'.
				--
				-- This assignment attempt is to avoid too many polymorphic
				-- calls to `same_feature_name'.
			l_id ?= a_name
			if l_id /= Void then
				l_hash_code := l_id.hash_code
				from i := count - 1 until i < 0 loop
					l_feature := storage.item (i)
					if not l_found and then l_hash_code = l_feature.hash_code and then l_id.same_feature_name (l_feature.name) then
						a_list.force_last (l_feature)
						l_found := True
					elseif l_id.same_feature_name (l_feature.overloaded_name) then
						a_list.force_last (l_feature)
					end
					i := i - 1
				end
			else
				from i := count - 1 until i < 0 loop
					l_feature := storage.item (i)
					l_alias_name := l_feature.alias_name
					l_overloaded_alias_name := l_feature.overloaded_alias_name
					if not l_found and then l_alias_name /= Void and then l_alias_name.same_call_name (a_name) then
						a_list.force_last (l_feature)
						l_found := True
					elseif l_overloaded_alias_name /= Void and then l_overloaded_alias_name.same_call_name (a_name) then
						a_list.force_last (l_feature)
					end
					i := i - 1
				end
			end
		ensure
			no_void_item: not a_list.has (Void)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FEATURE] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	declared_count_large_enough: declared_count >= 0
	declared_count_small_enough: declared_count <= count

end
