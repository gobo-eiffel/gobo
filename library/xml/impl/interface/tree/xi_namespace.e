indexing

	description:

		"Objects that represent a XML namespace declaration"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_NAMESPACE

inherit

	DP_IMPLEMENTATION

feature

	ns_prefix: UC_STRING is
			-- Prefix of this namespace.
		deferred
		end

	uri: UC_STRING is
			-- Namespace URI.
		deferred
		end

invariant

	either_uri_not_void_or_prefix: (uri = Void implies ns_prefix /= Void) and (ns_prefix = Void implies uri /= Void)

end

