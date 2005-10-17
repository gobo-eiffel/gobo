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
		redefine
			open, close, show_size
		end

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

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

	tree: XM_XPATH_TINY_FOREST
			-- Created document tree

	tiny_document: XM_XPATH_TINY_DOCUMENT
			-- Created document

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
			if tree = Void then
				if defaults_overridden then
					create tree.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
				else
					create tree.make_with_defaults
				end
				current_depth := 1
				if is_line_numbering then
					tree.set_line_numbering
				end
			end
			create previously_at_depth.make (1, 100)
			Precursor
		ensure then
			tree_not_void: tree /= Void
			at_root_level: current_depth = 1
		end
	
	start_document is
			-- Notify the start of the document
		do
			is_document_started := True
			has_error := False
			last_error := Void

			-- TODO add timing information

			if system_id.count = 0 then system_id := locator.system_id end
			create tiny_document.make (tree, node_number + 1)
			current_root := tiny_document
			tiny_document.set_system_id (system_id)
			tree.add_document_node (tiny_document)
			node_number := tree.last_node_added
			previously_at_depth.put(1, 1) -- i.e. depth one is node 1 - the document node
			previously_at_depth.put (0, 2) 
			tree.set_next_sibling (-1, 1) -- i.e. node one has next sibling 0 (no next sibling)
			current_depth := current_depth + 1
		ensure then
			at_document_element_level: current_depth = 2
			document_root_not_void: tiny_document /= Void
			root_is_document: current_root = tiny_document
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			-- TODO tree.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			an_owner_node, a_previous_sibling: INTEGER
			a_new_type_code: like a_type_code
		do
			tree.add_node (Element_node, current_depth, 0, 0, a_name_code)
			node_number := tree.last_node_added
			if conformance.basic_xslt_processor then
				a_new_type_code := Untyped_type_code
				tree.set_element_annotation (node_number, a_new_type_code)
			else
					check
						Only_basic_xslt_processors_are_supported: False
					end
				a_new_type_code := a_type_code
				-- TODO
			end
			if current_depth = 1 then
				previously_at_depth.put (node_number, 1)
				previously_at_depth.put (-1, 2)
				current_root := tree.retrieve_node (node_number)
			else
				a_previous_sibling := previously_at_depth.item (current_depth)
				an_owner_node := previously_at_depth.item (current_depth - 1)
				if a_previous_sibling > 0 then
					tree.set_next_sibling (node_number, a_previous_sibling)
				end
				tree.set_next_sibling (an_owner_node, node_number) -- owner pointer in last sibling
				previously_at_depth.put (node_number, current_depth)
			end
			current_depth := current_depth + 1
			if current_depth > previously_at_depth.count then
				INTEGER_ARRAY_.resize (previously_at_depth, 1, previously_at_depth.count)
			end
			previously_at_depth.put (-1, current_depth) -- no previous sibling

			if not locator.system_id.is_empty then
				tree.set_system_id_for_node (node_number, locator.system_id)
			end
			if is_line_numbering then
				tree.set_line_number_for_node (node_number, locator.line_number)
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
				tree.add_namespace (node_number, a_namespace_code)			
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
				tree.add_attribute (tiny_document, node_number, a_name_code, a_new_type_code, a_value)
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
			a_buffer_start, a_previous_sibling, a_previous_node: INTEGER
		do
			if is_output_escaping_disabled (properties) then
				on_error ("Cannot disable output escaping when writing to a tree")
			else
				a_buffer_start := tree.character_buffer.count
				tree.append_characters (a_character_string)
				a_previous_node := tree.number_of_nodes
				if tree.retrieve_node_kind (a_previous_node) = Text_node and then tree.depth_of (a_previous_node) = current_depth then

					-- merge consecutive text nodes
					
					tree.increase_beta_value (a_character_string.count, a_previous_node)
				else
					tree.add_node (Text_node, current_depth, a_buffer_start, a_character_string.count, -1)
					node_number := tree.last_node_added
					
					a_previous_sibling := previously_at_depth.item (current_depth)
					if a_previous_sibling > 0 then
						tree.set_next_sibling (node_number, a_previous_sibling)
					end
					tree.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
					previously_at_depth.put (node_number, current_depth)
				end
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
			tree.store_comment (a_data_string)
			tree.add_node (Processing_instruction_node, current_depth, tree.comment_buffer.count, a_data_string.count, a_name_code)
			node_number := tree.last_node_added

			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				tree.set_next_sibling (node_number, a_previous_sibling)
			end
			tree.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)

			if not locator.system_id.is_empty then
				tree.set_system_id_for_node (node_number, locator.system_id)
			end
			if is_line_numbering then
				tree.set_line_number_for_node (node_number, locator.line_number)
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_previous_sibling: INTEGER
		do
			tree.store_comment (a_content_string)
			tree.add_node (Comment_node, current_depth, tree.comment_buffer.count, a_content_string.count, -1)
			node_number := tree.last_node_added

			a_previous_sibling := previously_at_depth.item (current_depth)
			if a_previous_sibling > 0 then
				tree.set_next_sibling (node_number, a_previous_sibling)
			end
			tree.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	end_document is
			-- Parsing finished.
		do
			previously_at_depth := Void
			is_document_started := False
		end

	close is
			-- Notify end of event stream.
		do
			if not is_timing and then is_reporting_sizes then tree.print_sizes end
			if not defaults_overridden then tree.condense end
			Precursor
		end

feature -- Status report

	estimated_node_count: INTEGER
			-- An estimate of how many nodes there will be in the fully constructed tree

	estimated_attribute_count: INTEGER
			-- An estimate of how many attributes there will be in the fully constructed tree

	estimated_namespace_count: INTEGER
			-- An estimate of how many namespaces there will be in the fully constructed tree

	estimated_character_count: INTEGER
			-- An estimate of how many characters there are in the document contents

	is_reporting_sizes: BOOLEAN
			-- Do we report on sizes actually used?

	show_size is
			-- Print tree size information.
		do
			tree.print_sizes
		end

feature -- Status setting

	set_reporting_sizes (true_or_false: BOOLEAN) is
			-- Set if we report on sizes actually used.
		do
			is_reporting_sizes := true_or_false
		ensure
			set: is_reporting_sizes = true_or_false
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

	set_defaults (a_new_estimated_node_count: INTEGER; a_new_estimated_attribute_count: INTEGER; a_new_estimated_namespace_count: INTEGER; a_new_estimated_character_count: INTEGER) is
			-- Supply values for the tree implementation parameters.
			-- Zeros mean using existing values.
		require
			positive_node_count: a_new_estimated_node_count >= 0
			attribute_count: a_new_estimated_attribute_count >= 0
			namespace_count: a_new_estimated_namespace_count >= 0
			character_count: a_new_estimated_character_count >= 0
		do
			if a_new_estimated_node_count > 0 then	defaults_overridden := True end
			estimated_node_count := a_new_estimated_node_count
			if a_new_estimated_attribute_count > 0 then defaults_overridden := True end
			estimated_attribute_count := a_new_estimated_attribute_count
			if a_new_estimated_namespace_count > 0 then defaults_overridden := True	end
			estimated_namespace_count := a_new_estimated_namespace_count
			if a_new_estimated_character_count > 0 then defaults_overridden := True end
			estimated_character_count := a_new_estimated_character_count
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
