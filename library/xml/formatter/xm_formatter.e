indexing

	description:

		"Generates an XML document from a XML tree"

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
	
creation

	make

feature

	make is
		do
			!! last_string.make (0)
		end

	last_string: STRING

	wipe_out is
			-- clear `last_string'
		do
			last_string.wipe_out
		end

feature {ANY} -- Debugging options

	include_position (a_pos_table: XM_POSITION_TABLE) is
		require
			a_pos_table_not_void: a_pos_table /= Void
		do
			position_table := a_pos_table
		ensure
			position_included: is_position_included = True
		end

	exclude_position is
		do
			position_table := Void
		ensure
			position_included: is_position_included = False
		end

	is_position_included: BOOLEAN is
		do
			Result := position_table /= Void
		end

feature {ANY} -- Standard processor routines

	process_element (el: XM_ELEMENT) is
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
		do
			try_process_position (c)
			append (c.content)
		end

	process_processing_instruction (a_pi: XM_PROCESSING_INSTRUCTION) is
		do
			try_process_position (a_pi)
			append (Pi_start)
			append (a_pi.target)
			append (Space_s)
			append (a_pi.data)
			append (Pi_end)
		end

	process_document (doc: XM_DOCUMENT) is
		do
			try_process_position (doc)
			process_composite (doc)
		end

	process_comment (com: XM_COMMENT) is
		do
			try_process_position (com)
			append (Comment_start)
			append (com.data)
			append (Comment_end)
		end

	process_attributes (e: XM_ELEMENT) is
		local
			cs: DS_BILINEAR_CURSOR [XM_ATTRIBUTE]
		do
			from
				cs := e.attributes.new_cursor
				cs.start
			until
				cs.off
			loop
				process_attribute_in_start_tag (cs.item)
				if not cs.is_last then
					append (Space_s)
				end
				cs.forth
			end
		end

	process_attribute_in_start_tag (att: XM_ATTRIBUTE) is
		do
			process_named (att)
			append (Eq_s)
			append (Quot_s)
			append (att.value)
			append (Quot_s)
		end

	process_attribute (att: XM_ATTRIBUTE) is
		do
		end

feature {ANY} -- Non standard processor routines

	process_composite (c: XM_COMPOSITE) is
		require
			c_not_void: c /= Void
		local
			cs: DS_BILINEAR_CURSOR [XM_NODE]
		do
			from
				cs := c.new_cursor
				cs.start
			until
				cs.off
			loop
				cs.item.process (Current)
				cs.forth
			end
		end

	process_start_tag (el: XM_ELEMENT) is
		require
			el_not_void: el /= Void
		do
			append (Stag_start)
			process_named (el)
			append (Space_s)
			process_attributes (el)
			append (Stag_end)
		end

	try_process_position (node: XM_NODE) is
		require
			node_not_void: node /= Void
		do
			if is_position_included then
				process_position (node)
			end
		end

	process_position (node: XM_NODE) is
		require
			node_not_void: node /= Void
			position_included: is_position_included
		local
			pos: XM_POSITION
		do
			if position_table.has (node) then
				pos := position_table.item (node)
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
		require
			el_not_void: el /= Void
		do
			append ("</")
			process_named (el)
			append (">")
		end

	process_named (n: XM_NAMED_NODE) is
		require
			n_not_void: n /= Void
		do
			if n.has_namespace then
				append (n.namespace)
				append (Eq_s)
			end
			append (n.name)
		end

feature {NONE} -- Implementation

	append (str: STRING) is
		require
			str_not_void: str /= Void
			last_string_not_void: last_string /= Void
		do
			last_string := STRING_.appended_string (last_string, str)
		end

	position_table: XM_POSITION_TABLE

end
