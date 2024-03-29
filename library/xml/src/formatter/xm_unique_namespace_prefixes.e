﻿note

	description:

		"Infer a unique set of namespace prefixes for a document tree"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"

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

	process_document (a_node: XM_DOCUMENT)
			-- Process document.
		do
			make_namespaces
			a_node.process_children (Current)
		end

	process_element (a_node: XM_ELEMENT)
			-- Collect namespaces.
		do
			process_namespace (a_node.namespace)
			a_node.process_children (Current)
		end

	process_attribute (a_node: XM_ATTRIBUTE)
			-- Collect namespaces.
		do
			process_namespace (a_node.namespace)
		end

feature -- State

	namespaces: detachable DS_HASH_TABLE [XM_NAMESPACE, STRING]
			-- All of the document namespaces with
			-- explicit prefixes (indexed by URI).
			-- ensure prefixes are unique.

feature {NONE} -- State

	prefixes: detachable DS_HASH_TABLE [XM_NAMESPACE, STRING]
			-- Inverted index of prefixes from `namespaces'.

feature -- Result

	top_level_declaration: STRING
			-- Top level declaration of all xml namespaces within
			-- the document.
		require
			namespaces_not_void: namespaces /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_NAMESPACE, STRING]
		do
			check precondition: attached namespaces as l_namespaces then
				from
					create Result.make_empty
					a_cursor := l_namespaces.new_cursor
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
			end
		ensure
			not_void_result: Result /= Void
		end

	has_namespace (a_ns: XM_NAMESPACE): BOOLEAN
			-- Is this namespace known (has an allocated prefix)?
		require
			a_ns_not_void: a_ns /= Void
		do
			Result := attached namespaces as l_namespaces and then (l_namespaces.has (a_ns.uri) or implicit_namespaces.has (a_ns.uri))
		end

	ns_prefix (a_ns: XM_NAMESPACE): STRING
			-- Prefix for a non default NS.
		require
			a_ns_not_void: a_ns /= Void
			has: has_namespace (a_ns)
			item_has_prefix: (attached namespaces as l_namespaces and then l_namespaces.has (a_ns.uri)) implies l_namespaces.item (a_ns.uri).has_prefix
		local
			l_ns_prefix: detachable STRING
		do
			if attached namespaces as l_namespaces and then l_namespaces.has (a_ns.uri) then
				l_ns_prefix := l_namespaces.item (a_ns.uri).ns_prefix
			else
				l_ns_prefix := implicit_namespaces.item (a_ns.uri).ns_prefix
			end
			check has_prefix: l_ns_prefix /= Void then
				Result := l_ns_prefix
			end
		ensure
			result_not_void: Result /= Void
			result_not_empty: Result.count > 0
		end

	namespace_declaration (a_ns: XM_NAMESPACE): STRING
			-- Single xmlns declaration.
		require
			a_ns_not_void: a_ns /= Void
		do
			Result := STRING_.cloned_string (Xmlns)
			if a_ns.has_prefix and attached a_ns.ns_prefix as l_ns_prefix then
				Result := STRING_.appended_string (Result, Prefix_separator)
				Result := STRING_.appended_string (Result, l_ns_prefix)
			end
			Result := STRING_.appended_string (Result, Eq_s)
			Result := STRING_.appended_string (Result, Quot_s)
			Result := STRING_.appended_string (Result, a_ns.uri)
			Result := STRING_.appended_string (Result, Quot_s)
		end

feature {NONE} -- Implementation

	process_namespace (a_namespace: XM_NAMESPACE)
			-- Process a non default namespace.
		require
			a_namespace_not_void: a_namespace /= Void
			namespaces_not_void: namespaces /= Void
		local
			a_candidate_namespace: XM_NAMESPACE
		do
			check precondition_and_invariant: attached namespaces as l_namespaces and attached prefixes as l_prefixes then
				if a_namespace.uri.is_empty then
					-- not a defined namespace
				else
					-- the namespace is a defined URI
					if not l_namespaces.has (a_namespace.uri) and not implicit_namespaces.has (a_namespace.uri) then
						-- The namespace is not known, we need
						-- to register it.
						if attached a_namespace.ns_prefix as l_ns_prefix and then a_namespace.has_prefix
							and then not l_prefixes.has (l_ns_prefix)
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
							has_or_implicit: l_namespaces.has (a_namespace.uri)
								or implicit_namespaces.has (a_namespace.uri)
						end
						-- The namespace is known, this may be with another
						-- prefix, in which case the first prefix will be
						-- used everywhere.
					end
				end
			end
		end

feature {NONE} -- Implementation

	make_namespaces
			-- Initialise namespace tables.
		local
			l_namespaces: like namespaces
			l_prefixes: like prefixes
		do
			create l_namespaces.make_map_default
			l_namespaces.set_key_equality_tester (string_equality_tester)
			namespaces := l_namespaces
			create l_prefixes.make_map_default
			l_prefixes.set_key_equality_tester (string_equality_tester)
			prefixes := l_prefixes
		ensure
			namespaces_not_void: namespaces /= Void
			prefixes_not_void: prefixes /= Void
		end

	register_namespace (a_ns: XM_NAMESPACE)
			-- Register a namespace (and prefix).
		require
			a_ns_not_void: a_ns /= Void
			not_default_declaration: attached a_ns.ns_prefix as l_ns_prefix and then a_ns.has_prefix
			namespaces_not_void: attached namespaces as l_namespaces
			not_known_namespace: not l_namespaces.has (a_ns.uri)
			not_known_prefix: attached prefixes as l_prefixes and then not l_prefixes.has (l_ns_prefix)
		do
			check precondition: attached namespaces as l_namespaces and attached prefixes as l_prefixes and attached a_ns.ns_prefix as l_ns_prefix then
				l_namespaces.force_new (a_ns, a_ns.uri)
				l_prefixes.force_new (a_ns, l_ns_prefix)
			end
		end

	unique_prefix: STRING
			-- Find out a prefix not used in current
			-- namespaces.
		require
			namespaces_not_void: namespaces /= Void
		local
			i: INTEGER
		do
			check precondition_and_invariant: attached prefixes as l_prefixes then
				-- This linear search will not be very efficient
				-- if there are lots of different namespaces with
				-- duplicate prefixes, but this seems unlikely.
				-- An alternative implementation could use
				-- dichotomic search on i, or a pseudo-random i.
				from
					Result := "ns1"
					i := 1
				until
					not l_prefixes.has (Result)
				loop
					i := i + 1
					Result := "ns" + i.out
				variant
					l_prefixes.count + 2 - i
				end
			end
		ensure
			result_not_void: Result /= Void
			new_prefix: attached prefixes as l_prefixes and then not l_prefixes.has (Result)
		end

	implicit_namespaces: DS_HASH_TABLE [XM_NAMESPACE, STRING]
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
