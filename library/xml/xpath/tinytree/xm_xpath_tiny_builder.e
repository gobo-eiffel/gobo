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

creation

	make_null,
	set_next

feature -- Result

	document: XM_XPATH_TINY_DOCUMENT
			-- Resulting document

feature -- Document

	on_start is
			-- Reset.
		local
			unused_node_number: INTEGER
		do
			if defaults_overridden then
				create document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
			else
				create document.make_with_defaults
			end
			current_element := Void
			current_depth := 0
			unused_node_number := document.add_node (document.Document_node, 0, 0, 0, 0)
				check
					first_node: unused_node_number = 1
				end
			create previously_at_depth.make (1,100)
			previously_at_depth.put (0, 1)
			previously_at_depth.put (-1, 2)
			document.set_next_sibling (1, 0)
			current_depth := current_depth + 1
		end

feature -- Element

	on_start_tag (namespace, ns_prefix, a_name: STRING) is
			-- called whenever the parser findes a start element.
		do
			-- TODO
			-- first look up the `name_code' in the `name_pool'
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

feature -- Implementation control

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
	
	current_element: XM_XPATH_TINY_ELEMENT
			-- Current element

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
