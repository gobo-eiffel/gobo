indexing

	description:

		"Generators of XML documents from XML trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_FORMATTER

inherit

	XM_NODE_PROCESSOR
		redefine
			process_document,
			process_element,
			process_character_data,
			process_processing_instruction,
			process_comment,
			process_attributes,
			process_attribute
		end

	KL_SHARED_STREAMS
		export {NONE} all end
	
	XM_MARKUP_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new XML formatter.
		do
			last_output := null_output_stream
		end

feature -- Initialization

	wipe_out is
			-- Clear `last_string'.
		obsolete "Not meaningful now that streams are used"
		do
		end

feature -- Access

	last_output: KI_CHARACTER_OUTPUT_STREAM
			-- Output stream
			
	set_output (an_output: like last_output) is
			-- Set output stream.
		require
			not_void: an_output /= Void
		do
			last_output := an_output
		end

feature -- Debugging options

	include_position (a_pos_table: XM_POSITION_TABLE) is
			-- Specify that node positions will be kept in `a_pos_table'.
		require
			a_pos_table_not_void: a_pos_table /= Void
		do
			position_table := a_pos_table
		ensure
			position_included: is_position_included = True
		end

	exclude_position is
			-- Specify that node positions will not be kept.
		do
			position_table := Void
		ensure
			position_included: is_position_included = False
		end

	is_position_included: BOOLEAN is
			-- Are node positions kept?
		do
			Result := position_table /= Void
		end

feature {NONE} -- Namespaces

	namespaces: XM_UNIQUE_NAMESPACE_PREFIXES
			-- Prefixes collection.
			
feature -- Standard processor routines

	process_element (el: XM_ELEMENT) is
			-- Process element `el'.
		do
			try_process_position (el)
			if el.parent.is_root_node then
				process_root_start_tag (el)
			else
				process_start_tag (el)
			end
			el.process_children (Current)
			process_end_tag (el)
		end

	process_character_data (c: XM_CHARACTER_DATA) is
			-- Process character data `c'.
		do
			try_process_position (c)
			append (c.content)
		end

	process_processing_instruction (a_pi: XM_PROCESSING_INSTRUCTION) is
			-- Process processing instruction `a_pi'.
		do
			try_process_position (a_pi)
			append (Pi_start)
			append (a_pi.target)
			append (Space_s)
			append (a_pi.data)
			append (Pi_end)
		end

	process_document (doc: XM_DOCUMENT) is
			-- Process document `doc'.
		do
			create namespaces
			doc.process (namespaces)
			
			try_process_position (doc)
			doc.process_children (Current)
		end

	process_comment (com: XM_COMMENT) is
			-- Process comment `com'.
		do
			try_process_position (com)
			append (Comment_start)
			append (com.data)
			append (Comment_end)
		end

	process_attributes (e: XM_ELEMENT) is
			-- Process attributes of element `e'.
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_ATTRIBUTE]
		do
			a_cursor := e.attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
				append (Space_s)
				process_attribute_in_start_tag (a_cursor.item)
				a_cursor.forth
			end
		end

	process_attribute_in_start_tag (att: XM_ATTRIBUTE) is
			-- Process attribute `att'.
		require
			att_not_void: att /= Void
		do
			process_named (att)
			append (Eq_s)
			append (Quot_s)
			append (att.value)
			append (Quot_s)
		end

	process_attribute (att: XM_ATTRIBUTE) is
			-- Process attribute `att'.
		do
		end

feature {NONE} -- Non standard processor routines

	process_root_start_tag (an_element: XM_ELEMENT) is
			-- Process start tag of `el'.
		require
			an_element_not_void: an_element /= Void
			root_element: an_element.parent.is_root_node
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_NAMESPACE, STRING]
		do			
			append (Stag_start)
			process_named (an_element)

			from
				a_cursor := namespaces.namespaces.new_cursor
				a_cursor.start
			until	
				a_cursor.after
			loop
				append (Space_s)
				append (namespaces.namespace_declaration (a_cursor.item))
				a_cursor.forth
			end

			process_attributes (an_element)
			append (Stag_end)
		end
		
	process_start_tag (el: XM_ELEMENT) is
			-- Process start tag of `el'.
		require
			el_not_void: el /= Void
		do
			append (Stag_start)
			process_named (el)
			process_attributes (el)
			append (Stag_end)
		end

	try_process_position (a_node: XM_NODE) is
			-- Try to process position of `a_node'.
		require
			a_node_not_void: a_node /= Void
		do
			if is_position_included then
				process_position (a_node)
			end
		end

	process_position (a_node: XM_NODE) is
			-- Process position of `a_node'.
		require
			a_node_not_void: a_node /= Void
			position_included: is_position_included
		local
			pos: XM_POSITION
		do
			if position_table.has (a_node) then
				pos := position_table.item (a_node)
			end
			append (Comment_start)
			if pos /= Void then
				append (pos.out)
			else
				append ("No position info available")
			end
			append (Comment_end)
		end

	process_end_tag (el: XM_ELEMENT) is
			-- Process end tag of `el'.
		require
			el_not_void: el /= Void
		do
			append (Etag_start)
			process_named (el)
			append (Etag_end)
		end

	process_named (a_node: XM_NAMED_NODE) is
			-- Process named node `a_node'.
		require
			a_node_not_void: a_node /= Void
		do
			check
				namespaces_not_void: namespaces /= Void
			end

			append_prefix (a_node.namespace)
			append (a_node.name)
		end
		
feature {NONE} -- Implementation

	append_prefix (a_namespace: XM_NAMESPACE) is
			-- Append prefix for namespace if it is not 
			-- undefined (empty URI).
		require
			a_namespace_not_void: a_namespace /= Void
		do
			if not a_namespace.uri.is_empty then
				append (namespaces.ns_prefix (a_namespace))
				append (Prefix_separator)
			end
		end
		
	append (a_string: STRING) is
			-- Append `a_string' to `last_output'.
		require
			a_string_not_void: a_string /= Void
		do
			last_output.put_string (a_string)
		end

	position_table: XM_POSITION_TABLE
			-- Position table

invariant

	last_output_not_void: last_output /= Void

end
