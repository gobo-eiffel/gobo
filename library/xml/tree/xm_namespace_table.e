indexing

	description:

		"Objects that map namespace prefixes to namespace URIs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_TABLE

inherit

	DS_HASH_TABLE [STRING, STRING]
		rename
			make as table_make
		end

	UC_UNICODE_FACTORY
		export
			{NONE} all
		undefine
			copy, is_equal
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export
			{NONE} all
		undefine
			copy, is_equal
		end
		
creation

	make

feature {NONE} -- Creation

	make is
			-- Create and set equality tester.
		do
			table_make (10)
			set_equality_tester (shared_string_equality_tester)
			set_key_equality_tester (shared_string_equality_tester)
		end
		
feature {ANY} -- Access

	has_default: BOOLEAN is
			-- has table a default namespace?
			-- note: in any given table there must be at most one
			-- default namespace
		do
			search (empty_string)
			Result := found
		end

	default_ns: STRING is
			--	default namespace
		do
			search (empty_string)
			Result := found_item
		end

feature {ANY} --

	override_with_list (l: DS_BILINEAR [XM_NAMESPACE]) is
			-- take the namespace declarations from l and
			-- integrated them in this table, if `l' has
			-- an entry with a prefix that is already in
			-- this table, overide it with the entry from the list
		require
			l_not_void: l /= Void
		local
			cs: DS_BILINEAR_CURSOR [XM_NAMESPACE]
		do
			from
				cs := l.new_cursor
				cs.start
			until
				cs.off
			loop
				force (cs.item.uri, cs.item.ns_prefix)
				cs.forth
			end
		end

feature {NONE} -- Implementation

	empty_string: STRING is
		once
			!! Result.make (0)
		end

end
