indexing

	description:

		"Objects that provide access to built-in extension functions functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_BUILTIN_EXTENSION_FUNCTIONS

inherit

	XM_XPATH_FUNCTION_LIBRARY

	XM_XPATH_STANDARD_NAMESPACES

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
		do
			if not is_restricted then
				if a_fingerprint = Transformation_function_type_code then
					Result := an_arity = -1 or else an_arity = 2 or else an_arity = 7
				end
			end
		end
	
feature -- Element change
	
	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		local
			a_function_call: XM_XPATH_FUNCTION_CALL
		do
			if a_fingerprint = Transformation_function_type_code then
				create {XM_XSLT_TRANSFORMATION} a_function_call.make
				check
					function_bound: a_function_call /= Void
					-- From pre-condition
				end
				a_function_call.set_arguments (some_arguments)
				last_bound_function := a_function_call
			end
		end

end
