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

	XM_CALLBACKS_FILTER
		redefine
			has_resolved_namespaces,
			on_start,
			on_finish,
			on_start_tag,
			on_attribute,
			on_content,
			on_end_tag,
			on_processing_instruction,
			on_comment
		end

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_TYPE
	
	KL_SHARED_EXCEPTIONS

creation

	make_null,
	set_next

feature -- Result

	document: XM_XPATH_TINY_DOCUMENT
			-- Resulting document

feature -- Document

	on_start is
			-- Reset.
		do
			-- TODO add timing information
			if name_pool = Void then Exceptions.raise ("Name pool is void") end
			if defaults_overridden then
				create document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
			else
				create document.make_with_defaults
			end
			current_depth := 0
			document.add_node (Document_node, current_depth, -1, -1, -1)
			create previously_at_depth.make (0, 99)
			previously_at_depth.put (1, 0) -- i.e. depth zero is node 1 - the document node
			previously_at_depth.put (-1, 1) -- i.e. depth has not been reached yet
			document.set_next_sibling (0, 1) -- i.e. node one has next sibling 0 (i.e. no next sibling)
			current_depth := current_depth + 1
			document.set_name_pool (name_pool)
		end

	on_finish is
			-- Parsing finished.
		do
			previously_at_depth.put (-1, current_depth) -- i.e. depth has not been reached yet
			-- TODO add timing information
		end
	
feature -- Element

	on_start_tag (namespace, ns_prefix, a_name: STRING) is
			-- called whenever the parser findes a start element.
		local
			name_code, previous_node_number: INTEGER
		do
			if namespace = Void then
				Exceptions.raise ("XM_XPATH_TINY_BUILDER requires namespace to be resolved")
			end
			
			if not name_pool.is_name_code_allocated (ns_prefix, namespace, a_name) then
				name_pool.allocate_name (ns_prefix, namespace, a_name)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code (ns_prefix, namespace, a_name) 
			end

			document.add_node (Element_node, current_depth, -1, -1, name_code)
			node_number := document.last_node_added

			-- N.B. We have no type information from the current parser, so we cannot add any.

			previous_node_number := previously_at_depth.item (current_depth)
			if previous_node_number > 0  then document.set_next_sibling (node_number, previous_node_number) end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1

			if current_depth = previously_at_depth.count then previously_at_depth.automatic_grow end
			previously_at_depth.put (-1, current_depth) -- i.e. depth has not been reached yet

			-- TODO - locator stuff
		end

	on_attribute (namespace, a_prefix, a_name: STRING; a_value: STRING) is
			-- Add attribute.
		local
			name_code, namespace_code, type_cde: INTEGER
		do
			if namespace = Void then
				Exceptions.raise ("XM_XPATH_TINY_BUILDER requires namespace to be resolved")
			end

			if not name_pool.is_name_code_allocated (a_prefix, namespace, a_name) then
				name_pool.allocate_name (a_prefix, namespace, a_name)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code (a_prefix, namespace, a_name) 
			end

			if is_namespace_declaration (a_prefix, a_name) then
				-- Create a namespace node
				if name_pool.is_namespace_code_allocated (a_prefix, namespace) then
					namespace_code := name_pool.namespace_code (a_prefix, namespace)
				else
					name_pool.allocate_namespace_code (a_prefix, namespace)
					namespace_code := name_pool.last_namespace_code
				end
				document.add_namespace (node_number, namespace_code)
			else
				-- Normal attribute
				-- `type_cde' is allowed to default to zero, as the
				--  current parser does not provide us with any type information
				document.add_attribute (node_number, name_code, type_cde, a_value)
			end
			
			-- TODO
		end

	on_content (a_data: STRING) is
			-- Character data;
			-- N.B. Since the XPath data model requires that two consecutive
			--  character nodes cannot occur as adjacent siblings,
			--  an XM_CONTENT_CONCATENATOR must precede XM_XPATH_TINY_BUILDER
			--  in the pipeline
		local
			buffer_start, previous_node_number: INTEGER
			new_data: UC_UTF8_STRING
		do
			create new_data.make_from_utf8 (a_data)
			buffer_start := document.character_buffer_length
			document.append_characters (new_data)
			document.add_node (Text_node, current_depth, buffer_start, new_data.count, -1)
			node_number := document.last_node_added
			previous_node_number := previously_at_depth.item (current_depth)
			if previous_node_number > 0 then
				document.set_next_sibling (node_number, previous_node_number)
			end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	on_end_tag (a_namespace, a_ns_prefix, a_local_part: STRING) is
			-- End tag
		do
			if a_namespace = Void then
				Exceptions.raise ("XM_XPATH_TINY_BUILDER requires namespace to be resolved")
			end
			
			previously_at_depth.put (-1, current_depth) -- i.e. depth has not been reached yet
			current_depth := current_depth - 1
		end

	on_processing_instruction (target, data: STRING) is
			-- Processing instruction.
		local
			new_data: UC_UTF8_STRING
			name_code, previous_node_number: INTEGER
		do
			create new_data.make_from_utf8 (data)
			if not name_pool.is_name_code_allocated ("", "", target) then
				name_pool.allocate_name ("", "", target)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code ("", "", target) 
			end
			document.store_comment (new_data)
			document.add_node (Processing_instruction_node, current_depth, document.comment_buffer_length, new_data.count, name_code)
			node_number := document.last_node_added
			
			previous_node_number := previously_at_depth.item (current_depth)
			if previous_node_number > 0  then document.set_next_sibling (node_number, previous_node_number) end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1 
		end

	on_comment (com: STRING) is
			-- Processing comment.
		local
			new_data: UC_UTF8_STRING
			previous_node_number: INTEGER
		do
			create new_data.make_from_utf8 (com)
			document.store_comment (new_data)
			document.add_node (Comment_node, current_depth, document.comment_buffer_length, new_data.count, -1)
			node_number := document.last_node_added
			
			previous_node_number := previously_at_depth.item (current_depth)
			if previous_node_number > 0  then document.set_next_sibling (node_number, previous_node_number) end
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1 			
		end

feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool in use
	
feature -- Implementation control

	estimated_node_count: INTEGER
			-- An estimate of how many nodes there will be in the fully constructed tree

	estimated_attribute_count: INTEGER
			-- An estimate of how many attributes there will be in the fully constructed tree

	estimated_namespace_count: INTEGER
			-- An estimate of how many namespaces there will be in the fully constructed tree

	estimated_character_count: INTEGER
			-- An estimate of how many characters there are in the document contents

	set_name_pool (new_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool used by this builder
		require
			pool_not_void: new_pool /= Void
		do
			name_pool := new_pool
		ensure
			pool_set: name_pool = new_pool
		end
	
	reset_defaults is
			-- Use the default tree implementation parameters
		require
			always_allowed: True
		do
			defaults_overridden := False
		ensure
			default_parameters_in_use: defaults_overridden = False
		end

	set_defaults (new_estimated_node_count: INTEGER; new_estimated_attribute_count: INTEGER; new_estimated_namespace_count: INTEGER; new_estimated_character_count: INTEGER) is
			-- Supply values for the tree implementation parameters
		require
			positive_node_count: estimated_node_count > 0
			attribute_count: estimated_attribute_count >= 0
			namespace_count: estimated_namespace_count >= 0
			character_count: estimated_character_count >= 0
		do
			estimated_node_count := new_estimated_node_count
			estimated_attribute_count := new_estimated_attribute_count
			estimated_namespace_count := new_estimated_namespace_count
			estimated_character_count := new_estimated_character_count
			defaults_overridden := True
		ensure
			correct_node_count: estimated_node_count = new_estimated_node_count
			correct_attribute_count: estimated_attribute_count = new_estimated_attribute_count
			correct_namespace_count: estimated_namespace_count = new_estimated_namespace_count
			correct_character_count: estimated_character_count = new_estimated_character_count
			default_parameters_overridden: defaults_overridden = True
		end

feature -- Events mode

	has_resolved_namespaces: BOOLEAN is
			-- Namespaces required
		do
			Result := True
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
			-- Indexed by the depth of the tree, values are node numbers

	is_namespace_declaration (a_prefix, a_name: STRING): BOOLEAN is
			-- xmlns= or xmlns:
		do
			if a_prefix.count = 0 and then a_name.is_equal ("xmlns") then
				Result := True
			elseif a_prefix.is_equal ("xmlns") then
				Result := True
			end
		end
	
invariant

	positive_depth: current_depth >= 0
	
end
