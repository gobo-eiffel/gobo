indexing

	description:

		"Objects that provide access to built-in type constructors."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY

inherit

	XM_XPATH_FUNCTION_LIBRARY

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		local
			a_uri_code: INTEGER -- _16
		do
			if an_arity = -1 or else an_arity = 1 then
				a_uri_code := shared_name_pool.uri_code_from_name_code (a_fingerprint)
				if a_uri_code = Xml_schema_uri_code then
					Result := type_factory.is_built_in_fingerprint (a_fingerprint)
				end
			end
		end

feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		do
			check
				atomic_type: type_factory.schema_type (a_fingerprint).is_atomic_type
				-- ensured by implementation of `is_function_available'
			end
			create {XM_XPATH_CAST_EXPRESSION} last_bound_function.make (some_arguments.item (1), type_factory.schema_type (a_fingerprint).as_atomic_type, True)
		end

end

