indexing

	description:

		"XML namespace declarations"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE

creation

	make

feature {NONE} -- Initialization

	make (a_prefix: like ns_prefix; a_uri: like uri) is
			-- Create a new namespace declaration.
		require
			valid: not (a_uri = Void and a_prefix = Void)
		do
			ns_prefix := a_prefix
			uri := a_uri
		ensure
			ns_prefix_set: ns_prefix = a_prefix
			uri_set: uri = a_uri
		end

feature -- Access

	ns_prefix: STRING
			-- Prefix of current namespace

	uri: STRING
			-- Namespace URI

feature -- Status report

	is_default: BOOLEAN is
			-- Is `Current' a default namespace declaration?
		do
			Result := (ns_prefix = Void or else ns_prefix.count = 0)
		ensure
			definition: Result = (ns_prefix = Void or else ns_prefix.count = 0)
		end

invariant

	valid: not (uri = Void and ns_prefix = Void)

end
