indexing

	description:

		"Objects that represent a XML namespace declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE

creation

	make

feature {NONE} -- Initialisation

	make (a_prefix, a_uri: UC_STRING) is
		require
			valid: (a_uri = Void implies a_prefix /= Void) and (a_prefix = Void implies a_uri /= Void)
		do
			ns_prefix := a_prefix
			uri := a_uri
		end

feature {ANY} -- Access

	ns_prefix: UC_STRING
			-- Prefix of this namespace

	uri: UC_STRING
			-- Namespace URI

	is_default: BOOLEAN is
			-- Is this a default namespace declaration?
		do
			Result := ns_prefix = Void or else
				ns_prefix.count = 0
		end

invariant

	either_uri_not_void_or_prefix: (uri = Void implies ns_prefix /= Void) and (ns_prefix = Void implies uri /= Void)

end
