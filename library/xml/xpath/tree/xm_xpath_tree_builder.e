indexing
	description:

		"Callbacks filter producing standard trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_BUILDER

inherit

	XM_XPATH_RECEIVER

	XM_XPATH_TYPE

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool in which all name codes can be found
		require
			name_pool_not_void: a_name_pool /= Void
		do
			name_pool := a_name_pool
			system_id := ""
			create node_factory
		ensure
			name_pool_set: name_pool = a_name_pool
		end

feature -- Access


	document: XM_XPATH_TREE_DOCUMENT
			-- Resulting document

	system_id: STRING
			-- The SYSTEM id of the document being processed

feature -- Events

	start_document is
			-- Notify the start of the document
		do

			-- TODO add timing information

			create document.make (name_pool, system_id)
			current_depth := 1
			next_node_number := 2
			current_composite_node := document
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			-- TODO document.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			an_element: XM_XPATH_TREE_ELEMENT
		do
			an_element := node_factory.new_element_node (document, a_name_code, next_node_number)
			next_node_number := next_node_number + 1
			current_composite_node.add_child (an_element)
			current_depth := current_depth + 1
			if current_composite_node = document then
				document.set_document_element (an_element)
			end
			current_composite_node := an_element

		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			if pending_namespaces = Void then
				create pending_namespaces.make (5)
			elseif not pending_namespaces.extendible (1) then
				pending_namespaces.resize (2 * pending_namespaces.count)
			end
			pending_namespaces.put_last (a_namespace_code)
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_new_type_code: like a_type_code
			new_size: INTEGER
		do
			a_new_type_code := a_type_code
			if conformance.basic_xslt_processor then
				a_new_type_code := Untyped_atomic_type_code
			else
					check
						Only_basic_xslt_processors_are_supported: False
					end
			end
			if pending_attribute_values = Void then
				create pending_attribute_values.make (5)
				create pending_attribute_name_codes.make (5)
				create pending_attribute_type_codes.make (5)
			elseif not pending_attribute_values.extendible (1) then
				new_size := 2 * pending_attribute_values.count
				pending_attribute_values.resize (new_size)
				pending_attribute_type_codes.resize (new_size)
				pending_attribute_name_codes.resize (new_size)
			end
			pending_attribute_values.put_last (a_value)
			pending_attribute_name_codes.put_last (a_name_code)
			pending_attribute_type_codes.put_last (a_type_code)
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			an_element: XM_XPATH_TREE_ELEMENT
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_counter: INTEGER
		do
			an_element ?= current_composite_node
				check
					element_for_content: an_element /= Void
					-- Documents don't have namespaces or attributes
				end
			if pending_namespaces /= Void then
				from
					a_cursor := pending_namespaces.new_cursor
					a_cursor.start
				variant
					pending_namespaces.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_element.add_namespace (a_cursor.item)
					a_cursor.forth
				end
			end
			if pending_attribute_values /= Void then
				from
					a_counter := 1
					pending_attribute_values.start
					pending_attribute_name_codes.start
					pending_attribute_type_codes.start
				variant
					pending_attribute_values.count + 1 - a_counter
				until
					a_counter > pending_attribute_values.count
				loop
					an_element.add_attribute (pending_attribute_name_codes.item_for_iteration, pending_attribute_type_codes.item_for_iteration, pending_attribute_values.item_for_iteration)			
					pending_attribute_values.forth
					pending_attribute_name_codes.forth
					pending_attribute_type_codes.forth
					a_counter := a_counter + 1
				end
			end
			pending_namespaces := Void
			pending_attribute_values := Void
			pending_attribute_name_codes := Void
			pending_attribute_type_codes := Void		
		end

	end_element is
			-- Notify the end of an element.
		do
			current_depth := current_depth - 1
			current_composite_node := current_composite_node.parent
		end

	notify_characters (a_character_string: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_text_node: XM_XPATH_TREE_TEXT
		do
			if a_character_string.count > 0 then
				create a_text_node.make (document, a_character_string)
				current_composite_node.add_child (a_text_node)
			end
		end

	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_processing_instruction: XM_XPATH_TREE_PROCESSING_INSTRUCTION
			a_name_code: INTEGER
		do
			if not name_pool.is_name_code_allocated ("", "", a_target) then

				-- TODO need to check for resource exhaustion in name pool
				
				name_pool.allocate_name ("", "", a_target)
				a_name_code := name_pool.last_name_code
			else
				a_name_code := name_pool.name_code ("", "", a_target) 
			end
			create a_processing_instruction.make (document, a_name_code, a_data_string)
			current_composite_node.add_child (a_processing_instruction)

			-- TODO: locator info

		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_comment: XM_XPATH_TREE_COMMENT
		do
			create a_comment.make (document, a_content_string)
			current_composite_node.add_child (a_comment)
		end

	end_document is
			-- Parsing finished.
		do
			
			-- TODO compact tree
			-- TODO add timing information

			current_composite_node := Void
			node_factory := Void
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	node_factory: XM_XPATH_NODE_FACTORY
			-- Node factory

	current_depth: INTEGER
			-- Depth within the tree

	next_node_number: INTEGER
			-- Node number for next node to be created

	current_composite_node: XM_XPATH_TREE_COMPOSITE_NODE
			-- Current document or element node

	pending_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of namespaces defined on the current element

			-- The next three lists together form a list of triples

	pending_attribute_values: DS_ARRAYED_LIST [STRING]
			-- Pending attribute values

	pending_attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Pending attribute name codes

	pending_attribute_type_codes: DS_ARRAYED_LIST [INTEGER]
			-- Pending attribute typee codes

end
	
