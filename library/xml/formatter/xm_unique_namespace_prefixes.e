indexing

	description:

		"Infer a unique set of namespace prefixes for a document tree"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_UNIQUE_NAMESPACE_PREFIXES

inherit
	
	XM_NODE_PROCESSOR
		redefine
			process_element,
			process_attribute,
			process_document
		end
		
	XM_MARKUP_CONSTANTS
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		
feature -- Node processor.

	process_document (a_node: XM_DOCUMENT) is
			-- Process document.
		do
			make_namespaces
			a_node.process_children (Current)
		end
		
	process_element (a_node: XM_ELEMENT) is
			-- Collect namespaces.
		do
			process_namespace (a_node.namespace)
			a_node.process_children (Current)
		end
		
	process_attribute (a_node: XM_ATTRIBUTE) is
			-- Collect namespaces.
		do
			process_namespace (a_node.namespace)
		end
		
feature -- State

	namespaces: DS_HASH_TABLE [XM_NAMESPACE, STRING]
			-- All of the document namespaces with 
			-- explicit prefixes (indexed by URI).
			-- ensure prefixes are unique.
		
feature {NONE} -- State

	prefixes: DS_HASH_TABLE [XM_NAMESPACE, STRING]
			-- Inverted index of prefixes from `namespaces'.
		
feature -- Result

	top_level_declaration: STRING is
			-- Top level declaration of all xml namespaces within 
			-- the document.
		require
			namespaces_not_void: namespaces /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_NAMESPACE, STRING]
		do
			from
				create Result.make (0)
				a_cursor := namespaces.new_cursor
				a_cursor.start
			until	
				a_cursor.after
			loop
				
				Result := STRING_.appended_string (Result, namespace_declaration (a_cursor.item))
				a_cursor.forth
				if not a_cursor.after then
					Result := STRING_.appended_string (Result, Space_s)
				end
			end
		ensure
			not_void_result: Result /= Void
		end
	
	ns_prefix (a_ns: XM_NAMESPACE): STRING is
			-- Prefix for a non default NS.
		require
			a_ns_not_void: a_ns /= Void
			namespaces_not_void: namespaces /= Void
			has: namespaces.has (a_ns.uri)
			item_has_prefix: namespaces.item (a_ns.uri).has_prefix
		do
			Result := namespaces.item (a_ns.uri).ns_prefix
		ensure
			result_not_void: Result /= Void
			result_not_empty: Result.count > 0
		end
		
	namespace_declaration (a_ns: XM_NAMESPACE): STRING is
			-- Single xmlns declaration.
		require
			a_ns_not_void: a_ns /= Void
		do
			Result := clone (Xmlns)
			if a_ns.has_prefix then
				Result := STRING_.appended_string (Result, Prefix_separator)
				Result := STRING_.appended_string (Result, a_ns.ns_prefix)
			end
			Result := STRING_.appended_string (Result, Eq_s)
			Result := STRING_.appended_string (Result, Quot_s)
			Result := STRING_.appended_string (Result, a_ns.uri)
			Result := STRING_.appended_string (Result, Quot_s)
		end
				
feature {NONE} -- Implementation

	process_namespace (a_namespace: XM_NAMESPACE) is
			-- Process a non default namespace.
		require
			a_namespace_not_void: a_namespace /= Void
			namespaces_not_void: namespaces /= Void
		local
			a_candidate_namespace: XM_NAMESPACE
		do
			if not namespaces.has (a_namespace.uri) then
				-- The namespace is not known, we need
				-- to register it.
				if a_namespace.has_prefix
					and then not prefixes.has (a_namespace.ns_prefix)
				then
					register_namespace (a_namespace)
				else 
					-- The namespace may be without prefix (a default 
					-- declaration) or the prefix is already used.
					-- Use an alternative prefix.
					create a_candidate_namespace.make (unique_prefix, a_namespace.uri)
					register_namespace (a_candidate_namespace)
				end
			else
				check has: namespaces.has (a_namespace.uri) end
				-- The namespace is known, this may be with another 
				-- prefix, in which case the first prefix will be 
				-- used everywhere.
			end
		end

feature {NONE} -- Implementation

	make_namespaces is
			-- Initialise namespace tables.
		do
			create namespaces.make_default
			create prefixes.make_default
		ensure
			namespaces_not_void: namespaces /= Void
			prefixes_not_void: prefixes /= Void
		end
		
	register_namespace (a_ns: XM_NAMESPACE) is
			-- Register a namespace (and prefix).
		require
			a_ns_not_void: a_ns /= Void
			not_default_declaration: a_ns.has_prefix
			namespaces_not_void: namespaces /= Void
			not_known_namespace: not namespaces.has (a_ns.uri)
			not_known_prefix: not prefixes.has (a_ns.ns_prefix)
		do
			namespaces.force_new (a_ns, a_ns.uri)
			prefixes.force_new (a_ns, a_ns.ns_prefix)
		end
		
	unique_prefix: STRING is
			-- Find out a prefix not used in current 
			-- namespaces.
		require
			namespaces_not_void: namespaces /= Void
		local
			i: INTEGER
		do
			-- This linear search will not be very efficient 
			-- if there are lots of different namespaces with 
			-- duplicate prefixes, but this seems unlikely. 
			-- An alternative implementation could use 
			-- dichotomic search on i, or a pseudo-random i.
			from
				Result := "ns1"
				i := 1
			variant
				prefixes.count + 2 - i
			until
				not prefixes.has (Result)
			loop
				i := i + 1
				Result := "ns" + i.out
			end
		ensure
			result_not_void: Result /= Void
			new_prefix: not prefixes.has (Result)
		end

invariant
	
	namespaces_with_prefixes: namespaces /= Void implies prefixes /= Void
		
end
