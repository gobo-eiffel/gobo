indexing

	description:

		"Eiffel feature export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_EXPORT

inherit

	ET_EXPORT

	KL_IMPORTED_ARRAY_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_clients: like clients; a_feature_set: like feature_set) is
			-- Create a new feature export clause.
		require
			a_clients_not_void: a_clients /= Void
			a_feature_set_not_void: a_feature_set /= Void
			no_void_feature: not ANY_ARRAY_.has (a_feature_set, Void)
		do
			clients := a_clients
			feature_set := a_feature_set
		ensure
			clients_set: clients = a_clients
			feature_set_set: feature_set = a_feature_set
		end

feature -- Access

	feature_set: ARRAY [ET_FEATURE_NAME]
			-- Set of feature names associated with current export clause

feature -- Status report

	has_feature (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		local
			i, nb: INTEGER
		do
			i := feature_set.lower
			nb := feature_set.upper
			from until i > nb loop
				if a_name.same_feature_name (feature_set.item (i)) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

invariant

	feature_set_not_void: feature_set /= Void
	no_void_feature: not ANY_ARRAY_.has (feature_set, Void)

end -- class ET_FEATURE_EXPORT
