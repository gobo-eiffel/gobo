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

inherit

	ANY

	UC_UNICODE_FACTORY
		export {NONE} all end

feature -- Attribute names and values

	Id_attribute_name: UC_STRING is
			-- "ID" attribute name
		once
			Result := new_unicode_string ("ID")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Idref_attribute_name: UC_STRING is
			-- "IDREF" attribute name
		once
			Result := new_unicode_string ("IDREF")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

feature -- Task names

	Se_task_name: UC_STRING is
			-- "se" task name
		once
			Result := new_unicode_string ("se")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Ise_task_name: UC_STRING is
			-- "ise" task name
		once
			Result := new_unicode_string ("ise")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Hact_task_name: UC_STRING is
			-- "hact" task name
		once
			Result := new_unicode_string ("hact")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Ve_task_name: UC_STRING is
			-- "ve" task name
		once
			Result := new_unicode_string ("ve")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exec_task_name: UC_STRING is
			-- "exec" task name
		once
			Result := new_unicode_string ("exec")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Lcc_task_name: UC_STRING is
			-- "lcc" task name
		once
			Result := new_unicode_string ("lcc")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Set_task_name: UC_STRING is
			-- "set" task name
		once
			Result := new_unicode_string ("set")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Unset_task_name: UC_STRING is
			-- "unset" task name
		once
			Result := new_unicode_string ("unset")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gexace_task_name: UC_STRING is
			-- "xace" task name
		once
			Result := new_unicode_string ("gexace")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gelex_task_name: UC_STRING is
			-- "gelex" task name
		once
			Result := new_unicode_string ("gelex")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geyacc_task_name: UC_STRING is
			-- "geyacc" task name
		once
			Result := new_unicode_string ("geyacc")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gepp_task_name: UC_STRING is
			-- "gepp" task name
		once
			Result := new_unicode_string ("gepp")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Getest_task_name: UC_STRING is
			-- "getest" task name
		once
			Result := new_unicode_string ("getest")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geant_task_name: UC_STRING is
			-- "geant" task name
		once
			Result := new_unicode_string ("geant")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Echo_task_name: UC_STRING is
			-- "echo" task name
		once
			Result := new_unicode_string ("echo")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Mkdir_task_name: UC_STRING is
			-- "mkdir" task name
		once
			Result := new_unicode_string ("mkdir")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Delete_task_name: UC_STRING is
			-- "delete" task name
		once
			Result := new_unicode_string ("delete")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Copy_task_name: UC_STRING is
			-- "copy" task name
		once
			Result := new_unicode_string ("copy")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Move_task_name: UC_STRING is
			-- "move" task name
		once
			Result := new_unicode_string ("move")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Setenv_task_name: UC_STRING is
			-- "setenv" task name
		once
			Result := new_unicode_string ("setenv")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Xslt_task_name: UC_STRING is
			-- "xslt" task name
		once
			Result := new_unicode_string ("xslt")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Outofdate_task_name: UC_STRING is
			-- "outofdate" task name
		once
			Result := new_unicode_string ("outofdate")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exit_task_name: UC_STRING is
			-- "exit" task name
		once
			Result := new_unicode_string ("exit")
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

end -- class GEANT_ELEMENT_NAMES
