indexing

  description:
        "exec task"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_EXEC_TASK
	inherit
		GEANT_EXEC_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s	: UC_STRING
		do
			s := a_el.get_attributevalue_by_name(ucs_attr_executable)
			set_cmd(s.out)
		end


ucs_attr_executable			: UC_STRING is once !!Result.make_from_string("executable") end

end
