indexing

	description:

		"Objects that implement the XPath string-join() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_JOIN

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			optimize, evaluate_item
		end

	XM_XPATH_CARDINALITY

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "string-join"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := String_join_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make (type_factory.string_type, Required_cardinality_zero_or_more)
			else
				create Result.make_single_string
			end
		end

feature -- Optimization

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			Precursor (a_context, a_context_item_type)
			if not is_error and then not was_expression_replaced then
				an_expression := simplified_singleton
				if an_expression /= Current then
					set_replacement (an_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_result, l_string, l_separator: STRING
		do

			-- We ensure that we don't evaluate the
			--  separator argument unless there are at least two items in the sequence.

			arguments.item (1).create_iterator (a_context)
			l_iterator := arguments.item (1).last_iterator
			if l_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
			else
				l_iterator.start
				if l_iterator.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
				elseif l_iterator.after then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
				else
					l_string := l_iterator.item.string_value
					l_iterator.forth
					if l_iterator.is_error then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
					elseif l_iterator.after then
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_string))
					else

						-- Type checking ensured that the separator was not an empty sequence.

						arguments.item (2).evaluate_item (a_result, a_context)
						check
							second_string_not_void: a_result.item /= Void
							-- static typing
						end
						if a_result.item.is_error then
							-- nothing to do
						else
							l_separator := a_result.item.string_value
							l_result := STRING_.cloned_string (l_string)
							from
							until
								l_iterator.is_error or else l_iterator.after
							loop
								l_string := l_iterator.item.string_value
								l_result := STRING_.appended_string (l_result, l_separator)
								l_result := STRING_.appended_string (l_result, l_string)
								l_iterator.forth
							end
							if l_iterator.is_error then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
							else
								a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_result))
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	simplified_singleton: XM_XPATH_EXPRESSION is
			-- Simplified version of `Current' when first argument is a singleton;
			-- Important as this is common for attribute value templates.
		require
			not_in_error: not is_error
		do
			if arguments.item (1).cardinality_allows_many then
				Result := Current
			else
				Result := arguments.item (1)
			end
		ensure
			result_not_void: Result /= Void
		end

end

