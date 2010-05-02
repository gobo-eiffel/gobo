note

	description:

		"Mappings between namespace prefixes and namespace URIs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_TABLE

inherit

	DS_HASH_TABLE [STRING, STRING]
		rename
			make as make_hash_table
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export
			{NONE} all
		undefine
			copy, is_equal
		end

	XM_MARKUP_CONSTANTS
		export
			{NONE} all
		undefine
			copy, is_equal
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new empty namespace table.
		do
			make_map (10)
			set_equality_tester (string_equality_tester)
			set_key_equality_tester (string_equality_tester)
		end

feature -- Status report

	has_default: BOOLEAN
			-- Has table a default namespace?
			-- (Note: in any given table there must be at most one
			-- default namespace)
		do
			search (Default_namespace)
			Result := found
		end

feature -- Access

	default_ns: STRING
			-- Default namespace
		require
			has_default: has_default
		do
			search (Default_namespace)
			Result := found_item
		end

feature -- Element change

	override_with_list (l: DS_BILINEAR [XM_NAMESPACE])
			-- Add namespace declarations listed in `l'.
			-- If `l' has an entry with a prefix that is already
			-- in current table, override it with the entry from
			-- the list.
		require
			l_not_void: l /= Void
			no_void_namespace: not l.has_void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NAMESPACE]
			a_namespace: XM_NAMESPACE
		do
			a_cursor := l.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_namespace := a_cursor.item
				force (a_namespace.uri, a_namespace.ns_prefix)
				a_cursor.forth
			end
		end

end
