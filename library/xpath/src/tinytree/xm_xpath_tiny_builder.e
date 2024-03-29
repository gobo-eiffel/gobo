﻿note

	description:

		"Callbacks filter producing tiny trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2016, Colin Adams and others"
	license: "MIT License"

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

	make (a_base_uri: like base_uri; a_document_uri: like document_uri)
			-- Initialize `Current'.
		require
			a_base_uri_not_void: a_base_uri /= Void
		do
			base_uri := a_base_uri
			document_uri := a_document_uri
			create {XM_XPATH_DEFAULT_LOCATOR} locator
		ensure
			base_uri_set: base_uri = a_base_uri
			document_uri_set: document_uri = a_document_uri
		end

feature -- Access

	tree: detachable XM_XPATH_TINY_FOREST
			-- Created document tree

	tiny_document: detachable XM_XPATH_TINY_DOCUMENT
			-- Created document

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		do
			has_error := True
			last_error := a_message
		end

	open
			-- Notify start of event stream.
		local
			l_tree: like tree
		do
			if tree = Void then
				if defaults_overridden then
					create l_tree.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
				else
					create l_tree.make_with_defaults
				end
				if is_line_numbering then
					l_tree.set_line_numbering
				end
				tree := l_tree
			end
			current_depth := 1
			create previously_at_depth.make_filled (0, 1, 100)
			Precursor
		ensure then
			tree_not_void: tree /= Void
			at_root_level: current_depth = 1
		end

	start_document
			-- Notify the start of the document
		local
			l_tiny_document: like tiny_document
		do
			check attached tree as l_tree and attached previously_at_depth as l_previously_at_depth then
				is_document_started := True
				has_error := False
				last_error := Void

				-- TODO add timing information

				create l_tiny_document.make (l_tree, node_number + 1, base_uri, document_uri)
				tiny_document := l_tiny_document
				current_root := l_tiny_document
				l_tree.add_document_node (l_tiny_document)
				node_number := l_tree.last_node_added
				l_previously_at_depth.put(1, 1) -- i.e. depth one is node 1 - the document node
				l_previously_at_depth.put (0, 2)
				l_tree.set_next_sibling (-1, 1) -- i.e. node one has next sibling 0 (no next sibling)
				current_depth := current_depth + 1
			end
		ensure then
			at_document_element_level: current_depth = 2
			document_root_not_void: tiny_document /= Void
			root_is_document: current_root = tiny_document
		end

	set_unparsed_entity (a_name: STRING; a_system_id: detachable STRING; a_public_id: detachable STRING)
			-- Notify an unparsed entity URI
		do
			if attached tree as l_tree then
				l_tree.set_unparsed_entity (a_name, a_system_id, a_public_id)
			end
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		local
			an_owner_node, a_previous_sibling: INTEGER
			a_new_type_code: like a_type_code
		do
			if attached tree as l_tree and attached previously_at_depth as l_previously_at_depth then
				l_tree.add_node (Element_node, current_depth, 0, 0, a_name_code)
				node_number := l_tree.last_node_added
				if conformance.basic_xslt_processor then
					a_new_type_code := Untyped_type_code
					l_tree.set_element_annotation (node_number, a_new_type_code)
				else
						check
							Only_basic_xslt_processors_are_supported: False
						end
					a_new_type_code := a_type_code
					-- TODO
				end
				if current_depth = 1 then
					l_previously_at_depth.put (node_number, 1)
					l_previously_at_depth.put (-1, 2)
					current_root := l_tree.retrieve_node (node_number)
				else
					a_previous_sibling := l_previously_at_depth.item (current_depth)
					an_owner_node := l_previously_at_depth.item (current_depth - 1)
					if a_previous_sibling > 0 then
						l_tree.set_next_sibling (node_number, a_previous_sibling)
					end
					l_tree.set_next_sibling (an_owner_node, node_number) -- owner pointer in last sibling
					l_previously_at_depth.put (node_number, current_depth)
				end
				current_depth := current_depth + 1
				if current_depth > l_previously_at_depth.count then
					INTEGER_ARRAY_.resize_with_default (l_previously_at_depth, 0, 1, l_previously_at_depth.count)
				end
				l_previously_at_depth.put (-1, current_depth) -- no previous sibling

				if not locator.system_id.is_empty then
					l_tree.set_system_id_for_node (node_number, locator.system_id)
				elseif current_depth = 2 then
					l_tree.set_system_id_for_node (node_number, base_uri)
				end
				if is_line_numbering then
					l_tree.set_line_number_for_node (node_number, locator.line_number)
				end
				mark_as_written
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		do
			if attached tree as l_tree then
				l_tree.add_namespace (node_number, a_namespace_code)
				mark_as_written
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		local
			a_new_type_code: like a_type_code
		do
			if attached tree as l_tree then
				a_new_type_code := a_type_code
				if is_output_escaping_disabled (properties) then
					on_error ("Cannot disable output escaping when writing to a tree")
				else
					l_tree.add_attribute (tiny_document, node_number, a_name_code, a_new_type_code, a_value)
				end
				mark_as_written
			end
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			node_number := node_number + 1
			mark_as_written
		end

	end_element
			-- Notify the end of an element.
		do
			if attached previously_at_depth as l_previously_at_depth then
				l_previously_at_depth.put (-1, current_depth)
				current_depth := current_depth - 1
				mark_as_written
			end
		end

	notify_characters (a_character_string: STRING; properties: INTEGER)
			-- Notify character data.
		local
			a_buffer_start, a_previous_sibling, a_previous_node: INTEGER
		do
			if attached tree as l_tree and attached previously_at_depth as l_previously_at_depth then
				if is_output_escaping_disabled (properties) then
					on_error ("Cannot disable output escaping when writing to a tree")
				else
					a_buffer_start := l_tree.character_buffer.count
					l_tree.append_characters (a_character_string)
					a_previous_node := l_tree.number_of_nodes
					if l_tree.retrieve_node_kind (a_previous_node) = Text_node and then l_tree.depth_of (a_previous_node) = current_depth then

						-- merge consecutive text nodes

						l_tree.increase_beta_value (a_character_string.count, a_previous_node)
					else
						l_tree.add_node (Text_node, current_depth, a_buffer_start, a_character_string.count, -1)
						node_number := l_tree.last_node_added

						a_previous_sibling := l_previously_at_depth.item (current_depth)
						if a_previous_sibling > 0 then
							l_tree.set_next_sibling (node_number, a_previous_sibling)
						end
						l_tree.set_next_sibling (l_previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
						l_previously_at_depth.put (node_number, current_depth)
					end
				end
				mark_as_written
			end
		end

	notify_processing_instruction (a_target: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		local
			l_name_code, l_previous_sibling, l_comment_start: INTEGER
		do
			if attached tree as l_tree and attached previously_at_depth as l_previously_at_depth then
				if not shared_name_pool.is_name_code_allocated ("", "", a_target) then

					-- TODO need to check for resource exhaustion in name pool

					shared_name_pool.allocate_name ("", "", a_target)
					l_name_code := shared_name_pool.last_name_code
				else
					l_name_code := shared_name_pool.name_code ("", "", a_target)
				end
				l_comment_start := l_tree.next_comment_start
				l_tree.store_comment (a_data_string)
				l_tree.add_node (Processing_instruction_node, current_depth, l_comment_start, a_data_string.count, l_name_code)
				node_number := l_tree.last_node_added

				l_previous_sibling := l_previously_at_depth.item (current_depth)
				if l_previous_sibling > 0 then
					l_tree.set_next_sibling (node_number, l_previous_sibling)
				end
				l_tree.set_next_sibling (l_previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
				l_previously_at_depth.put (node_number, current_depth)

				if not locator.system_id.is_empty then
					l_tree.set_system_id_for_node (node_number, locator.system_id)
				end
				if is_line_numbering then
					l_tree.set_line_number_for_node (node_number, locator.line_number)
				end
				mark_as_written
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		local
			l_previous_sibling, l_comment_start: INTEGER
		do
			if attached tree as l_tree and attached previously_at_depth as l_previously_at_depth then
				l_comment_start := l_tree.next_comment_start
				l_tree.store_comment (a_content_string)
				l_tree.add_node (Comment_node, current_depth, l_comment_start, a_content_string.count, -1)
				node_number := l_tree.last_node_added

				l_previous_sibling := l_previously_at_depth.item (current_depth)
				if l_previous_sibling > 0 then
					l_tree.set_next_sibling (node_number, l_previous_sibling)
				end
				l_tree.set_next_sibling (l_previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
				l_previously_at_depth.put (node_number, current_depth)
				mark_as_written
			end
		end

	end_document
			-- Parsing finished.
		do
			previously_at_depth := Void
			is_document_started := False
		end

	close
			-- Notify end of event stream.
		do
			if attached tree as l_tree then
				if not is_timing and then is_reporting_sizes then
					l_tree.print_sizes
				end
				if not defaults_overridden then
					l_tree.condense
				end
			end
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

	show_size
			-- Print tree size information.
		do
			if attached tree as l_tree then
				l_tree.print_sizes
			end
		end

feature -- Status setting

	set_reporting_sizes (true_or_false: BOOLEAN)
			-- Set if we report on sizes actually used.
		do
			is_reporting_sizes := true_or_false
		ensure
			set: is_reporting_sizes = true_or_false
		end

	reset_defaults
			-- Use the default tree implementation parameters
		require
			always_allowed: True
		do
			defaults_overridden := False
		ensure
			default_parameters_in_use: defaults_overridden = False
		end

	set_defaults (a_new_estimated_node_count: INTEGER; a_new_estimated_attribute_count: INTEGER; a_new_estimated_namespace_count: INTEGER; a_new_estimated_character_count: INTEGER)
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

	previously_at_depth: detachable ARRAY [INTEGER]
			-- Scaffolding used whilst building the tree;
			-- Values are node numbers

invariant

	positive_depth: current_depth >= 0

end
