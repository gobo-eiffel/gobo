indexing

  description:
        "gepp task%
		%  example usage:%
		%  <gepp inputfile='main.ge' outputfile='main.e'>%
		%    <define name='SE' />%
		%  </gepp>%
		%%
		% which is equivalent to the commandline call: gepp -DSE main.ge main.e"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
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
			s := a_el.get_attributevalue_by_name(ucs_attr_inputfile)
			set_inputfile(s.out)

			s := a_el.get_attributevalue_by_name(ucs_attr_outputfile)
			set_outputfile(s.out)

			defines_el := a_el.get_children_by_name(ucs_attr_define)
			from i := 1 until i > defines_el.count loop
				define_el := defines_el.item(i)
				s := define_el.get_attributevalue_by_name(ucs_name)
				defines.force_last(s.out)

				i := i + 1
			end
		end


ucs_attr_inputfile			: UC_STRING is once !!Result.make_from_string("inputfile") end
ucs_attr_outputfile			: UC_STRING is once !!Result.make_from_string("outputfile") end
ucs_attr_define				: UC_STRING is once !!Result.make_from_string("define") end

end
