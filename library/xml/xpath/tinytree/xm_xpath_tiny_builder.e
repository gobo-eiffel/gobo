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
			on_start,
			on_start_tag,
			on_attribute,
			on_content,
			on_end_tag,
			on_processing_instruction,
			on_comment
		end

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
			if name_pool = Void then Exceptions.raise ("Name pool is void") end
			if defaults_overridden then
				create document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
			else
				create document.make_with_defaults
			end
			current_depth := 0
			document.add_node (document.Document_node, 0, 0, 0, 0)
			create previously_at_depth.make (1,100)
			previously_at_depth.put (0, 1)
			previously_at_depth.put (-1, 2)
			document.set_next_sibling (1, 0)
			current_depth := current_depth + 1
			document.set_name_pool (name_pool)
		end

feature -- Element

	on_start_tag (namespace, ns_prefix, a_name: STRING) is
			-- called whenever the parser findes a start element.
		local
			name_code, the_node_number, previous: INTEGER
		do
			if not name_pool.is_name_code_allocated (ns_prefix, namespace, a_name) then
				name_pool.allocate_name (ns_prefix, namespace, a_name)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code (ns_prefix, namespace, a_name) 
			end

			document.add_node (document.Element_node, current_depth, 0, 0, name_code)
			the_node_number := document.last_node_added

			-- We have no type information from the current parser, so we cannot add this.

			previous := previously_at_depth.item (current_depth)
			if previous > 0  then document.set_next_sibling (previous, the_node_number) end
			document.set_next_sibling (the_node_number, previously_at_depth.item (current_depth - 1))
			-- TODO

		end

	on_attribute (namespace, a_prefix, a_name: STRING; a_value: STRING) is
			-- Add attribute.
		do
			-- TODO
		end

	on_content (a_data: STRING) is
			-- Character data
		do
			-- TODO
		end

	on_end_tag (a_namespace, a_ns_prefix, a_local_part: STRING) is
			-- End tag
		do
			-- TODO
		end

	on_processing_instruction (target, data: STRING) is
			-- Processing instruction.
		do
			-- TODO
		end

	on_comment (com: STRING) is
			-- Processing comment.
		do
			-- TODO
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
			-- Scaffolding used whilst building the tree
	
invariant

	positive_depth: current_depth >= 0
	
end
