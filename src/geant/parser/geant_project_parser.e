indexing

    description:

        "responsible for creating the tree structure from the XML document"

    library:    "geant/xml"
    author:     "Sven Ehrke"
    copyright:  "Copyright (c) 2000, Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"

class
   GEANT_PROJECT_PARSER
inherit
   XM_EVENT_PARSER
      redefine
	 on_start_tag,
	 on_end_tag,
	 on_content
     end
creation
   make_from_imp
feature

	on_start_tag (a_name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
		local
			el			: GEANT_ELEMENT
			cur_el		: GEANT_ELEMENT
			attr_list	: GEANT_ATTRIBUTE_LIST
		do
			debug("trace_xml")
				print (a_name.out + "%N")
			end

			!!el.make(a_name)
			!!attr_list.make_from_ds_bilinear(attributes)
			el.add_attributes(attr_list)
			
			if root_element = void then
				-- create the root element
				root_element := el
				
			end
			
			if not stack.is_empty then
			-- add the new element as a child to the current element and make it the current element
				cur_el := stack.item
				cur_el.add_child(el)
			end
			
			-- and make the new element the current element
			stack.put(el)
		end
   
	on_end_tag (name, ns_prefix: UC_STRING) is
		do
		debug("trace_xml")
			print ("/" + name.out + "%N")
		end
		
		stack.remove
	end
   
   on_content (chr_data: UC_STRING) is
		local
			el			: GEANT_ELEMENT
		do
			el := stack.item
			el.set_content(clone(chr_data))
		end

	feature -- Class

	root_element	: GEANT_ELEMENT

	stack : DS_ARRAYED_STACK[GEANT_ELEMENT] is
		once
			!!Result.make(10)
		end

end
