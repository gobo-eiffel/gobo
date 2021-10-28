note

	description:

		"Element name constants for GEANT"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2021, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ELEMENT_NAMES

feature -- Attribute names and values

	Id_attribute_name: STRING
			-- "ID" attribute name
		once
			Result := "ID"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Idref_attribute_name: STRING
			-- "IDREF" attribute name
		once
			Result := "IDREF"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

feature -- Task names

	Gec_task_name: STRING
			-- "gec" task name
		once
			Result := "gec"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Ise_task_name: STRING
			-- "ise" task name
		once
			Result := "ise"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exec_task_name: STRING
			-- "exec" task name
		once
			Result := "exec"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Lcc_task_name: STRING
			-- "lcc" task name
		once
			Result := "lcc"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Set_task_name: STRING
			-- "set" task name
		once
			Result := "set"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Unset_task_name: STRING
			-- "unset" task name
		once
			Result := "unset"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gelex_task_name: STRING
			-- "gelex" task name
		once
			Result := "gelex"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geyacc_task_name: STRING
			-- "geyacc" task name
		once
			Result := "geyacc"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gepp_task_name: STRING
			-- "gepp" task name
		once
			Result := "gepp"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Getest_task_name: STRING
			-- "getest" task name
		once
			Result := "getest"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geant_task_name: STRING
			-- "geant" task name
		once
			Result := "geant"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Echo_task_name: STRING
			-- "echo" task name
		once
			Result := "echo"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Cat_task_name: STRING
			-- "cat" task name
		once
			Result := "cat"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Mkdir_task_name: STRING
			-- "mkdir" task name
		once
			Result := "mkdir"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Delete_task_name: STRING
			-- "delete" task name
		once
			Result := "delete"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Copy_task_name: STRING
			-- "copy" task name
		once
			Result := "copy"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Move_task_name: STRING
			-- "move" task name
		once
			Result := "move"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Setenv_task_name: STRING
			-- "setenv" task name
		once
			Result := "setenv"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Xslt_task_name: STRING
			-- "xslt" task name
		once
			Result := "xslt"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Outofdate_task_name: STRING
			-- "outofdate" task name
		once
			Result := "outofdate"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exit_task_name: STRING
			-- "exit" task name
		once
			Result := "exit"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Precursor_task_name: STRING
			-- "precursor" task name
		once
			Result := "precursor"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Available_task_name: STRING
			-- "available" task name
		once
			Result := "available"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Input_task_name: STRING
			-- "input" task name
		once
			Result := "input"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Replace_task_name: STRING
			-- "replace" task name
		once
			Result := "replace"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

end
