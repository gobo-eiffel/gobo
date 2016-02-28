note

	description:

		"Objects that represent a list of namespaces"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAMESPACE_CONTEXT

inherit

	XM_XPATH_NAMESPACE_RESOLVER

	KL_IMPORTED_STRING_ROUTINES

create

	make

		-- TODO: static context can't vary within an XPath expression. Therefore, save the
		-- namespace context at the outermost expression level if any subexpression needs it.

feature {NONE} -- Initialization

	make (a_namespace_code_list: DS_ARRAYED_LIST [INTEGER])
			-- Establish invariant.
		require
			namespace_code_list_not_void: a_namespace_code_list /= Void
		do
			namespace_code_list := a_namespace_code_list
		ensure
			namespace_code_list_set: namespace_code_list = a_namespace_code_list
		end

feature -- Access

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- List of namespace codes

	uri_for_defaulted_prefix (a_prefix: STRING; use_default_namespace: BOOLEAN): detachable STRING
			-- Namespace URI corresponding to a given prefix
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if not use_default_namespace and then a_prefix.count = 0 then
				Result := ""
			else
				from
					a_cursor := namespace_code_list.new_cursor
					a_cursor.finish
				until
					a_cursor.before
				loop
					if STRING_.same_string (shared_name_pool.prefix_from_namespace_code (a_cursor.item), a_prefix) then
						Result := shared_name_pool.uri_from_namespace_code (a_cursor.item)
						a_cursor.go_before
					else
						a_cursor.back
					end
				variant
					a_cursor.index
				end
			end
			if Result = Void then

				-- There remains the possibility that a default namespace has not been declared,
				--  in which case we use the default default namespace - ""

				if use_default_namespace and then a_prefix.count = 0 then
					Result := ""
				end
			end
		end

	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER
			-- Fingerprint of `a_qname'
		local
			a_parser: XM_XPATH_QNAME_PARSER
			a_uri: detachable STRING
		do
			create a_parser.make (a_qname)
			check attached a_parser.optional_prefix as l_optional_prefix then
				a_uri := uri_for_defaulted_prefix (l_optional_prefix, use_default_namespace)
				if a_uri = Void then
					Result := -2
				else
					check attached a_parser.local_name as l_local_name then
						Result := shared_name_pool.fingerprint (a_uri, l_local_name)
					end
				end
			end
		end

invariant

	namespace_code_list_not_void: namespace_code_list /= Void

end

