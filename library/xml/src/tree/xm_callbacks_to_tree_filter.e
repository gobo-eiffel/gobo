note

	description:

		"Callbacks filters producing trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2013, Andreas Leitner and others"
	license: "MIT License"

class XM_CALLBACKS_TO_TREE_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
			has_resolved_namespaces,
			on_start,
			on_start_tag,
			on_attribute,
			on_content,
			on_end_tag,
			on_processing_instruction,
			on_comment
		end

create

	make_null,
	make_next

feature {NONE} -- Initialization

	initialize
			-- Initialize current callbacks.
		do
			create document.make
			current_element := Void
			create namespace_cache.make_equal (0)
		end

feature -- Result

	document: XM_DOCUMENT
			-- Resulting document

feature -- Position table

	is_position_table_enabled: BOOLEAN
			-- Is position table enabled?
		do
			Result := last_position_table /= Void
		end

	last_position_table: detachable XM_POSITION_TABLE
			-- Position table

	enable_position_table (a_source: XM_PARSER)
			-- Enable position table, store the position
			-- for each node into 'last_position_table', using the
			-- positions from the source of the callbacks.
		require
			a_source_not_void: a_source /= Void
			--my_source: a_source is the parser that issues Current's events
		do
			source_parser := a_source
			create last_position_table.make
		end

	disable_position_table
			-- Disable position table.
		do
			last_position_table := Void
		end

feature -- Document

	on_start
			-- Reset.
		do
			initialize
		end

feature -- Element

	on_start_tag (namespace, ns_prefix: detachable STRING; a_name: STRING)
			-- called whenever the parser findes a start element.
		local
			an_element: XM_ELEMENT
		do
			check
				has_resolved_namespaces: attached namespace as l_namespace
			then
				if attached current_element as l_current_element then
						-- This is not the first element in the parent.
					create an_element.make_last (l_current_element, a_name, new_namespace (l_namespace, ns_prefix))
				else
						-- This is the first element in the document.
					create an_element.make_root (document, a_name, new_namespace (l_namespace, ns_prefix))
				end
				current_element := an_element
				handle_position (an_element)
				check
					element_not_void: current_element /= Void
				end
			end
		end

	on_attribute (namespace, a_prefix: detachable STRING; a_name: STRING; a_value: STRING)
			-- Add attribute.
		local
			xml: XM_ATTRIBUTE
		do
			check
				has_resolved_namespaces: attached namespace as l_namespace
				element_not_void: attached current_element as l_current_element
			then
				create xml.make_last (a_name, new_namespace (l_namespace, a_prefix), a_value, l_current_element)
				handle_position (xml)
			end
		end

	on_content (a_data: STRING)
			-- Character data
		local
			xml: XM_CHARACTER_DATA
		do
			check
				not_finished: attached current_element as l_current_element
			then
				create xml.make_last (l_current_element, a_data)
				handle_position (xml)
			end
		end

	on_end_tag (a_namespace, a_ns_prefix: detachable STRING; a_local_part: STRING)
			-- End tag
		do
			check
				open_composite_exists: attached current_element as l_current_element
			then
				if not attached l_current_element.parent as l_parent or else l_parent.is_root_node then
					current_element := Void
				else
					current_element := l_current_element.parent_element
				end
			end
		end

	on_processing_instruction (target, data: STRING)
			-- Processing instruction.
		local
			xml: XM_PROCESSING_INSTRUCTION
		do
			if attached current_element as l_current_element then
				create xml.make_last (l_current_element, target, data)
			else
				create xml.make_last_in_document (document, target, data)
			end
			handle_position (xml)
		end

	on_comment (com: STRING)
			-- Processing comment.
		local
			xml: XM_COMMENT
		do
			if attached current_element as l_current_element then
				create xml.make_last (l_current_element, com)
			else
				create xml.make_last_in_document (document, com)
			end
			handle_position (xml)
		end

feature {NONE} -- Implementation

	current_element: detachable XM_ELEMENT
			-- Current element

feature {NONE} -- Implementation

	new_namespace (a_uri: STRING; a_prefix: detachable STRING): XM_NAMESPACE
			-- Create namespace object.
		require
			a_uri_not_void: a_uri /= Void
		do
			create Result.make (a_prefix, a_uri)
			-- share namespace nodes
			-- XM_NAMESPACE is hashable/equal on uri only,
			-- so we must explicitely check if the cached namespace
			-- has the same prefix
			if namespace_cache.has (Result)
				and then namespace_cache.item (Result).same_prefix (Result)
			then
				Result := namespace_cache.item (Result)
			else
				namespace_cache.force_last (Result)
			end
		ensure
			result_not_void: Result /= Void
		end

	namespace_cache: DS_HASH_SET [XM_NAMESPACE]
			-- Shared namespace nodes

feature {NONE} -- Implementation (position)

	handle_position (a_node: XM_NODE)
			-- If desired, store position information of
			-- node `a_node' in position table.
		require
			a_node_not_void: a_node /= Void
		do
			if attached last_position_table as l_last_position_table and attached source_parser as l_source_parser then
				l_last_position_table.put (l_source_parser.position, a_node)
			end
		end

	source_parser: detachable XM_PARSER
			-- Source parser

feature -- Events mode

	has_resolved_namespaces: BOOLEAN
			-- Namespaces required
		do
			Result := True
		end

invariant

	document_not_void: document /= Void
	namespace_cache_not_void: namespace_cache /= Void
	no_void_namespace: not namespace_cache.has_void

end
