note

	description:

		"Callbacks filters producing trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CALLBACKS_TO_TREE_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
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
	set_next

feature -- Result

	document: XM_DOCUMENT
			-- Resulting document

feature -- Position table

	is_position_table_enabled: BOOLEAN is
			-- Is position table enabled?
		do
			Result := last_position_table /= Void
		end

	last_position_table: XM_POSITION_TABLE
			-- Position table

	enable_position_table (a_source: XM_PARSER) is
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

	disable_position_table is
			-- Disable position table.
		do
			last_position_table := Void
		end

feature -- Document

	on_start is
			-- Reset.
		do
			create document.make
			current_element := Void
			
			create namespace_cache.make_equal (0)
		end

feature -- Element

	on_start_tag (namespace, ns_prefix, a_name: STRING) is
			-- called whenever the parser findes a start element.
		local
			an_element: XM_ELEMENT
		do
			check
				document_not_void: document /= Void
			end
				
			if current_element = Void then
					-- This is the first element in the document.
				create an_element.make_root (document, a_name, new_namespace (namespace, ns_prefix))
			else
					-- This is not the first element in the parent.
				check
					document_not_finished: current_element /= Void
				end
				create an_element.make_last (current_element, a_name, new_namespace (namespace, ns_prefix))
			end
			current_element := an_element
			handle_position (current_element)
			check
				element_not_void: current_element /= Void
			end
		end

	on_attribute (namespace, a_prefix, a_name: STRING; a_value: STRING) is
			-- Add attribute.
		local
			xml: XM_ATTRIBUTE
		do
			check
				element_not_void: current_element /= Void
			end
			create xml.make_last (a_name, new_namespace (namespace, a_prefix), a_value, current_element)
			handle_position (xml)
		end

	on_content (a_data: STRING) is
			-- Character data
		local
			xml: XM_CHARACTER_DATA
		do
			check
				not_finished: current_element /= Void
			end
			create xml.make_last (current_element, a_data)
			handle_position (xml)
		end

	on_end_tag (a_namespace, a_ns_prefix, a_local_part: STRING) is
			-- End tag
		do
			check
				open_composite_exists: current_element /= Void
			end
			if current_element.parent.is_root_node then
				current_element := Void
			else
				current_element := current_element.parent_element
			end
		end

	on_processing_instruction (target, data: STRING) is
			-- Processing instruction.
		local
			xml: XM_PROCESSING_INSTRUCTION
		do
			if current_element = Void then
				create xml.make_last_in_document (document, target, data)
			else
				create xml.make_last (current_element, target, data)
			end
			handle_position (xml)
		end

	on_comment (com: STRING) is
			-- Processing comment.
		local
			xml: XM_COMMENT
		do
			if current_element = Void then
				create xml.make_last_in_document (document, com)
			else
				create xml.make_last (current_element, com)
			end
			handle_position (xml)
		end

feature {NONE} -- Implementation

	current_element: XM_ELEMENT
			-- Current element

feature {NONE} -- Implementation

	new_namespace (a_uri, a_prefix: STRING): XM_NAMESPACE is
			-- Create namespace object.
		do
			create Result.make (a_prefix, a_uri)
			
			-- share namespace nodes
			check cache_initialised: namespace_cache /= Void end
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
	
feature {NONE} -- Implementation (position)

	handle_position (a_node: XM_NODE) is
			-- If desired, store position information of
			-- node `a_node' in position table.
		require
			a_node_not_void: a_node /= Void
		do
			if is_position_table_enabled then
				last_position_table.put (source_parser.position, a_node)
			end
		end

	source_parser: XM_PARSER
			-- Source parser

feature -- Events mode

	has_resolved_namespaces: BOOLEAN is
			-- Namespaces required
		do
			Result := True
		end

end
