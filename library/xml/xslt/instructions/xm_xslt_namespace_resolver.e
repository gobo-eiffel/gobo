indexing

	description:

		"Objects that support lookup of a lexical QName to get the expanded QName"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_NAMESPACE_RESOLVER

inherit

	XM_UNICODE_CHARACTERS_1_1

feature -- Access

	uri_for_prefix (a_prefix: STRING; use_default_namespace: BOOLEAN): STRING is
			-- Namespace URI corresponding to a given prefix
		require
			prefix_not_void: a_prefix /= Void
		deferred
		ensure
			void_if_prefix_not_in_scope: True
		end

	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN; a_name_pool: XM_XPATH_NAME_POOL): INTEGER is
			-- Fingerprint of `a_qname'
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
			name_pool_not_void: a_name_pool /= Void
			namespace_prefix_declared: a_name_pool.is_prefix_declared (a_qname)
		deferred
		end

end

