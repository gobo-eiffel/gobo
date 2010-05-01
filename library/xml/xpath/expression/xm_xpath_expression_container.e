note

	description:

		"Objects that can act as parents of XPath Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_EXPRESSION_CONTAINER

inherit

	XM_XPATH_LOCATOR

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Approximate count of references by parameters of `Current' to `a_binding'
			-- If `a_binding' is a user-function parameter of `Current' then return 1.
			-- Else return many.
		require
			user_function: is_user_function
		deferred
		ensure
			one_or_many: Result = 1 or else Result = 10
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		require
			strictly_positive_module_number: a_module_number > 0
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

	as_computed_expression: XM_XPATH_COMPUTED_EXPRESSION is
			-- `Current' seen as a computed expression
		require
			computed_expression: is_computed_expression
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Status report

	is_computed_expression: BOOLEAN is
			-- Is `Current' a computed expression?
		deferred
		end

	is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		deferred
		end

invariant

	not_computed_expression: is_user_function implies not is_computed_expression
	not_user_function: is_computed_expression implies not is_user_function

end
	
