indexing

	description:

		"Callbacks filter producing tiny trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_BUILDER

inherit

	XM_XPATH_BUILDER

	XM_XPATH_TYPE

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_ARRAY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			system_id := ""
			create {XM_XPATH_DEFAULT_LOCATOR} locator
		end
	
feature -- Access

	tiny_document: XM_XPATH_TINY_DOCUMENT
			-- Created document

feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			has_error := True
			last_error := a_message
		end

	start_document is
			-- Notify the start of the document
		do
			is_document_started := True
			has_error := False
			last_error := Void

			-- TODO add timing information

			if system_id.count = 0 then system_id := locator.system_id end
			if defaults_overridden then
				create tiny_document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count, system_id)
			else
				create tiny_document.make_with_defaults (system_id)
			end
			document := tiny_document
			current_depth := 1
			if is_line_numbering then
				tiny_document.set_line_numbering
			end
			tiny_document.add_node (Document_node, current_depth, 0, 0, -1)
			node_number := tiny_document.last_node_added
			check
				document_node_number: node_number = 1
			end
			create previously_at_depth.make (1, 100)
			previously_at_depth.put(1, 1) -- i.e. depth one is node 1 - the document node
			previously_at_depth.put (0, 2) 
			tiny_document.set_next_sibling (-1, 1) -- i.e. node one has next sibling 0 (no next sibling)
			current_depth := current_depth + 1
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			-- TODO tiny_document.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			an_owner_node, a_previous_sibling: INTEGER
			a_new_type_code: like a_type_code
		do
			tiny_document.add_node (Element_node, current_depth, 0, 0, a_name_code)
			node_number := tiny_document.last_node_added
			if conformance.basic_xslt_processor then
				a_new_type_code := Untyped_type_code
				tiny_document.set_element_annotation (node_number, a_new_type_code)
			else
					check
						Only_basic_xslt_processors_are_supported: False
					end
				a_new_type_code := a_type_code
				-- TODO
			end

			a_previous_sibling := previously_at_depth.item (current_depth)

			an_owner_node := previously_at_depth.item (current_depth - 1)
			if a_previous_sibling > 0 then
				tiny_document.set_next_sibling (node_number, a_previous_sibling)
			end

			tiny_document.set_next_sibling (an_owner_node, node_number) -- owner pointer in last sibling
			
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1
			if current_depth > previously_at_depth.count then
				INTEGER_ARRAY_.resize (previously_at_depth, 1, previously_at_depth.count)
			end
			previously_at_depth.put (-1, current_depth) -- no previous sibling

			tiny_document.set_system_id_for_node (node_number, locator.system_id)
			if is_line_numbering then
				tiny_document.set_line_number_for_node (node_number, locator.line_number)
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
				tiny_document.add_namespace (node_number, a_namespace_code)			
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_new_type_code: like a_type_code
		do
			a_new_type_code := a_type_code
			if is_output_escaping_disabled (properties) then
				on_error ("Cannot disable output escaping when writing to a tree")
			else
				tiny_document.add_attribute (node_number, a_name_code, a_new_type_code, a_value)
			end
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			node_number := node_number + 1
		end
	
	end_element is
			-- Notify the end of an element.
		do
			previously_at_depth.put (-1, current_depth)
			current_depth := current_depth - 1			
		end

	notify_characters (a_character_string: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_buffer_start, a_previous_sibling: INTEGER
		do
			if is_output_escaping_disabled (properties) then
					on_error ("Cannot disable output escaping when writing to a tree")
				else
					a_buffer_start := tiny_document.character_buffer_length
					tiny_document.append_characters (a_character_string)
					tiny_document.add_node (Text_node, current_depth, a_buffer_start, a_character_string.count, -1)
					node_number := tiny_document.last_node_added
					
					a_previous_sibling := previously_at_depth.item (current_depth)
				if a_previous_sibling > 0 then
					tiny_document.set_next_sibling (node_number, a_previous_sibling)
				end
				tiny_document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
				previously_at_depth.put (node_number, current_depth)
			end
		end
	
	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_name_code, a_previous_sibling: INTEGER
		do
			if not shared_name_pool.is_name_code_allocated ("", "", a_target) then

				-- TODO need to check for resource exhaustion in name pool
				
				shared_name_pool.allocate_name ("", "", a_target)
				a_name_code := shared_name_pool.last_name_code
			else
				a_name_code := shared_name_pool.name_code ("", "", a_target) 
			end
			tiny_document.store_comment (a_data_string)
			tiny_document.add_node (Processing_instruction_node, current_depth, tiny_document.comment_buffer_length, a_data_string.count, a_name_code)
			node_number := tiny_document.last_node_added

			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				tiny_document.set_next_sibling (node_number, a_previous_sibling)
			end
			tiny_document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)

			tiny_document.set_system_id_for_node (node_number, locator.system_id)
			if is_line_numbering then
				tiny_document.set_line_number_for_node (node_number, locator.line_number)
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_previous_sibling: INTEGER
		do
			tiny_document.store_comment (a_content_string)
			tiny_document.add_node (Comment_node, current_depth, tiny_document.comment_buffer_length, a_content_string.count, -1)
			node_number := tiny_document.last_node_added

			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				tiny_document.set_next_sibling (node_number, a_previous_sibling)
			end
			tiny_document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	end_document is
			-- Parsing finished.
		do
			previously_at_depth := Void
--			tiny_document.diagnostic_dump

			-- TODO add timing information

		end

feature -- Status setting

	estimated_node_count: INTEGER
			-- An estimate of how many nodes there will be in the fully constructed tree

	estimated_attribute_count: INTEGER
			-- An estimate of how many attributes there will be in the fully constructed tree

	estimated_namespace_count: INTEGER
			-- An estimate of how many namespaces there will be in the fully constructed tree

	estimated_character_count: INTEGER
			-- An estimate of how many characters there are in the document contents

	reset_defaults is
			-- Use the default tree implementation parameters
		require
			always_allowed: True
		do
			defaults_overridden := False
		ensure
			default_parameters_in_use: defaults_overridden = False
		end

	set_defaults (a_new_estimated_node_count: INTEGER; a_new_estimated_attribute_count: INTEGER; a_new_estimated_namespace_count: INTEGER; a_new_estimated_character_count: INTEGER) is
			-- Supply values for the tree implementation parameters
		require
			positive_node_count: a_new_estimated_node_count > 0
			attribute_count: a_new_estimated_attribute_count >= 0
			namespace_count: a_new_estimated_namespace_count >= 0
			character_count: a_new_estimated_character_count >= 0
		do
			estimated_node_count := a_new_estimated_node_count
			estimated_attribute_count := a_new_estimated_attribute_count
			estimated_namespace_count := a_new_estimated_namespace_count
			estimated_character_count := a_new_estimated_character_count
			defaults_overridden := True
		ensure
			correct_node_count: estimated_node_count = a_new_estimated_node_count
			correct_attribute_count: estimated_attribute_count = a_new_estimated_attribute_count
			correct_namespace_count: estimated_namespace_count = a_new_estimated_namespace_count
			correct_character_count: estimated_character_count = a_new_estimated_character_count
			default_parameters_overridden: defaults_overridden = True
		end

feature {NONE} -- Implementation

	defaults_overridden: BOOLEAN
			-- `True' only if `set_defaults' has been called more recently than `reset_defaults'
	
	current_depth: INTEGER
			-- Depth within the tree;

	node_number: INTEGER
			-- The local sequence number for a node within this document

	previously_at_depth: ARRAY [INTEGER]
			-- Scaffolding used whilst building the tree;
			-- Values are node numbers

invariant
	positive_depth: current_depth >= 0

end
