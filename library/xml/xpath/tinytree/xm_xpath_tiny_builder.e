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

	XM_XPATH_RECEIVER

	XM_XPATH_TYPE

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_STANDARD_NAMESPACES

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; basic_conformance: BOOLEAN) is
			-- Set the name pool in which all name codes can be found
		require
			name_pool_not_void: a_name_pool /= Void
		do
			if basic_conformance then
				conformance.set_basic_xslt_processor
			end
			name_pool := a_name_pool
		ensure
			name_pool_set: name_pool = a_name_pool
		end
	
feature -- Access

	document: XM_XPATH_TINY_DOCUMENT
			-- Resulting document

feature -- Events

	start_document: XM_XPATH_DOCUMENT is
			-- Notify the start of the document
		do
			-- TODO add timing information
			if defaults_overridden then
				create document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count, name_pool)
			else
				create document.make_with_defaults (name_pool)
			end
			current_depth := 1
			document.add_node (Document_node, current_depth, -1, -1, -1)
			create previously_at_depth.make (1, 100)
			previously_at_depth.put(1, 1) -- i.e. depth one is node 1 - the document node
			previously_at_depth.put (0, 2) 
			document.set_next_sibling (-1, 1) -- i.e. node one has next sibling 0 (no next sibling)
			current_depth := current_depth + 1
			Result := document
			
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			-- TODO document.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			an_owner_node, a_previous_sibling: INTEGER
			a_new_type_code: like a_type_code
		do
			document.add_node (Element_node, current_depth, -1, -1, a_name_code)
			node_number := document.last_node_added
			if conformance.basic_xslt_processor then
				a_new_type_code := Untyped_type_code
				document.set_element_annotation (node_number, a_new_type_code)
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
				document.set_next_sibling (node_number, a_previous_sibling)
			end

			document.set_next_sibling (an_owner_node, node_number) -- owner pointer in last sibling
			
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1
			if current_depth > previously_at_depth.count then
				previously_at_depth.resize (1, previously_at_depth.count)
			end
			previously_at_depth.put (-1, current_depth) -- no previous sibling

			-- TODO - locator stuff
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
				document.add_namespace (node_number + 1, a_namespace_code)			
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_new_type_code: like a_type_code
		do
			a_new_type_code := a_type_code
			if conformance.basic_xslt_processor then
				a_new_type_code := Untyped_atomic_type_code
			else
					check
						Only_basic_xslt_processors_are_supported: False
					end
			end
				document.add_attribute (node_number, a_name_code, a_new_type_code, a_value)
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
			a_buffer_start := document.character_buffer_length
			document.append_characters (a_character_string)
			document.add_node (Text_node, current_depth, a_buffer_start, a_character_string.count, -1)
			node_number := document.last_node_added

			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				document.set_next_sibling (node_number, a_previous_sibling)
			end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end
	
	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_name_code, a_previous_sibling: INTEGER
		do
			if not name_pool.is_name_code_allocated ("", "", a_target) then

				-- TODO need to check for resource exhaustion in name pool
				
				name_pool.allocate_name ("", "", a_target)
				a_name_code := name_pool.last_name_code
			else
				a_name_code := name_pool.name_code ("", "", a_target) 
			end
			document.store_comment (a_data_string)
			document.add_node (Processing_instruction_node, current_depth, document.comment_buffer_length, a_data_string.count, a_name_code)
			node_number := document.last_node_added
			
			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				document.set_next_sibling (node_number, a_previous_sibling)
			end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)		
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_previous_sibling: INTEGER
		do
			document.store_comment (a_content_string)
			document.add_node (Comment_node, current_depth, document.comment_buffer_length, a_content_string.count, -1)
			node_number := document.last_node_added
			
			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				document.set_next_sibling (node_number, a_previous_sibling)
			end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	end_document is
			-- Parsing finished.
		do
			-- previously_at_depth.put (-1, current_depth) -- i.e. depth has not been reached yet
			previously_at_depth := Void
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
			positive_node_count: estimated_node_count > 0
			attribute_count: estimated_attribute_count >= 0
			namespace_count: estimated_namespace_count >= 0
			character_count: estimated_character_count >= 0
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

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	defaults_overridden: BOOLEAN
			-- `True' only if `set_defaults' has been called more recently than `reset_defaults'
	
	current_depth: INTEGER
			-- Depth within the tree;
			-- The document node is level 0;
			-- The document element is level 1.

	node_number: INTEGER
			-- The local sequence number for a node within this document

	previously_at_depth: ARRAY [INTEGER]
			-- Scaffolding used whilst building the tree;
			-- Values are node numbers

	system_id: STRING
			-- The SYSTEM id of the document being processed
			-- TODO - set this in the document to the base-URI

invariant
	positive_depth: current_depth >= 0
	name_pool_not_void: name_pool /= Void

end
