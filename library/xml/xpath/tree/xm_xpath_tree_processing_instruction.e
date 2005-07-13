indexing

	description:

		"Standard tree processing-instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_PROCESSING_INSTRUCTION
	
inherit
	
	XM_XPATH_PROCESSING_INSTRUCTION
		undefine
			document_element, next_sibling, previous_sibling, base_uri, local_part, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_NODE
		redefine
			name_code, base_uri, system_id, line_number
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; a_name_code: INTEGER; a_string_value: STRING) is
			-- Establish invariant.
		require
			string_value_not_void: a_string_value /= Void
		do
			document := a_document
			node_type := Processing_instruction_node
			string_value := a_string_value
			name_code := a_name_code
			line_number := -1
			system_id := ""
		ensure
			string_value_set: string_value = a_string_value
			name_code_set: name_code = a_name_code
		end

feature -- Access

	system_id: STRING
			-- SYSTEM id of `Current', or `Void' if not known

	line_number: INTEGER
			-- Line number of node in original source document, or -1 if not known

	string_value: STRING
			--Value of the item as a string

	name_code: INTEGER
			-- Name code this node - used in displaying names
	
	base_uri: STRING is
			-- Base URI
		do
			Result := system_id
		end

feature -- Status setting

	set_location (a_system_id: STRING; a_line_number: INTEGER) is
			-- Set location information.
		require
			system_id_not_void: a_system_id /= void
		do
			system_id := a_system_id
			line_number := a_line_number
		ensure
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_processing_instruction (node_name, string_value, 0)
		end
		
feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

end
	
