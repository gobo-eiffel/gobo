note

	description:

		"XML namespace declaration, equality and hashable based on uri only"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2013, Andreas Leitner and others"
	license: "MIT License"

class XM_NAMESPACE

inherit

	HASHABLE
		redefine
			out,
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			out,
			is_equal
		end

create

	make,
	make_default

feature {NONE} -- Initialization

	make (a_prefix: like ns_prefix; a_uri: like uri)
			-- Create a new namespace declaration.
		require
			uri_not_void: a_uri /= Void
		do
			ns_prefix := a_prefix
			uri := a_uri
		ensure
			ns_prefix_set: ns_prefix = a_prefix
			uri_set: uri = a_uri
		end

	make_default
			-- Make default namespace (empty URI)
		do
			make ("", "")
		ensure
			no_prefix: not has_prefix
			default_namespace: uri.count = 0
		end

feature -- Access

	ns_prefix: detachable STRING
			-- Prefix of current namespace

	uri: STRING
			-- Namespace URI

feature -- Status report

	is_equal (other: like Current): BOOLEAN
			-- Are the two namespaces equal?
		do
			Result := (uri = other.uri) or else
				(STRING_.same_string (uri, other.uri))
		ensure then
			definition: Result = STRING_.same_string (uri, other.uri)
		end

	hash_code: INTEGER
			-- Hash code of URI
		do
			Result := uri.hash_code
		end

	out: STRING
			-- Out
		do
			Result := uri
		end

feature -- Status report

	same_prefix (other: XM_NAMESPACE): BOOLEAN
			-- Same
		require
			other_not_void: other /= Void
		do
			Result := is_equal (other) and then
				((ns_prefix = other.ns_prefix) or else
					((attached ns_prefix as l_ns_prefix and attached other.ns_prefix as l_other_ns_prefix) and then STRING_.same_string (l_ns_prefix, l_other_ns_prefix)))
		ensure
			equal: Result implies is_equal (other)
			same_prefix: Result implies
				(ns_prefix = other.ns_prefix or else ((attached ns_prefix as l_ns_prefix and attached other.ns_prefix as l_other_ns_prefix) and then STRING_.same_string (l_ns_prefix, l_other_ns_prefix)))
		end

	has_prefix: BOOLEAN
			-- Is there an explicit prefix?
			-- (not a default namespace declaration)
		do
			Result := (attached ns_prefix as l_ns_prefix and then l_ns_prefix.count > 0)
		ensure
			definition: Result = (attached ns_prefix as l_ns_prefix and then l_ns_prefix.count > 0)
		end

invariant

	uri_not_void: uri /= Void

end
