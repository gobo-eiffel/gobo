indexing

	description:

		"Standard tree node factory"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_FACTORY

feature -- Creation

	new_element_node (a_document: XM_XPATH_TREE_DOCUMENT; a_name_code: INTEGER; a_sequence_number: INTEGER): XM_XPATH_TREE_ELEMENT is
			-- New element node.
			-- TODO - add a locator
		require
			strictly_positive_sequence_number: a_sequence_number > 0
		local
			a_line_number: INTEGER
			a_base_uri: STRING
		do
			a_base_uri := "" -- TODO - need locator
			create Result.make (a_document, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end
		
end
	
