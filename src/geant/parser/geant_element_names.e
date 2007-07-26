indexing

	description:

		"Element name constants for GEANT"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ELEMENT_NAMES

feature -- Attribute names and values

	Id_attribute_name: STRING is
			-- "ID" attribute name
		once
			Result := "ID"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Idref_attribute_name: STRING is
			-- "IDREF" attribute name
		once
			Result := "IDREF"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

feature -- Task names

	Gec_task_name: STRING is
			-- "gec" task name
		once
			Result := "gec"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Se_task_name: STRING is
			-- "se" task name
		once
			Result := "se"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Ise_task_name: STRING is
			-- "ise" task name
		once
			Result := "ise"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Ve_task_name: STRING is
			-- "ve" task name
		once
			Result := "ve"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exec_task_name: STRING is
			-- "exec" task name
		once
			Result := "exec"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Lcc_task_name: STRING is
			-- "lcc" task name
		once
			Result := "lcc"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Set_task_name: STRING is
			-- "set" task name
		once
			Result := "set"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Unset_task_name: STRING is
			-- "unset" task name
		once
			Result := "unset"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gexace_task_name: STRING is
			-- "xace" task name
		once
			Result := "gexace"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gelex_task_name: STRING is
			-- "gelex" task name
		once
			Result := "gelex"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geyacc_task_name: STRING is
			-- "geyacc" task name
		once
			Result := "geyacc"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Gepp_task_name: STRING is
			-- "gepp" task name
		once
			Result := "gepp"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Getest_task_name: STRING is
			-- "getest" task name
		once
			Result := "getest"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Geant_task_name: STRING is
			-- "geant" task name
		once
			Result := "geant"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Echo_task_name: STRING is
			-- "echo" task name
		once
			Result := "echo"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Mkdir_task_name: STRING is
			-- "mkdir" task name
		once
			Result := "mkdir"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Delete_task_name: STRING is
			-- "delete" task name
		once
			Result := "delete"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Copy_task_name: STRING is
			-- "copy" task name
		once
			Result := "copy"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Move_task_name: STRING is
			-- "move" task name
		once
			Result := "move"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Setenv_task_name: STRING is
			-- "setenv" task name
		once
			Result := "setenv"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Xslt_task_name: STRING is
			-- "xslt" task name
		once
			Result := "xslt"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Outofdate_task_name: STRING is
			-- "outofdate" task name
		once
			Result := "outofdate"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Exit_task_name: STRING is
			-- "exit" task name
		once
			Result := "exit"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Precursor_task_name: STRING is
			-- "precursor" task name
		once
			Result := "precursor"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Available_task_name: STRING is
			-- "available" task name
		once
			Result := "available"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Input_task_name: STRING is
			-- "input" task name
		once
			Result := "input"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

	Replace_task_name: STRING is
			-- "replace" task name
		once
			Result := "replace"
		ensure
			task_name_not_void: Result /= Void
			task_name_not_empty: Result.count > 0
		end

end
