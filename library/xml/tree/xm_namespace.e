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
			-- prefix

	uri: UC_STRING
			-- uri

	is_default: BOOLEAN is
		do
			Result := ns_prefix = Void or else
				ns_prefix.empty
		end

invariant

	either_uri_not_void_or_prefix: (uri = Void implies ns_prefix /= Void) and (ns_prefix = Void implies uri /= Void)

end





