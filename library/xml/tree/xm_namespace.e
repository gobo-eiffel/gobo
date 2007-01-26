indexing

	description:

		"XML namespace declaration, equality and hashable based on uri only"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_prefix: like ns_prefix; a_uri: like uri) is
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

	make_default is
			-- Make default namespace (empty URI)
		do
			make ("", "")
		ensure
			no_prefix: not has_prefix
			default_namespace: uri.count = 0
		end
		
feature -- Access

	ns_prefix: STRING
			-- Prefix of current namespace

	uri: STRING
			-- Namespace URI

feature -- Status report

	is_equal (other: like Current): BOOLEAN is
			-- Are the two namespaces equal?
		do
			Result := (uri = other.uri) or else
				(uri /= Void and then STRING_.same_string (uri, other.uri))
		ensure then
			definition: Result = STRING_.same_string (uri, other.uri)
		end
	
	hash_code: INTEGER is
			-- Hash code of URI.
		do
			if uri /= Void then
				Result := uri.hash_code
			end
		end
	
	out: STRING is
			-- Out.
		do
			if uri = Void then
				Result := ""
			else
				Result := uri
			end
		end
	
feature -- Status report

	same_prefix (other: XM_NAMESPACE): BOOLEAN is
			-- Same
		do
			Result := is_equal (other) and then
				((ns_prefix = other.ns_prefix) or else
					((ns_prefix /= Void and other.ns_prefix /= Void) and then STRING_.same_string (ns_prefix, other.ns_prefix)))
		ensure
			equal: Result implies is_equal (other)
			same_prefix: Result implies
				(ns_prefix = other.ns_prefix or else STRING_.same_string (ns_prefix, other.ns_prefix))
		end
		
	has_prefix: BOOLEAN is
			-- Is there an explicit prefix?
			-- (not a default namespace declaration)
		do
			Result := (ns_prefix /= Void and then ns_prefix.count > 0)
		ensure
			definition: Result = (ns_prefix /= Void and then ns_prefix.count > 0)
		end
		
invariant

	uri_not_void: uri /= Void

end
