indexing

	description:

		"Variables for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Sven Ehrke and others"
	license:"Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision:"$Revision$"


class GEANT_VARIABLES

inherit

	DS_HASH_TABLE [STRING, STRING]
		rename
			make as hash_table_make
		end

	UC_SHARED_STRING_EQUALITY_TESTER
		export
			{NONE} all
		undefine
			is_equal, copy
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create new variables.
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			make_map (10)
			create a_tester
			set_key_equality_tester (a_tester)
		end

feature -- Status report

	has_numbered_keys: BOOLEAN is
			-- Do entries exist which indicate that Current contains only numbered entries?
		do
			Result := has ("1")
		ensure
			definition: Result implies has ("1")
		end

	has_same_keys (a_other: like Current): BOOLEAN is
			-- Has `a_other' the same key entries?
		require
			a_other_not_void: a_other /= Void
		local
			cs: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			Result := count = a_other.count
			if Result then
				cs := new_cursor
				from cs.start until cs.after or else not Result loop
					Result := a_other.has (cs.key)
					cs.forth
				end
			end
		end

end
