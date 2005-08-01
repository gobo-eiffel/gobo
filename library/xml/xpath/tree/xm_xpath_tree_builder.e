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

	XM_XPATH_BUILDER
		redefine
			open, close
		end

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_node_factory: XM_XPATH_NODE_FACTORY) is
			-- Establish invariant..
		require
			node_factory_not_void: a_node_factory /= Void
		do
			node_factory := a_node_factory
			system_id := ""
			create {XM_XPATH_DEFAULT_LOCATOR} locator
		ensure
			node_factory_set: node_factory = a_node_factory
		end

feature -- Access

	tree_document: XM_XPATH_TREE_DOCUMENT
			-- Created ocument

feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			has_error := True
			last_error := a_message
		end

	open is
			-- Notify start of event stream.
		do
			has_error := False
			last_error := Void
			if system_id.count = 0 then system_id := locator.system_id end
			Precursor
		end

	start_document is
			-- Notify the start of the document
		do
			create tree_document.make (system_id)
			current_root := tree_document
			current_depth := 1
			next_node_number := 2
			if is_line_numbering then
				tree_document.set_line_numbering
			end
			current_composite_node := tree_document
			is_document_started := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			if not has_error then
				-- TODO tree_document.set_unparsed_entity (a_name, a_system_id, a_public_id)
			end
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			debug ("XSLT stripper")
				std.error.put_string ("Building element " + shared_name_pool.display_name_from_name_code (a_name_code))
				std.error.put_new_line
			end
			if not has_error then
				pending_element_name_code := a_name_code
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			if not has_error then
				if pending_namespaces = Void then
					create pending_namespaces.make (5)
				elseif not pending_namespaces.extendible (1) then
					pending_namespaces.resize (2 * pending_namespaces.count)
				end
				pending_namespaces.put_last (a_namespace_code)
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			if not has_error then
				if is_output_escaping_disabled (properties) then
					on_error ("Cannot disable output escaping when writing to a tree")
				else
					if pending_attributes = Void then
						create pending_attributes.make
					end
					pending_attributes.add_attribute (a_name_code, a_type_code, a_value)
				end
			end
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			an_element: XM_XPATH_TREE_ELEMENT
		do
			if not has_error then
				an_element := node_factory.new_element_node (tree_document, current_composite_node, pending_attributes, pending_namespaces,
																			pending_element_name_code, next_node_number)
				if an_element.is_error then
					has_error := True
					last_error := an_element.error_value.error_message
				else
					tree_document.set_system_id_for_node (next_node_number, locator.system_id)
					if is_line_numbering then
						tree_document.set_line_number_for_node (next_node_number, locator.line_number)
					end
					next_node_number := next_node_number + 1
					current_depth := current_depth + 1
					if current_composite_node = tree_document then
						tree_document.set_document_element (an_element)
					end
					current_composite_node := an_element
				end
			end
			pending_namespaces := Void
			pending_attributes := Void
		end

	end_element is
			-- Notify the end of an element.
		do
			if not has_error then
				current_depth := current_depth - 1
				current_composite_node := current_composite_node.parent
			end
		end

	notify_characters (a_character_string: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_text_node: XM_XPATH_TREE_TEXT
		do
			if not has_error then
				if a_character_string.count > 0 then
					if is_output_escaping_disabled (properties) then
						on_error ("Cannot disable output escaping when writing to a tree")
					else
						debug ("XSLT stripper")
							std.error.put_string ("Creating a text node with content: " + a_character_string)
							std.error.put_string ("###")
							std.error.put_new_line
						end
						create a_text_node.make (tree_document, a_character_string)
						current_composite_node.add_child (a_text_node)
					end
				end
			end
		end

	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_processing_instruction: XM_XPATH_TREE_PROCESSING_INSTRUCTION
			a_name_code: INTEGER
		do
			if not has_error then
				if not shared_name_pool.is_name_code_allocated ("", "", a_target) then
					
					-- TODO need to check for resource exhaustion in name pool
					
					shared_name_pool.allocate_name ("", "", a_target)
					a_name_code := shared_name_pool.last_name_code
				else
					a_name_code := shared_name_pool.name_code ("", "", a_target) 
				end
				create a_processing_instruction.make (tree_document, a_name_code, a_data_string)
				current_composite_node.add_child (a_processing_instruction)

				a_processing_instruction.set_location (locator.system_id, locator.line_number)
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_comment: XM_XPATH_TREE_COMMENT
		do
			if not has_error then
				create a_comment.make (tree_document, a_content_string)
				current_composite_node.add_child (a_comment)
			end
		end

	end_document is
			-- Parsing finished.
		do
			current_composite_node := Void
			is_document_started := False
		end

	close is
			-- Notify end of event stream.
		do
			Precursor

			-- `Current' will not be reused, so we can free some memory:
			
			node_factory := Void
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

	pending_attributes: XM_XPATH_ATTRIBUTE_COLLECTION
			-- Pending attributes

	pending_element_name_code: INTEGER
			-- Name code for pending element

invariant

	last_error_not_void: has_error implies last_error /= Void
	node_factory_not_void: is_open implies node_factory /= Void

end
	
