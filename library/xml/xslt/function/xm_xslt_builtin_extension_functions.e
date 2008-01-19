indexing

	description:

		"Objects that provide access to built-in extension functions functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_BUILTIN_EXTENSION_FUNCTIONS

inherit

	XM_XPATH_FUNCTION_LIBRARY

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_ERROR_TYPES
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
			-- Note that all extension functions are said to be "available" at use-when time,
			--  although they are not designed to be used then.
		do
			if a_fingerprint = Gexslt_transformation_function_type_code then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 7
			elseif a_fingerprint = Gexslt_response_body_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			end
		end
	
feature -- Element change
	
	bind_function (a_fingerprint: INTEGER; a_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		local
			l_function_call: XM_XPATH_FUNCTION_CALL
			l_error: XM_XPATH_ERROR_VALUE
		do
			if a_fingerprint = Gexslt_transformation_function_type_code then
				if is_restricted then
					create l_error.make_from_string ("Extension function gexslt:transformation may not be used in [xsl:]use-when processing",
																Gexslt_eiffel_type_uri, "USE_WHEN", Dynamic_error)
					create {XM_XSLT_DEFERRED_ERROR} last_bound_function.make (l_error, "gexslt:transformation")
				else
					create {XM_XSLT_TRANSFORMATION} l_function_call.make
					check
						function_bound: l_function_call /= Void
						-- From pre-condition
					end
					l_function_call.set_arguments (a_arguments)
					last_bound_function := l_function_call
				end
			elseif a_fingerprint = Gexslt_response_body_function_type_code then
				if is_restricted then
					create l_error.make_from_string ("Extension function gexslt:response-body may not be used in [xsl:]use-when processing",
						Gexslt_eiffel_type_uri, "USE_WHEN", Dynamic_error)
					create {XM_XSLT_DEFERRED_ERROR} last_bound_function.make (l_error, "gexslt:response-body")
				else
					create {XM_XSLT_RESPONSE_BODY} l_function_call.make
					check
						function_bound: l_function_call /= Void
						-- From pre-condition
					end
					l_function_call.set_arguments (a_arguments)
					last_bound_function := l_function_call
				end
			end
		end

end
