indexing

	description:

		"Renames"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_RENAME

creation

	make

feature {NONE} -- Initialization

	make is
			-- Initialize 'rename'.
		do
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := original_name /= Void
			if Result then
				Result := original_name.count > 0
			end
			if Result then
				Result := new_name /= Void
			end
			if Result then
				Result := new_name.count > 0
			end
			if Result then
				Result := not original_name.is_equal (new_name)
			end

		ensure
			original_name_not_void: Result implies original_name /= Void
			original_name_not_empty: Result implies original_name.count > 0
			new_name_not_void: Result implies new_name /= Void
			new_name_not_empty: Result implies new_name.count > 0
			original_name_and_new_name_not_equal: Result implies not original_name.is_equal (new_name)
		end

feature -- Access

	original_name: STRING
			-- Original target name

	new_name: STRING
			-- New target name

feature -- Setting

	set_original_name (a_original_name: like original_name) is
			-- Set `original_name' to `a_original_name'.
		require
			a_original_name_not_void: a_original_name /= Void
			a_original_name_not_empty: a_original_name.count > 0
		do
			original_name := a_original_name
		ensure
			original_name_set: original_name = a_original_name
		end

	set_new_name (a_new_name: like new_name) is
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
