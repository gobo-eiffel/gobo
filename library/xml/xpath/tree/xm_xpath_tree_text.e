indexing

	description:

		"Standard tree text nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_TEXT
	
inherit
	
	XM_XPATH_TEXT
		undefine
			document_element, next_sibling, previous_sibling, local_part, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_NODE
		redefine
			is_tree_text, as_tree_text
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; a_string_value: STRING) is
			-- Create `string_value'.
		require
			string_value_not_void: a_string_value /= Void
		do
			document := a_document
			node_type := Text_node
			string_value := a_string_value
		ensure
			string_value_set: string_value = a_string_value
		end

feature -- Access

	string_value: STRING
			--Value of the item as a string

	is_tree_text: BOOLEAN is
			-- Is `Current' a text node?
		do
			Result := True
		end

	as_tree_text: XM_XPATH_TREE_TEXT is
			-- `Current' seen as a text node
		do
			Result := Current
		end

feature -- Status report
	
	is_all_whitespace: BOOLEAN is
			-- Does `string_value' consist only of XML white-space characters?
		local
			l_counter: INTEGER
		do
			from
				l_counter := 1
				Result := True
			variant
				string_value.count + 1 - l_counter
			until
				Result = False or else l_counter > string_value.count
			loop
				if not is_space (string_value.item_code (l_counter)) then
					Result := False
				end
				l_counter := l_counter + 1
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_characters (string_value, 0)
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

end
	
