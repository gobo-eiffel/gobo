indexing

	description:

		"Objects that provide a context for parsing an expression appearing in a context other than a stylesheet"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STAND_ALONE_CONTEXT

inherit

	XM_XPATH_STATIC_CONTEXT

	XM_XPATH_STANDARD_NAMESPACES

creation

	make, make_upon_node

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; clear_nmspces: BOOLEAN) is
			-- Establish invariant.
		require
			name_pool_not_void: a_name_pool /= Void
		do
			name_pool := a_name_pool
			create namespaces.make (10)
			if clear_nmspces then
				clear_namespaces
			end
		ensure
			name_pool_set: name_pool = a_name_pool
		end

	make_upon_node is
			-- TODO
		do
		end

feature -- Access

	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		do
			Result := Null_prefix_index
		end

	uri_for_prefix (xml_prefix: STRING): STRING is
			-- URI for a namespace prefix;
			-- The default namespace is NOT used when the prefix is empty.
		do
			Result := namespaces.item (xml_prefix)
		end

feature -- Status report

	is_declared_prefix (xml_prefix: STRING): BOOLEAN is
			-- Is `xml_prefix' allocated to a namespace?
		do
			Result := namespaces.has (xml_prefix)
		end

feature -- Element change

	clear_namespaces is
			-- Clear all the declared namespaces, except for the standard ones.
		do
			--TODO
		end

	bind_variable (fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		local
			var: XM_XPATH_VARIABLE
		do
			var := variables.item (fingerprint)
			if var /= Void then
				was_last_variable_bound := True
				internal_last_bound_variable := var
				-- TODO add option to return boolean false value if not found
			end
		end

	bind_function (qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
		do
			-- TODO
		end
	
feature {NONE} -- Implementation

	namespaces: DS_HASH_TABLE [STRING, STRING]
			-- Maps prefixes to URIs

	variables:  DS_HASH_TABLE [XM_XPATH_VARIABLE, INTEGER]
			-- Variable-bindings

invariant

	namespaces /= Void

end
