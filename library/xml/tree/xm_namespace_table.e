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

	DS_HASH_TABLE [UC_STRING, UC_STRING]
		rename
			make as make_non_equal,
			make_equal as make
		end

	UC_UNICODE_FACTORY
		export
			{NONE} all
		undefine
			copy, is_equal
		end

creation

	make

feature {ANY} -- Access

	has_default: BOOLEAN is
			-- has table a default namespace?
			-- note: in any given table there must be at most one
			-- default namespace
		do
			search (uc_empty)
			Result := found
		end

	default_ns: UC_STRING is
			--	default namespace
		do
			search (uc_empty)
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

	uc_empty: UC_STRING is
		once
			Result := new_unicode_string ("")
		end

end -- class XM_NAMESPACE_TABLE
