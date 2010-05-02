note

	description:

		"Objects that test a filter"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_FILTER_TEST [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

feature -- Access

	is_singleton_boolean_filter: BOOLEAN
			-- `True' if `filter' returns exactly one boolean

	non_numeric: BOOLEAN
			-- Is statically known numeric result not possible?

	last_match_test: BOOLEAN
			-- Result from `test_match'

	filter: XM_XPATH_EXPRESSION
			-- Filter to apply to `base_iterator'

	filter_context: XM_XPATH_CONTEXT
			-- Evaluation context for the filter

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [G]
			-- The underlying iterator

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value
		deferred
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has item failed evaluation?
		deferred
		end

feature -- Setting

	set_last_error (a_error_value: XM_XPATH_ERROR_VALUE)
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			error_value_not_void: a_error_value /= Void
		deferred
		ensure
			item_in_error: is_error
			error_value_set: error_value = a_error_value
		end

feature -- Basic operations

	test_match
			-- Test if the context item match the filter predicate?
		require
			filter_not_in_error: not filter.is_error
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			last_match_test := False
			if non_numeric or is_singleton_boolean_filter then
				filter.calculate_effective_boolean_value (filter_context)
				l_boolean_value := filter.last_boolean_value
				if l_boolean_value.is_error then
					set_last_error (l_boolean_value.error_value)
				else
					last_match_test := l_boolean_value.value
				end
			else

				-- This code is carefully designed to avoid reading more items from the
				-- iteration of the filter expression than are absolutely essential.

				filter.create_iterator (filter_context)
				l_iterator := filter.last_iterator
				if not l_iterator.is_error then
					l_iterator.start
					if not l_iterator.after then
						l_item := l_iterator.item
						if l_item.is_node then
							last_match_test := True
						elseif l_item.is_boolean_value then
							if l_item.as_boolean_value.value then
								last_match_test := True
							else
								l_iterator.forth
								last_match_test := not l_iterator.after
								if last_match_test then
									set_last_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (
										"Effective boolean value is not defined for a sequence of two or more items starting with a boolean",
										Xpath_errors_uri, "FORG0006", Type_error))
								end
							end
						elseif l_item.is_string_value or l_item.is_untyped_atomic then
							last_match_test := not l_item.as_string_value.string_value.is_empty
							if not last_match_test then
								l_iterator.forth
								last_match_test := not l_iterator.after
								if last_match_test then
									set_last_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (
										"Effective boolean value is not defined for a sequence of two or more items starting with a string",
										Xpath_errors_uri, "FORG0006", Type_error))
								end
							end
						elseif l_item.is_numeric_value then
							create l_integer_value.make (base_iterator.index)
							last_match_test := l_item.as_numeric_value.same_expression (l_integer_value)
							if not last_match_test then
								l_iterator.forth
								last_match_test := not l_iterator.after
								if last_match_test then
									set_last_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (
										"Effective boolean value is not defined for a sequence of two or more items starting with an atomic value",
										Xpath_errors_uri, "FORG0006", Type_error))
								end
							end
						else
							last_match_test := False
							set_last_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (
								"Effective boolean value is not defined for sequence starting with an atomic value other than a boolean, number, or string",
								Xpath_errors_uri, "FORG0006", Type_error))
						end
					end
				else

					-- We are in error

					last_match_test := False
					set_last_error (l_iterator.error_value)
				end
			end
		end

invariant

	base_iterator_not_void: base_iterator /= Void
	filter_not_void: filter /= Void
	filter_context_not_void: filter_context /= Void

end
