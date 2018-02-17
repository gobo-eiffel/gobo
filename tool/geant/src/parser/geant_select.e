note

	description:

		"Selects"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2018, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SELECT

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize 'select'.
		do
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := attached name as l_name and then l_name.count > 0
		ensure
			name_not_void_and_not_empty: Result implies attached name as l_name and then l_name.count > 0
		end

feature -- Access

	name: detachable STRING
			-- Name of target to be selected

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

end
