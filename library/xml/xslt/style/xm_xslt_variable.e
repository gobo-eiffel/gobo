indexing

	description:

		"xsl:variable element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_VARIABLE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization
	
	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
			a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			todo ("prepare_attributes", False)
		end

invariant

	instruction: is_instruction = True -- Well, it can be.

end
