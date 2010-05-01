note

	description:

		"Eiffel comma-separated lists of feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_NAME_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_FEATURE_NAME_ITEM]

feature -- Initialization

	reset is
			-- Reset feature names as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).feature_name.reset
				i := i + 1
			end
		end

feature -- Access

	feature_name (i: INTEGER): ET_FEATURE_NAME is
			-- Feature name at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).feature_name
		ensure
			feature_name_not_void: Result /= Void
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current list?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if a_name.same_feature_name (storage.item (i).feature_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FEATURE_NAME_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end
