indexing

	description:

		"Variables for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Copyright (c) 2004-2005, Sven Ehrke and others"
	license:"MIT License"
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

create

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

feature -- Setting

	set_variable_value (a_name, a_value : STRING) is
			-- Set value of variable `a_name' to `a_value'.
			-- Ignored when `a_name' is already defined.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		do
			force (a_value, a_name)
		end

end
