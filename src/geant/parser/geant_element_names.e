indexing

	description:

		"element name constants for GEANT"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ELEMENT_NAMES

	
feature

	Default_build_filename : UC_STRING is
			-- Default Name of build file.
		once
			!!Result.make_from_string("build.eant")
		end


	Element_name_target : UC_STRING is
			-- Name of xml element target
		once
			!!Result.make_from_string("target")
		end


	feature -- target attribute names and values

	Attribute_name_name : UC_STRING is
			-- Name of xml attribute name which is used in many xml elements.
		once
			!!Result.make_from_string("name")
		end

	Attribute_value_true : UC_STRING is
			-- Name of xml attribute true which is used in many xml elements.
		once
			!!Result.make_from_string("true")
		end

	Attribute_value_false : UC_STRING is
			-- Name of xml attribute false which is used in many xml elements.
		once
			!!Result.make_from_string("false")
		end

	Attribute_value_empty : UC_STRING is
			-- Name of xml attribute false which is used in many xml elements.
		once
			!!Result.make_from_string("")
		end



	feature -- task names
	Compile_se_task_name : UC_STRING is
			-- Name of xml element for compile_se task.
		once
			!!Result.make_from_string("compile_se")
		end

	Exec_task_name : UC_STRING is
			-- Name of xml element for exec task.
		once
			!!Result.make_from_string("exec")
		end

	Lcc_task_name : UC_STRING is
			-- Name of xml element for lcc task.
		once
			!!Result.make_from_string("lcc")
		end

	Var_task_name : UC_STRING is
			-- Name of xml element for var task.
		once
			!!Result.make_from_string("var")
		end
	Xace_task_name : UC_STRING is
			-- Name of xml element for Xace task.
		once
			!!Result.make_from_string("xace")
		end

	Gelex_task_name : UC_STRING is
			-- Name of xml element for Gelex task.
		once
			!!Result.make_from_string("gelex")
		end

	Geyacc_task_name : UC_STRING is
			-- Name of xml element for Geyacc task.
		once
			!!Result.make_from_string("geyacc")
		end

	Gepp_task_name : UC_STRING is
			-- Name of xml element for Gepp task.
		once
			!!Result.make_from_string("gepp")
		end

	Getest_task_name : UC_STRING is
		once
			!!Result.make_from_string("getest")
		end



end
