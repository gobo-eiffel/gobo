indexing

	description:

		"XPath system-defined and user-defined functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SYSTEM_FUNCTION

inherit

	XM_XPATH_FUNCTION_CALL
		redefine
			simplify, is_system_function, as_system_function
		end

	XM_XPATH_ROLE

feature -- Access

	namespace_uri, name: STRING
			-- Qualified function name

	is_system_function: BOOLEAN is
			-- Is `Current' an XPath system function?
		do
			Result := True
		end

	as_system_function: XM_XPATH_SYSTEM_FUNCTION is
			-- `Current' seen as an XPath system function
		do
			Result := Current
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Required type for argument number `argument_number'
		require
			argument_number_in_range: argument_number > 0 and then argument_number <= supplied_argument_count
		deferred
		ensure
			required_type_not_void: Result /= Void
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations.
		do
			Precursor (a_replacement)
			check_non_creating
		end

feature -- Element change

	use_context_item_as_default is
			-- Set "." as the default value for the first and only argument.
		local
			a_context_item_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
		do
			if supplied_argument_count = 0 then
				create a_context_item_expression.make
				a_context_item_expression.set_parent (Current)
				copy_location_identifier (a_context_item_expression)
				arguments.put (a_context_item_expression, 1)
				reset_static_properties
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
				-- do nothing

			else
				check
					correct_number_of_arguments: supplied_argument_count = a_position
				end

				if not arguments.extendible (1) then
					arguments.resize (arguments.count + 1)
				end
				create a_root_expression.make
				copy_location_identifier (a_root_expression)
				a_root_expression.set_parent (Current)
				arguments.put_last (a_root_expression)
				minimum_argument_count := minimum_argument_count + 1
				maximum_argument_count := maximum_argument_count + 1
				augmented_argument_count := 1
				reset_static_properties
			end
		end

	set_argument_error_code (an_error_code: STRING) is
			-- Set error code to be issued by `check_argument'.
		require
			error_code_not_empty: an_error_code /= void and then an_error_code.count > 0
		do
			argument_error_code := an_error_code
		ensure
			error_code_set: argument_error_code = an_error_code
		end

feature {XM_XPATH_SYSTEM_FUNCTION} -- Local

	check_non_creating is
			-- Check non-creating special property.
		require
			special_properties_computed: are_special_properties_computed
			-- Cannot be called in creation procedure, as arguments are not yet initialized.
			-- Therefore, must call in `simplify'.
		local
			l_atomic_type: XM_XPATH_ATOMIC_TYPE
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_creating: BOOLEAN
		do
			if l_atomic_type /= Void then
				set_non_creating
			else
				from
					l_cursor := arguments.new_cursor
					l_cursor.start
				until
					l_creating or l_cursor.after
				loop
					l_creating := not l_cursor.item.non_creating
					l_cursor.forth
				end
				if not l_creating then
					set_non_creating
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	argument_error_code: STRING
			-- Error code set by `check_argument'

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_counter: INTEGER
		do
			if argument_error_code = Void then
				set_argument_error_code ("FORG0006")
			end
			check_argument_count (minimum_argument_count, maximum_argument_count)
			if not is_error then
				from
					l_counter := 1
				until
					is_error or a_replacement.item /= Void or l_counter > supplied_argument_count
				loop
					if arguments.item (l_counter).is_error then
						set_replacement (a_replacement, arguments.item (l_counter))
					else
						check_argument (a_replacement, l_counter, a_context)
					end
					l_counter := l_counter + 1
				variant
					supplied_argument_count + 1 - l_counter
				end
			end
		end

feature {NONE} -- Implementation

	minimum_argument_count, maximum_argument_count: INTEGER
			-- Minimum and maximum number of arguments permitted;
			-- Maximum_argument_count = -1 implies no maximum

	check_argument (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_argument_number: INTEGER; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking on an argument to a function call, and add
			--  type conversion logic where necessary.
		require
			a_argument_number_in_range: a_argument_number > 0 and then a_argument_number <= supplied_argument_count
			context_not_void: a_context /= Void
			no_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_role_locator: XM_XPATH_ROLE_LOCATOR
			l_argument: XM_XPATH_EXPRESSION
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_type_checker
			create l_role_locator.make (Function_role, name, a_argument_number, Xpath_errors_uri, argument_error_code)
			l_type_checker.static_type_check (a_context, arguments.item (a_argument_number), required_type (a_argument_number), a_context.is_backwards_compatible_mode, l_role_locator)
			if l_type_checker.is_static_type_check_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
			else
				l_argument := l_type_checker.checked_expression
				create l_replacement.make (Void)
				l_argument.simplify (l_replacement)
				if l_argument /= l_replacement.item then
					l_argument := l_replacement.item
				end
				if l_argument.is_error then
					if l_argument.error_value.type = Type_error then
						set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string
							(l_argument.error_value.error_message, Xpath_errors_uri, argument_error_code, Type_error))
					else
						set_replacement (a_replacement, l_argument)
					end
				else
					arguments.replace (l_argument, a_argument_number)
				end
			end
		end

invariant

	argument_count: minimum_argument_count >= 0 and maximum_argument_count >= -1
		and (maximum_argument_count >= minimum_argument_count or else maximum_argument_count = -1)

end
