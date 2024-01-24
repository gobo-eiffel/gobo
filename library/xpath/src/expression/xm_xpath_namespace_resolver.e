note

	description:

		"Objects that support lookup of a lexical QName to get the expanded QName"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_NAMESPACE_RESOLVER

inherit

	XM_XPATH_SHARED_NAME_POOL

	XM_UNICODE_CHARACTERS_1_1

feature -- Access

	uri_for_defaulted_prefix (a_prefix: STRING; a_use_default_namespace: BOOLEAN): detachable STRING
			-- Namespace URI corresponding to a given prefix
		require
			prefix_not_void: a_prefix /= Void
		deferred
		ensure
			void_if_prefix_not_in_scope: True
		end

	fingerprint (a_qname: STRING; a_use_default_namespace: BOOLEAN): INTEGER
			-- Fingerprint of `a_qname';
			-- Returns -2 if no namespace decalaration in scope for prefix.
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		deferred
		end

end

