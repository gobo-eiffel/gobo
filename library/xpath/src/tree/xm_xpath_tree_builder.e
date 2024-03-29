﻿note
	description:

		"Callbacks filter producing standard trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014 Colin Adams and others"
	license: "MIT License"

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

	make (a_node_factory: XM_XPATH_NODE_FACTORY; a_base_uri: like base_uri; a_document_uri: like document_uri)
			-- Establish invariant..
		require
			node_factory_not_void: a_node_factory /= Void
			a_base_uri_not_void: a_base_uri /= Void
		do
			node_factory := a_node_factory
			base_uri := a_base_uri
			document_uri := a_document_uri
			create {XM_XPATH_DEFAULT_LOCATOR} locator
		ensure
			node_factory_set: node_factory = a_node_factory
			base_uri_set: base_uri = a_base_uri
			document_uri_set: document_uri = a_document_uri
		end

feature -- Access

	tree_document: detachable XM_XPATH_TREE_DOCUMENT
			-- Created document

	last_xpath_error: detachable XM_XPATH_ERROR_VALUE
			-- Last error value

feature -- Status report

	has_xpath_error: BOOLEAN
			-- Has an XPath error value been reported?
		do
			Result := last_xpath_error /= Void
		ensure
			error_value: Result implies last_xpath_error /= Void
		end

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		do
			has_error := True
			last_error := a_message
		end

	open
			-- Notify start of event stream.
		do
			has_error := False
			last_error := Void
			Precursor
		end

	start_document
			-- Notify the start of the document
		local
			l_tree_document: like tree_document
		do
			create l_tree_document.make (base_uri, document_uri)
			tree_document := l_tree_document
			current_root := l_tree_document
			current_depth := 1
			next_node_number := 2
			if is_line_numbering then
				l_tree_document.set_line_numbering
			end
			current_composite_node := l_tree_document
			is_document_started := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING)
			-- Notify an unparsed entity URI
		do
			if not has_error then
				check attached tree_document as l_tree_document then
					l_tree_document.set_unparsed_entity (a_name, a_system_id, a_public_id)
				end
			end
			is_written := True
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		do
			debug ("XSLT stripper")
				std.error.put_string ("Building element " + shared_name_pool.display_name_from_name_code (a_name_code))
				std.error.put_new_line
			end
			if not has_error then
				pending_element_name_code := a_name_code
			end
			is_written := True
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		local
			l_pending_namespaces: like pending_namespaces
		do
			if not has_error then
				l_pending_namespaces := pending_namespaces
				if l_pending_namespaces = Void then
					create l_pending_namespaces.make (5)
					pending_namespaces := l_pending_namespaces
				elseif not l_pending_namespaces.extendible (1) then
					l_pending_namespaces.resize (l_pending_namespaces.count + 3)
				end
				l_pending_namespaces.put_last (a_namespace_code)
			end
			is_written := True
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Notify an attribute.
		local
			l_pending_attributes: like pending_attributes
		do
			if not has_error then
				if is_output_escaping_disabled (a_properties) then
					on_error ("Cannot disable output escaping when writing to a tree")
				else
					l_pending_attributes := pending_attributes
					if l_pending_attributes = Void then
						create l_pending_attributes.make
						pending_attributes := l_pending_attributes
					end
					l_pending_attributes.add_attribute (a_name_code, a_type_code, a_value, a_properties)
				end
			end
			is_written := True
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			l_element: detachable XM_XPATH_TREE_ELEMENT
			l_namespaces: like pending_namespaces
			l_attributes: like pending_attributes
		do
			if attached pending_namespaces as l_pending_namespaces and then not l_pending_namespaces.is_empty then
				l_namespaces := pending_namespaces
			end
			if attached pending_attributes as l_pending_attributes and then l_pending_attributes.number_of_attributes > 0 then
				l_attributes := pending_attributes
			end
			if not has_error then
				check attached node_factory as l_node_factory and attached tree_document as l_tree_document then
					l_element := l_node_factory.new_element_node (l_tree_document, current_composite_node, l_attributes, l_namespaces, pending_element_name_code, next_node_number)
				end
				if l_element = Void then
					saved_current_composite_node := current_composite_node
					current_composite_node := Void
				elseif attached l_element.error_value as l_error_value then
					check is_error: l_element.is_error end
					has_error := True
					last_error := l_error_value.error_message
					last_xpath_error := l_error_value
				else
					if not locator.system_id.is_empty and attached tree_document as l_tree_document then
						l_tree_document.set_system_id_for_node (next_node_number, locator.system_id)
					end
					if is_line_numbering and attached tree_document as l_tree_document then
						l_tree_document.set_line_number_for_node (next_node_number, locator.line_number)
					end
					next_node_number := next_node_number + 1
					current_depth := current_depth + 1
					if not attached tree_document as l_tree_document then
						if current_root = Void then
							current_root := l_element
						end
					elseif current_composite_node = l_tree_document then
						l_tree_document.set_document_element (l_element)

					end
					current_composite_node := l_element
				end
			end
			if attached pending_namespaces as l_pending_namespaces and then not l_pending_namespaces.is_empty then
				pending_namespaces := Void
				-- else we reuse the empty list for the next element, so saving a memory allocation
			end
			if attached pending_attributes as l_pending_attributes and then l_pending_attributes.number_of_attributes > 0 then
				pending_attributes := Void
				-- else we reuse the empty list for the next element, so saving memory allocations
			end
			is_written := True
		end

	end_element
			-- Notify the end of an element.
		do
			if not has_error then
				current_depth := current_depth - 1
				if is_line_numbering and attached current_composite_node as l_current_composite_node then
					check attached tree_document as l_tree_document then
						l_tree_document.set_closing_line_number_for_node (l_current_composite_node.sequence_number_high_word, locator.line_number)
					end
				end
				if attached current_composite_node as l_current_composite_node then
					current_composite_node := l_current_composite_node.parent
				else
					current_composite_node := saved_current_composite_node
				end
			end
			is_written := True
		end

	notify_characters (a_character_string: STRING; properties: INTEGER)
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
						check attached tree_document as l_tree_document then
							create a_text_node.make (l_tree_document, a_character_string)
							if attached current_composite_node as l_current_composite_node then
								l_current_composite_node.add_child (a_text_node)
							end
						end
					end
				end
			end
			is_written := True
		end

	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER)
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
				check attached tree_document as l_tree_document then
					create a_processing_instruction.make (l_tree_document, a_name_code, a_data_string)
					if attached current_composite_node as l_current_composite_node then
						l_current_composite_node.add_child (a_processing_instruction)
					end
					a_processing_instruction.set_location (locator.system_id, locator.line_number)
				end
			end
			is_written := True
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		local
			a_comment: XM_XPATH_TREE_COMMENT
		do
			if not has_error then
				check attached tree_document as l_tree_document then
					create a_comment.make (l_tree_document, a_content_string)
					if attached current_composite_node as l_current_composite_node then
						l_current_composite_node.add_child (a_comment)
					end
				end
			end
			is_written := True
		end

	end_document
			-- Parsing finished.
		do
			current_composite_node := Void
			is_document_started := False
		end

	close
			-- Notify end of event stream.
		do
			Precursor

			-- `Current' will not be reused, so we can free some memory:

			node_factory := Void
		end

feature {XM_XPATH_TREE_ELEMENT} -- Element change (actually only used by XM_XSLT_LITERAL_RESULT_ELEMENT)

	graft_element (a_element: XM_XPATH_TREE_ELEMENT)
			-- Graft `a_element' into the tree (dangerous).
		require
			a_element_not_void: a_element /= Void
		do
			if attached current_composite_node as l_current_composite_node then
				l_current_composite_node.add_child (a_element)
			end
		end

feature {NONE} -- Implementation

	node_factory: detachable XM_XPATH_NODE_FACTORY
			-- Node factory

	current_depth: INTEGER
			-- Depth within the tree

	next_node_number: INTEGER
			-- Node number for next node to be created

	current_composite_node: detachable XM_XPATH_TREE_COMPOSITE_NODE
			-- Current document or element node

	saved_current_composite_node: detachable XM_XPATH_TREE_COMPOSITE_NODE
			-- Saved value of `current_composite_node'

	pending_namespaces: detachable DS_ARRAYED_LIST [INTEGER]
			-- Name codes of namespaces defined on the current element

	pending_attributes: detachable XM_XPATH_ATTRIBUTE_COLLECTION
			-- Pending attributes

	pending_element_name_code: INTEGER
			-- Name code for pending element

invariant

	last_error_not_void: has_error implies last_error /= Void
	node_factory_not_void: is_open implies node_factory /= Void

end

