indexing

	description:

		"Objects that represent a list of namespaces"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAMESPACE_CONTEXT

inherit

	XM_XSLT_NAMESPACE_RESOLVER

	KL_IMPORTED_STRING_ROUTINES

creation

	make

		-- TODO: static context can't vary within an XPath expression. Therefore, save the
		-- namespace context at the outermost expression level if any subexpression needs it.

feature {NONE} -- Initialization

	make (a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]; a_name_pool: XM_XPATH_NAME_POOL) is
			-- Establish invariant.
		require
			namespace_code_list_not_void: a_namespace_code_list /= Void
			name_pool_not_void: a_name_pool /= Void
		do
			namespace_code_list := a_namespace_code_list
			name_pool := a_name_pool
		ensure
			namespace_code_list_set: namespace_code_list = a_namespace_code_list
			name_pool_set: name_pool = a_name_pool
		end

feature -- Access

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- List of namespace codes

	uri_for_prefix (a_prefix: STRING; use_default_namespace: BOOLEAN): STRING is
			-- Namespace URI corresponding to a given prefix
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if STRING_.same_string (a_prefix, "") and then not use_default_namespace then
				Result := ""
			else
				from
					a_cursor := namespace_code_list.new_cursor
					a_cursor.finish
				variant
					a_cursor.index
				until
					a_cursor.before
				loop
					if STRING_.same_string (name_pool.prefix_from_namespace_code (a_cursor.item), a_prefix) then
						Result := name_pool.uri_from_namespace_code (a_cursor.item)
						a_cursor.go_before
					else
						a_cursor.back
					end
				end
			end
			if Result /= Void then

				-- There remains the possibility that a default namespace has not been declared,
				--  in which case we use the default default namespace - ""

				if STRING_.same_string (a_prefix, "") and then use_default_namespace then
					Result := ""
				end
			end
		end

	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN; a_name_pool: XM_XPATH_NAME_POOL): INTEGER is
			-- Fingerprint of `a_qname'
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			a_uri: STRING			
		do
			create a_string_splitter.make
			a_string_splitter.set_separators (":")
			qname_parts := a_string_splitter.split (a_qname)
			if qname_parts.count = 1 then
				a_uri := uri_for_prefix ("", use_default_namespace)
				Result := name_pool.fingerprint (a_uri, qname_parts.item (1))
			else
				a_uri := uri_for_prefix (qname_parts.item (1), use_default_namespace)
				Result := name_pool.fingerprint (a_uri, qname_parts.item (2))
			end
		end

feature {NONE} -- Implementation

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

invariant

	namespace_code_list_not_void: namespace_code_list /= Void
	name_pool_not_void: name_pool /= Void
	
end

