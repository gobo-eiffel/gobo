indexing

	description:

		"gepp task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEPP_TASK
	inherit
		GEANT_GEPP_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s			: UC_STRING
			defines_el	: DS_ARRAYED_LIST [GEANT_ELEMENT]
			define_el	: GEANT_ELEMENT
			i			: INTEGER
		do
			make
			s := a_el.get_attributevalue_by_name(Attribute_name_inputfile)
			set_inputfile(s.out)

			s := a_el.get_attributevalue_by_name(Attribute_name_outputfile)
			set_outputfile(s.out)

			defines_el := a_el.get_children_by_name(Element_name_define)
			from i := 1 until i > defines_el.count loop
				define_el := defines_el.item(i)
				s := define_el.get_attributevalue_by_name(Attribute_name_name)
				defines.force_last(s.out)

				i := i + 1
			end
		end

	Attribute_name_inputfile : UC_STRING is
			-- Name of xml attribute for inputfile
		once
			!!Result.make_from_string("inputfile")
		end

	Attribute_name_outputfile : UC_STRING is
			-- Name of xml attribute for outputfile
		once
			!!Result.make_from_string("outputfile")
		end

	Element_name_define : UC_STRING is
			-- Name of xml subelement for defines
		once
			!!Result.make_from_string("define")
		end

end
