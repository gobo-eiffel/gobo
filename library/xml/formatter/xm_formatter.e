indexing

	description:

		"Generators of XML documents from XML trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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

	KL_IMPORTED_STRING_ROUTINES

	XM_MARKUP_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new XML formatter.
		do
			!! last_string.make (0)
		end

feature -- Initialization

	wipe_out is
			-- Clear `last_string'.
		do
			last_string.wipe_out
		end

feature -- Access

	last_string: STRING
			-- Output string

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

feature -- Standard processor routines

	process_element (el: XM_ELEMENT) is
			-- Process element `el'.
		do
			try_process_position (el)
			if el.is_empty then
				process_empty_element (el)
			else
				process_start_tag (el)
				process_composite (el)
				process_end_tag (el)
			end
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
			try_process_position (doc)
			process_composite (doc)
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
				process_attribute_in_start_tag (a_cursor.item)
				if not a_cursor.is_last then
					append (Space_s)
				end
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

feature -- Non standard processor routines

	process_composite (c: XM_COMPOSITE) is
			-- Process composite `c'.
		require
			c_not_void: c /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			a_cursor := c.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (Current)
				a_cursor.forth
			end
		end

	process_start_tag (el: XM_ELEMENT) is
			-- Process start tag of `el'.
		require
			el_not_void: el /= Void
		do
			append (Stag_start)
			process_named (el)
			append (Space_s)
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

	process_empty_element (el: XM_ELEMENT) is
			-- Process empty element `el'.
		require
			el_not_void: el /= Void
		do
			append (Etag_start)
			process_named (el)
			append (Space_s)
			process_attributes (el)
			append (Etag_end)
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
			if a_node.has_namespace then
				append (a_node.namespace.uri)
				append (Eq_s)
			end
			append (a_node.name)
		end

feature {NONE} -- Implementation

	append (a_string: STRING) is
			-- Append `a_string' to `last_string'.
		require
			a_string_not_void: a_string /= Void
		do
			last_string := STRING_.appended_string (last_string, a_string)
		end

	position_table: XM_POSITION_TABLE
			-- Position table

invariant

	last_string_not_void: last_string /= Void

end
