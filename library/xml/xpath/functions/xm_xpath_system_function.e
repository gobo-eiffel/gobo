indexing

	description:

		"XPath system-defined and user-defined functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SYSTEM_FUNCTION

inherit

	XM_XPATH_FUNCTION_CALL

	XM_XPATH_TYPE_CHECKER

	XM_XPATH_ROLE

feature -- Access
	
	name: STRING
			-- Function name

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		require
			argument_number_in_range: argument_number > 0 and then argument_number <= supplied_argument_count
		deferred
		ensure
			required_type_not_void: Result /= Void
		end

feature -- Element change

	use_context_item_as_default is
			-- Set "." as the default value for the first and only argument.
		local
			a_context_item_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
		do
			if supplied_argument_count = 0 then
				create a_context_item_expression.make
				arguments.put (a_context_item_expression, 1)
				-- TODO - copy location information
			end
		end

feature {NONE} -- Implementation

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			number_of_arguments, counter: INTEGER
		do
			number_of_arguments := check_argument_count (minimum_argument_count, maximum_argument_count)
				check
					argument_count: not is_static_type_error implies supplied_argument_count = number_of_arguments
				end
			from
				counter := 1
			variant
				number_of_arguments + 1 - counter
			until
				is_static_type_error or else counter > number_of_arguments
			loop
				check_argument (counter, a_context)
				counter := counter + 1
			end
		end

	minimum_argument_count, maximum_argument_count: INTEGER
			-- Minimum and maximum number of arguments permitted;
			-- Maximum_argument_count = -1 implies no maximum

	check_argument (argument_number: INTEGER; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking on an argument to a function call, and add
			--  type conversion logic where necessary.
		require
			argument_number_in_range: argument_number > 0 and then argument_number <= supplied_argument_count
			context_not_void: a_context /= Void
			no_type_error: not is_static_type_error
		local
			a_role_locator: XM_XPATH_ROLE_LOCATOR
			an_argument: XM_XPATH_EXPRESSION
		do
			create a_role_locator.make (Function_role, name, argument_number)
			an_argument := static_type_check (arguments.item (argument_number), required_type (argument_number), a_context.is_backwards_compatible_mode, a_role_locator)
			if is_static_type_check_error then
				is_static_type_error := True
				set_last_static_type_error (static_type_check_error_message)
			else
				an_argument := an_argument.simplify
				if is_static_type_check_error then
					is_static_type_error := True
					set_last_static_type_error (static_type_check_error_message)
				else
					arguments.replace (an_argument, argument_number)
				end
			end
		end

invariant

	argument_count: minimum_argument_count >= 0 and maximum_argument_count >= -1
		and (maximum_argument_count >= minimum_argument_count or else maximum_argument_count = -1)
	name_not_void: name /= Void and then name.count > 1

end
