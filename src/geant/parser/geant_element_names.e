indexing

	description:

		"Element name constants for GEANT"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ELEMENT_NAMES

feature -- Filenames

	Default_build_filename: UC_STRING is
			-- Default Name of build file
		once
			!! Result.make_from_string ("build.eant")
		ensure
			filename_not_void: Result /= Void
			filename_not_empty: not Result.empty
		end

feature -- Element names

	Target_element_name: UC_STRING is
			-- "target" element name
		once
			!! Result.make_from_string ("target")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: not Result.empty
		end

	Project_element_name: UC_STRING is
			-- "project" element name
		once
			!!Result.make_from_string ("project")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: not Result.empty
		end

	Description_element_name: UC_STRING is
			-- "description" element name
		once
			!!Result.make_from_string ("description")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: not Result.empty
		end

feature -- Attribute names and values

	Id_attribute_name: UC_STRING is
			-- "ID" attribute name
		once
			!! Result.make_from_string ("ID")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Idref_attribute_name: UC_STRING is
			-- "IDREF" attribute name
		once
			!! Result.make_from_string ("IDREF")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			!! Result.make_from_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Default_attribute_name: UC_STRING is
			-- "default" attribute name
		once
			!! Result.make_from_string ("default")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	True_attribute_value: UC_STRING is
			-- "true" attribute value
		once
			!! Result.make_from_string ("true")
		ensure
			attribute_value_not_void: Result /= Void
		end

	False_attribute_value: UC_STRING is
			-- "false" attribute value
		once
			!! Result.make_from_string ("false")
		ensure
			attribute_value_not_void: Result /= Void
		end

	Empty_attribute_value: UC_STRING is
			-- "" attribute value
		once
			!! Result.make_from_string ("")
		ensure
			attribute_value_not_void: Result /= Void
		end

feature -- Task names

	Se_task_name: UC_STRING is
			-- "se" task name
		once
			!! Result.make_from_string ("se")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Ise_task_name: UC_STRING is
			-- "ise" task name
		once
			!! Result.make_from_string ("ise")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Hact_task_name: UC_STRING is
			-- "hact" task name
		once
			!! Result.make_from_string ("hact")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Ve_task_name: UC_STRING is
			-- "ve" task name
		once
			!! Result.make_from_string ("ve")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Exec_task_name: UC_STRING is
			-- "exec" task name
		once
			!! Result.make_from_string ("exec")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Lcc_task_name: UC_STRING is
			-- "lcc" task name
		once
			!! Result.make_from_string ("lcc")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Set_task_name: UC_STRING is
			-- "set" task name
		once
			!! Result.make_from_string ("set")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Unset_task_name: UC_STRING is
			-- "unset" task name
		once
			!! Result.make_from_string ("unset")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Gexace_task_name: UC_STRING is
			-- "xace" task name
		once
			!! Result.make_from_string ("gexace")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Gelex_task_name: UC_STRING is
			-- "gelex" task name
		once
			!! Result.make_from_string ("gelex")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Geyacc_task_name: UC_STRING is
			-- "geyacc" task name
		once
			!! Result.make_from_string ("geyacc")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Gepp_task_name: UC_STRING is
			-- "gepp" task name
		once
			!! Result.make_from_string ("gepp")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Getest_task_name: UC_STRING is
			-- "getest" task name
		once
			!! Result.make_from_string ("getest")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Geant_task_name: UC_STRING is
			-- "geant" task name
		once
			!! Result.make_from_string ("geant")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Echo_task_name: UC_STRING is
			-- "echo" task name
		once
			!! Result.make_from_string ("echo")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Mkdir_task_name: UC_STRING is
			-- "mkdir" task name
		once
			!! Result.make_from_string ("mkdir")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Delete_task_name: UC_STRING is
			-- "delete" task name
		once
			!! Result.make_from_string ("delete")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Copy_task_name: UC_STRING is
			-- "copy" task name
		once
			!! Result.make_from_string ("copy")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Setenv_task_name: UC_STRING is
			-- "setenv" task name
		once
			!! Result.make_from_string ("setenv")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

	Gedoc_task_name: UC_STRING is
			-- "gedoc" task name
		once
			!! Result.make_from_string ("gedoc")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: not Result.empty
		end

feature -- Miscellaneous

	Empty_string: UC_STRING is
			-- Empty string
		once
			!! Result.make_from_string ("")
		ensure
			string_not_void: Result /= Void
			string_empty: Result.empty
		end

end -- class GEANT_ELEMENT_NAMES
