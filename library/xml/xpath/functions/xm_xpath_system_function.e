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

	XM_XPATH_ROLE

feature -- Access
	
	name: STRING
			-- Function name

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Required type for argument number `argument_number'
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

	add_context_document_argument (a_position: INTEGER; an_augmented_name: STRING) is
			-- Add an implicit argument referring to the context document.
			-- Called by functions such as id() and key() that take the context document as an implicit argument
		require
			positive_position: a_position >= 0
			augmented_name: an_augmented_name /= Void and then an_augmented_name.count > 2
		local
			a_root_expression: XM_XPATH_ROOT_EXPRESSION
		do
			if supplied_argument_count > a_position then

				-- This happens during expression reduction, when the extra argument is already present

				do_nothing
			else
				check
					correct_number_of_arguments: supplied_argument_count = a_position
				end

				if not arguments.extendible (1) then
					arguments.resize (arguments.count + 1)
				end
				create a_root_expression.make
				arguments.put_last (a_root_expression)
				minimum_argument_count := minimum_argument_count + 1
				maximum_argument_count := maximum_argument_count + 1
				augmented_argument_count := 1
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			counter: INTEGER
		do
			check_argument_count (minimum_argument_count, maximum_argument_count)
			if not is_error then
				from
					counter := 1
				variant
					supplied_argument_count + 1 - counter
				until
					is_error or else counter > supplied_argument_count
				loop
					check_argument (counter, a_context)
					counter := counter + 1
				end
			end
		end

feature {NONE} -- Implementation

	minimum_argument_count, maximum_argument_count: INTEGER
			-- Minimum and maximum number of arguments permitted;
			-- Maximum_argument_count = -1 implies no maximum

	check_argument (argument_number: INTEGER; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking on an argument to a function call, and add
			--  type conversion logic where necessary.
		require
			argument_number_in_range: argument_number > 0 and then argument_number <= supplied_argument_count
			context_not_void: a_context /= Void
			no_error: not is_error
		local
			a_role_locator: XM_XPATH_ROLE_LOCATOR
			an_argument: XM_XPATH_EXPRESSION
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create a_type_checker
			create a_role_locator.make (Function_role, name, argument_number)
			a_type_checker.static_type_check (a_context, arguments.item (argument_number), required_type (argument_number), a_context.is_backwards_compatible_mode, a_role_locator)
			if a_type_checker.is_static_type_check_error then
				set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "FORG0006", Type_error)
			else
				an_argument := a_type_checker.checked_expression
				an_argument.simplify
				if an_argument.is_error then
					set_last_error_from_string (an_argument.error_value.error_message, Xpath_errors_uri, "FORG0006", Type_error)
				else
					if an_argument.was_expression_replaced then
						arguments.replace (an_argument.replacement_expression, argument_number)
					else
						arguments.replace (an_argument, argument_number)
					end
				end
			end
		end

invariant

	argument_count: minimum_argument_count >= 0 and maximum_argument_count >= -1
		and (maximum_argument_count >= minimum_argument_count or else maximum_argument_count = -1)
	name_not_void: name /= Void and then name.count > 1

end
