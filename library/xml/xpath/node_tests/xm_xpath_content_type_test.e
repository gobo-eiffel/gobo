indexing

	description:

		"Objects that test for a match against nodes with a specific  content-type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTENT_TYPE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			item_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_node_type: INTEGER; a_type_code: INTEGER) is
		require
			valid_node_type: a_node_type = Element_node or else a_node_type = Attribute_node
			valid_code: is_valid_type (a_type_code)
		do
			item_type := a_node_type
			content_type := a_type_code
			inspect
				item_type
			when Element_node then
				original_text := STRING_.appended_string ("element(*,", type_name (content_type))
				original_text := STRING_.appended_string (original_text, ")")
			when Attribute_node then
				original_text := STRING_.appended_string ("attribute(*,", type_name (content_type))
				original_text := STRING_.appended_string (original_text, ")")
			end
		ensure
			item_type_set: item_type = a_node_type
			content_type_set: content_type = a_type_code
		end

feature -- Access

	item_type: INTEGER
			-- Type of nodes to which this pattern applies

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := False
		end
	
feature -- Matching

	matches_node (a_node_kind: INTEGER; a_name_code: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			if item_type /= a_node_kind then
				Result := False
				else
					Result := is_sub_type (a_node_type, content_type)
			end
		end

feature {NONE} -- Implementation

	content_type: INTEGER
			-- Required content type

invariant

	valid_content_type: is_valid_type (content_type)

end
