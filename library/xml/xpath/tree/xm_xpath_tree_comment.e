note

	description:

		"Standard tree comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_COMMENT

inherit

	XM_XPATH_COMMENT
		undefine
			document_element, next_sibling, previous_sibling, local_part, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_NODE
		undefine
			typed_value
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; a_string_value: STRING)
			-- Create `string_value'.
		require
			a_document_not_void: a_document /= Void
			string_value_not_void: a_string_value /= Void
		do
			document := a_document
			node_type := Comment_node
			string_value := a_string_value
		ensure
			string_value_set: string_value = a_string_value
		end

feature -- Access

	string_value: STRING
			--Value of the item as a string

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_comment (string_value, 0)
		end

end

