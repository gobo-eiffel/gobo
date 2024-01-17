note

	description:

		"Renames"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_RENAME

inherit

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize 'rename'.
		do
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := attached original_name as l_original_name and then l_original_name.count > 0 and then
				attached new_name as l_new_name and then l_new_name.count > 0 and then
				not STRING_.same_string (l_original_name, l_new_name)
		ensure
			original_name_and_new_name_not_equal: Result implies
				attached original_name as l_original_name and then l_original_name.count > 0 and then
				attached new_name as l_new_name and then l_new_name.count > 0 and then
				not STRING_.same_string (l_original_name, l_new_name)
		end

feature -- Access

	original_name: detachable STRING
			-- Original target name

	new_name: detachable STRING
			-- New target name

feature -- Setting

	set_original_name (a_original_name: like original_name)
			-- Set `original_name' to `a_original_name'.
		require
			a_original_name_not_void: a_original_name /= Void
			a_original_name_not_empty: a_original_name.count > 0
		do
			original_name := a_original_name
		ensure
			original_name_set: original_name = a_original_name
		end

	set_new_name (a_new_name: like new_name)
			-- Set `new_name' to `a_new_name'.
		require
			a_new_name_not_void: a_new_name /= Void
			a_new_name_not_empty: a_new_name.count > 0
		do
			new_name := a_new_name
		ensure
			new_name_set: new_name = a_new_name
		end

end
