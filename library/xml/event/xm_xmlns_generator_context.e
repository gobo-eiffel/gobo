indexing

	description:

		"Prefix map and context for xmlns declaration generation filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XMLNS_GENERATOR_CONTEXT

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Creation

	make is
			-- Reset.
		do
			create prefixes.make_default
			create element_prefixes.make (10)
			element_prefixes.set_equality_tester (string_equality_tester)
			last_item := Void
			create default_namespaces.make_default
			default_namespaces.force (Default_namespace)
		end

feature {NONE} -- Default context
	
	default_namespaces: DS_LINKED_STACK [STRING]
			-- Default namespace URI stack.

feature -- Default

	is_same_as_default (a_namespace: STRING): BOOLEAN is
			-- Is namespace the same as the default one for the current element?
		require
			a_namespace_not_void: a_namespace /= Void
		do
			Result := STRING_.same_string (a_namespace, default_namespaces.item)
		end

	set_default (a_namespace: STRING) is
			-- Set default namespace URI.
		require
			a_namespace_not_void: a_namespace /= Void
		do
				-- Change top of stack.
			default_namespaces.replace (a_namespace)
		ensure
			set: STRING_.same_string (a_namespace, default_namespaces.item)
		end

feature {NONE} -- Prefixed context

	prefixes: DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]]
			-- Prefixes by namespace

	element_prefixes: DS_HASH_SET [STRING]
			-- Prefixes in use (not only declared) in top element.

	last_item: STRING
			-- Cache for lookup

feature -- Status

	has (a_namespace: STRING): BOOLEAN is
			-- Is namespace known to prefixes table?
		require
			a_namespace_not_void: a_namespace /= Void
			a_namespace_not_empty: not a_namespace.is_empty
		local
			a_cursor: DS_BILINEAR_CURSOR [DS_HASH_TABLE [STRING, STRING]]
		do
			from
				a_cursor := prefixes.new_cursor
				a_cursor.finish
			until
				a_cursor.before
			loop
				Result := a_cursor.item.has (a_namespace)
				if Result then
					last_item := a_cursor.item.item (a_namespace)
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		end

	item (a_namespace: STRING): STRING is
			-- Find prefix for namespace
		require
			a_namespace_not_void: a_namespace /= Void
			a_namespace_not_empty: not a_namespace.is_empty
		do
			if has (a_namespace) then
				Result := last_item
			end
		ensure
			result_not_empty: Result /= Void implies not Result.is_empty
		end

	new_element_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING] is
			-- New element cursor.
		do
			check in_element: not prefixes.is_empty end
			Result := prefixes.last.new_cursor
		ensure
			result_not_void: Result /= Void
		end

feature -- Setting

	force (a_prefix: STRING; a_namespace: STRING) is
			-- Add namespace, prefix to context.
		require
			a_namespace_not_void: a_namespace /= Void
			a_namespace_not_empty: not a_namespace.is_empty
			a_prefix_not_void: a_prefix /= Void
			a_prefix_not_empty: not a_prefix.is_empty		
		do
			prefixes.last.force (a_prefix, a_namespace)
		ensure
			has: has (a_namespace)
			item: item (a_namespace) = a_prefix
		end

feature -- Status

	element_has_prefix (a_prefix: STRING): BOOLEAN is
			-- Is this prefix used in the top element?
		require
			a_prefix_not_void: a_prefix /= Void
			a_prefix_not_empty: not a_prefix.is_empty		
		do
			Result := element_prefixes.has (a_prefix)
		end

	element_prefix (a_prefix: STRING) is
			-- Declare prefix in use in top element.
		require
			a_prefix_not_void: a_prefix /= Void
			a_prefix_not_empty: not a_prefix.is_empty		
		do
			element_prefixes.force (a_prefix)
		ensure
			has: element_has_prefix (a_prefix)
		end

feature -- Elements

	on_start_element is
			-- Push context.
		local
			a_table: DS_HASH_TABLE [STRING, STRING]
		do
			create a_table.make_map_default
			a_table.set_key_equality_tester (string_equality_tester)
			prefixes.force_last (a_table)

			element_prefixes.wipe_out

			default_namespaces.force (default_namespaces.item)
		end

	on_end_element is
			-- Pop context.
		do
			check prefixes.count > 0 end
			prefixes.remove_last

			default_namespaces.remove
		end

invariant

	prefixes_not_void: prefixes /= Void
	element_prefixes_not_void: element_prefixes /= Void
	default_namespaces_not_void: default_namespaces /= Void

end
