note

	description:

		"Objects that provide access to functions defined by xsl:function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_STYLESHEET_FUNCTION_LIBRARY

inherit

	XM_XPATH_FUNCTION_LIBRARY

		-- The XSLT processor will instantiate two objects of this class,
		--  one for functions defined with (or defaulted to) override="yes", and the other
		--  for functions defined with override="no". These two objects
		--  will bracket all the extension-function libraries in the serach order.

create

	make

feature {NONE} -- Initialization

	make (a_stylesheet: XM_XSLT_STYLESHEET; overriding: BOOLEAN)
			-- Establish invariant
		require
			principal_stylesheet: a_stylesheet /= Void and then a_stylesheet.principal_stylesheet = a_stylesheet
		do
			stylesheet := a_stylesheet
			is_overriding := overriding
		ensure
			stylesheet_set: stylesheet = a_stylesheet
			is_overriding_set: is_overriding = overriding
		end

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		local
			a_function: detachable XM_XSLT_FUNCTION
		do
			if not is_restricted then
				a_function := stylesheet.stylesheet_function (a_fingerprint, an_arity)
				Result := a_function /= Void and then a_function.is_overriding = is_overriding
			end
		end

feature -- Status report

	is_overriding: BOOLEAN
			-- Do functions defined in `Current' override extension functions?


feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN)
			-- Bind `a_fingerprint' to it's definition as `last_bound_function', setting the arguments to `some_arguments'.
		local
			a_function: XM_XSLT_FUNCTION
			a_user_function: XM_XSLT_USER_FUNCTION_CALL
		do
			check
				not_restricted: not is_restricted
				-- ensured by implementation of `is_function_available'
			end
			check attached stylesheet.stylesheet_function (a_fingerprint, some_arguments.count) as l_stylesheet_function then
				a_function := l_stylesheet_function
			end
			check
				overriding: a_function.is_overriding = is_overriding
				-- Implementation of `is_function_available' ensures this
			end
			create a_user_function.make (a_fingerprint, some_arguments)
			last_bound_function := a_user_function
			a_function.register_reference (a_user_function)
		end

feature {NONE} -- Implementation

	stylesheet: XM_XSLT_STYLESHEET
			-- Parsed principal stylesheet

invariant

	principal_stylesheet: stylesheet /= Void and then stylesheet.principal_stylesheet = stylesheet

end

