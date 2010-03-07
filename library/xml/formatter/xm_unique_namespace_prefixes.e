indexing

	description:

		"Infer a unique set of namespace prefixes for a document tree"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
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

	UC_SHARED_STRING_EQUALITY_TESTER
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
				create Result.make_empty
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

	has_namespace (a_ns: XM_NAMESPACE): BOOLEAN is
			-- Is this namespace known (has an allocated prefix)?
		require
			a_ns_not_void: a_ns /= Void
		do
			Result := namespaces /= Void
				and then (namespaces.has (a_ns.uri) or implicit_namespaces.has (a_ns.uri))
		end

	ns_prefix (a_ns: XM_NAMESPACE): STRING is
			-- Prefix for a non default NS.
		require
			a_ns_not_void: a_ns /= Void
			has: has_namespace (a_ns)
			item_has_prefix: namespaces.has (a_ns.uri) implies namespaces.item (a_ns.uri).has_prefix
		do
			if namespaces.has (a_ns.uri) then
				Result := namespaces.item (a_ns.uri).ns_prefix
			else
				Result := implicit_namespaces.item (a_ns.uri).ns_prefix
			end
		ensure
			result_not_void: Result /= Void
			result_not_empty: Result.count > 0
		end

	namespace_declaration (a_ns: XM_NAMESPACE): STRING is
			-- Single xmlns declaration.
		require
			a_ns_not_void: a_ns /= Void
		do
			Result := STRING_.cloned_string (Xmlns)
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
			if a_namespace.uri.is_empty then
				-- not a defined namespace
			else
				-- the namespace is a defined URI
				if not namespaces.has (a_namespace.uri) and not implicit_namespaces.has (a_namespace.uri) then
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
					check
						has_or_implicit: namespaces.has (a_namespace.uri)
							or implicit_namespaces.has (a_namespace.uri)
					end
					-- The namespace is known, this may be with another
					-- prefix, in which case the first prefix will be
					-- used everywhere.
				end
			end
		end

feature {NONE} -- Implementation

	make_namespaces is
			-- Initialise namespace tables.
		do
			create namespaces.make_map_default
			namespaces.set_key_equality_tester (string_equality_tester)
			create prefixes.make_map_default
			prefixes.set_key_equality_tester (string_equality_tester)
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
			until
				not prefixes.has (Result)
			loop
				i := i + 1
				Result := "ns" + i.out
			variant
				prefixes.count + 2 - i
			end
		ensure
			result_not_void: Result /= Void
			new_prefix: not prefixes.has (Result)
		end

	implicit_namespaces: DS_HASH_TABLE [XM_NAMESPACE, STRING] is
			-- Implicit namespaces defined in standards that must
			-- not be declared.
		local
			a_namespace: XM_NAMESPACE
		once
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
			create a_namespace.make (Xml_prefix, Xml_prefix_namespace)
			Result.force_new (a_namespace, a_namespace.uri)
			create a_namespace.make (Xmlns, Xmlns_namespace)
			Result.force_new (a_namespace, a_namespace.uri)
		ensure
			result_not_void: Result /= Void
		end

invariant

	namespaces_with_prefixes: namespaces /= Void implies prefixes /= Void

end
