note

	description:

		"Objects that implement the XPath codepoints-to-string() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CODEPOINTS_TO_STRING

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, create_iterator
		end

	UC_IMPORTED_UNICODE_ROUTINES

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	-- TODO: pre-evaluate

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "codepoints-to-string"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Codepoints_to_string_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_integer_sequence
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_string: STRING
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_value: XM_XPATH_ATOMIC_VALUE
			l_machine_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_integer_value: XM_XPATH_INTEGER_VALUE
			l_integer: INTEGER
		do
			arguments.item (1).create_iterator (a_context)
			check postcondition_of_create_iterator: attached arguments.item (1).last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
				else
					l_string := ""
					from l_iterator.start until is_error or else l_iterator.after loop
						l_value := l_iterator.item.as_atomic_value
						if l_value.is_machine_integer_value then
							l_machine_integer_value := l_iterator.item.as_machine_integer_value
							if l_machine_integer_value.is_platform_integer then
								l_integer := l_machine_integer_value.as_integer
							else
								set_last_error_from_string ("Codepoint is not a valid XML Character", Xpath_errors_uri, "FOCH0001", Dynamic_error)
							end
						elseif l_value.is_integer_value then
							l_integer_value := l_iterator.item.as_integer_value
							if l_integer_value.is_platform_integer then
								l_integer := l_integer_value.as_integer
							else
								set_last_error_from_string ("Codepoint is not a valid XML Character", Xpath_errors_uri, "FOCH0001", Dynamic_error)
							end
						else
							set_last_error_from_string ("Codepoint is not a valid XML Character", Xpath_errors_uri, "FOCH0001", Dynamic_error)
						end
						if not is_error then
							if l_integer >= 0 and then is_char (l_integer.to_natural_32) then
								l_string := STRING_.appended_string (l_string, unicode.code_to_string (l_integer))
								l_iterator.forth
								if attached l_iterator.error_value as l_error_value then
									check is_error: l_iterator.is_error end
									set_last_error (l_error_value)
								end
							else
								set_last_error_from_string ("Codepoint is not a valid XML Character", Xpath_errors_uri, "FOCH0001", Dynamic_error)
							end
						end
					end
					if attached error_value as l_error_value then
						check is_error: is_error end
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
					else
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_string))
					end
				end
			end
		end


	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			evaluate_item (l_result, a_context)
			check attached l_result.item as l_result_item then
				if attached l_result_item.error_value as l_error_value then
					check is_error: l_result_item.is_error end
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
				else
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_result_item)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

