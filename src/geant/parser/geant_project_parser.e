indexing

	description:

		"XML project parsers"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_PARSER

inherit

	XM_EVENT_PARSER
		redefine
			on_start_tag,
			on_end_tag,
			on_content
		end

creation

	make_from_implementation

feature -- Access

	root_element: GEANT_XML_ELEMENT
			-- Root element

feature -- Actions

	on_start_tag (a_name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
			-- Action executed on start tag.
		local
			an_element: GEANT_XML_ELEMENT
			current_element: GEANT_XML_ELEMENT
			attr_list: GEANT_ATTRIBUTE_LIST
		do
			debug ("trace_xml")
				print (a_name.out + "%N")
			end

			!! an_element.make (a_name)
			!! attr_list.make_from_bilinear (attributes)
			an_element.add_attributes (attr_list)

			if root_element = Void then
					-- Create the root element:
				root_element := an_element
			end

			if not stack.is_empty then
					-- Add the new element as a child to the current element:
				current_element := stack.item
				current_element.add_child (an_element)
			end
				-- Make the new element the current element:
			stack.force (an_element)
		end

	on_end_tag (name, ns_prefix: UC_STRING) is
			-- Action executed on end tag.
		do
			debug ("trace_xml")
				print ("/" + name.out + "%N")
			end
			stack.remove
		end

	on_content (chr_data: UC_STRING) is
			-- Action executed on content.
		local
			an_element: GEANT_XML_ELEMENT
		do
			an_element := stack.item
			an_element.set_content (clone (chr_data))
		end

feature {NONE} -- Implementation

	stack: DS_ARRAYED_STACK [GEANT_XML_ELEMENT] is
			-- Stack of elements
		once
			!! Result.make (10)
		ensure
			stack_not_void: Result /= Void
		end

end
