indexing

	description:

		"Namespace formatters"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class NS_FORMATTER

inherit

	XM_NODE_PROCESSOR
		redefine
			process_document, process_element, process_attributes, process_attribute
		end

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature

	make is
		do
			!! last_string.make (0)
		end

	last_string: STRING

	wipe_out is
			-- clear `last_string'.
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
			append ("Element: ")
			append (el.name)
			append ("%N")
			process_named (el)
			process_composite (el)
		end

	process_element2 (el: XM_ELEMENT) is
		local
			ns_decls: DS_LINKED_LIST [XM_NAMESPACE]
			cs: DS_LINKED_LIST_CURSOR [XM_NAMESPACE]
		do
			append ("Element: ")
			append (el.name)
			append ("%N")
			ns_decls := el.namespace_declarations
			from
				cs := ns_decls.new_cursor
				cs.start
			until
				cs.off
			loop
				if cs.item.is_default then
					append ("%Tprefix: [default]%N")
				else
					append ("%Tprefix: ")
					append (cs.item.ns_prefix)
					append ("%N")
				end
				append ("%Turi: ")
				append (cs.item.uri)
				append ("%N")
				cs.forth
			end
			process_composite (el)
		end

	process_document (doc: XM_DOCUMENT) is
		do
			try_process_position (doc)
			process_composite (doc)
		end

	process_attributes (e: XM_ELEMENT) is
			--      local
			--   cs: DS_BILINEAR_CURSOR [XM_ATTRIBUTE]
		do
				-- from
				-- cs := e.attributes.new_cursor
				-- cs.star
				-- until
				-- cs.off
				-- loop
				-- process_attribute_in_start_tag (cs.item)
				-- if
				-- not cs.is_las
				-- then
				-- append (" ")
				-- end
				-- cs.forth
				-- end
		end

	process_attribute_in_start_tag (att: XM_ATTRIBUTE) is
		do
				-- process_named (att)
				-- append ("=%"")
				-- ucappend (att.value)
				-- append ("%"")
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

			append ("<!--")
			if pos /= Void then
				append (pos.out)
			else
				append ("No position info available")
			end
			append ("-->%N")
		end

	process_named (n: XM_NAMED_NODE) is
		require
			n_not_void: n /= Void
		do
			append ("name=")
			append (n.name)
			append (" prefix=")
			if n.has_prefix then
				append (n.ns_prefix)
			else
				append ("[no prefix]")
			end
			append (" uri=")
			if n.has_namespace then
				append (n.namespace)
			else
				append ("[no uri]")
			end
			append ("%N")
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
