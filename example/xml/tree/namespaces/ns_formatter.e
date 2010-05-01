note

	description:

		"Namespace formatters"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class NS_FORMATTER

inherit

	XM_NODE_PROCESSOR
		redefine
			process_document, process_element, process_attributes, process_attribute
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new namespace formatter.
		do
			create last_string.make (0)
		end

feature -- Access

	last_string: STRING
			-- Output string

feature -- Resetting

	wipe_out is
			-- Clear `last_string'.
		do
			last_string.wipe_out
		ensure
			wiped_out: last_string.count = 0
		end

feature -- Debugging options

	include_position (a_pos_table: XM_POSITION_TABLE) is
			-- Use `a_pos_table' as node positions.
		require
			a_pos_table_not_void: a_pos_table /= Void
		do
			position_table := a_pos_table
		ensure
			position_included: is_position_included = True
		end

	exclude_position is
			-- Forget about node positions.
		do
			position_table := Void
		ensure
			position_included: is_position_included = False
		end

	is_position_included: BOOLEAN is
			-- Are node positions available?
		do
			Result := position_table /= Void
		end

feature -- Standard processing

	process_element (el: XM_ELEMENT) is
			-- Process element `el.
		do
			append ("Element: ")
			append (el.name)
			append ("%N")
			process_named (el)
			process_composite (el)
		end

	process_element2 (el: XM_ELEMENT) is
			-- Process element `el.
		require
			el_not_void: el /= Void
		local
			ns_decls: DS_LINKED_LIST [XM_NAMESPACE]
			cs: DS_LINKED_LIST_CURSOR [XM_NAMESPACE]
		do
			append ("Element: ")
			append (el.name)
			append ("%N")
			ns_decls := el.namespace_declarations
			cs := ns_decls.new_cursor
			from cs.start until cs.after loop
				if not cs.item.has_prefix then
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
			-- Process document `doc'.
		do
			try_process_position (doc)
			process_composite (doc)
		end

	process_attributes (e: XM_ELEMENT) is
			-- Process attributes of element `e'.
		do
		end

	process_attribute (att: XM_ATTRIBUTE) is
			-- Process attribute `att'.
		do
		end

feature -- Non-standard processing

	process_composite (c: XM_COMPOSITE) is
			-- Process composite `c'.
		require
			c_not_void: c /= Void
		local
			cs: DS_BILINEAR_CURSOR [XM_NODE]
		do
			cs := c.new_cursor
			from cs.start until cs.after loop
				cs.item.process (Current)
				cs.forth
			end
		end

	try_process_position (node: XM_NODE) is
			-- Process position of `node' if available.
		require
			node_not_void: node /= Void
		do
			if is_position_included then
				process_position (node)
			end
		end

	process_position (node: XM_NODE) is
			-- Process position of `node'.
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
			-- Process named node `n'.
		require
			n_not_void: n /= Void
		do
			append ("name=")
			append (n.name)
			append (" prefix=")
			if n.has_prefix then
				append (n.namespace.ns_prefix)
			else
				append ("[no prefix]")
			end
			append (" uri=")
			if n.has_namespace then
				append (n.namespace.uri)
			else
				append ("[no uri]")
			end
			append ("%N")
		end

feature {NONE} -- Implementation

	append (str: STRING) is
			-- Write `str' to `last_string'.
		require
			str_not_void: str /= Void
		do
			last_string := STRING_.appended_string (last_string, str)
		end

	position_table: XM_POSITION_TABLE
			-- Position table

invariant

	last_string_not_void: last_string /= Void

end
