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

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_SHARED_CONFORMANCE

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

	uri_for_prefix (an_xml_prefix: STRING): STRING is
			-- URI for a namespace prefix;
			-- The default namespace is NOT used when the prefix is empty.
		do
			Result := namespaces.item (an_xml_prefix)
		end

		is_backwards_compatible_mode: BOOLEAN is
			-- Is Backwards Compatible Mode used?
		do
			Result := conformance.xpath_one_compatibility
		end

feature -- Status report

	is_declared_prefix (an_xml_prefix: STRING): BOOLEAN is
			-- Is `an_xml_prefix' allocated to a namespace?
		do
			Result := namespaces.has (an_xml_prefix)
		end

feature -- Element change

	clear_namespaces is
			-- Clear all the declared namespaces, except for the standard ones.
		do
			--TODO
		end

	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		local
			var: XM_XPATH_VARIABLE
		do
			var := variables.item (a_fingerprint)
			if var /= Void then
				was_last_variable_bound := True
				internal_last_bound_variable := var
				-- TODO add option to return boolean false value if not found
			end
		end

	bind_function (a_qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
		local
			an_xml_prefix, a_uri, a_local_name: STRING
			a_fingerprint, a_name_code: INTEGER
			a_splitter: ST_SPLITTER
			name_parts: DS_LIST [STRING]
		do
			debug ("XPath stand-alone context")
				std.error.put_string ("Binding function: ")
				std.error.put_string (a_qname)
				std.error.put_new_line
			end
			if is_ncname (a_qname) then
				bind_system_function (a_qname, arguments)
			else

				-- The function QName is prefixed, but it still may be a system-function

				create a_splitter.make
				a_splitter.set_separators (":")
				name_parts := a_splitter.split (a_qname)
					check
						two_name_components: name_parts.count = 2
					end
				an_xml_prefix := name_parts.item (1)
				a_local_name := name_parts.item (2)
				if is_declared_prefix (an_xml_prefix) then
					a_uri := uri_for_prefix (an_xml_prefix)
					if name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
						a_name_code := name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
					else
						name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
						a_name_code := name_pool.last_name_code
					end
					a_fingerprint := a_name_code // bits_20
					if STRING_.same_string (a_uri, Xpath_functions_uri) then
						bind_system_function (a_local_name, arguments)
					else

						-- A built-in extension function, or a contructor for a built-in type

						--	Now try for a constructor function for a built-in type

						-- TODO

						was_last_function_bound := False
						set_bind_function_failure_message ("Not implemented")
					end
				else
					was_last_function_bound := False
					set_bind_function_failure_message (STRING_.appended_string (an_xml_prefix, " is not an in-scope XML prefix."))
				end
			end
		end
	
feature {NONE} -- Implementation

	namespaces: DS_HASH_TABLE [STRING, STRING]
			-- Maps prefixes to URIs

	variables:  DS_HASH_TABLE [XM_XPATH_VARIABLE, INTEGER]
			-- Variable-bindings
	
	bind_system_function (a_name: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a system function appearing in an expression.
		require
			valid_qname: a_name /= Void and then is_qname (a_name)
			arguments_not_void: arguments /= Void
		local
			a_function_call: XM_XPATH_FUNCTION_CALL
		do
			-- TODO - need a system function factory
			a_function_call := Function_factory.make_system_function (a_name)
			if a_function_call = Void then
				was_last_function_bound := False
				set_bind_function_failure_message (STRING_.appended_string ("Unknown system function: ", a_name))
			else
				was_last_function_bound := True
				a_function_call.set_arguments (arguments)
				set_last_bound_function (a_function_call)
			end
		ensure
			function_bound: was_last_function_bound implies last_bound_function /= Void
		end

	bits_20: INTEGER is 1048576 
			-- 0x0fffff

invariant

	namespaces /= Void

end
