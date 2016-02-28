note

	description:

		"Implement the XPath normalize-space() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NORMALIZE_UNICODE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	ST_IMPORTED_UNICODE_NORMALIZATION_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "normalize-unicode"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Normalize_unicode_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
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
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_form: INTEGER
			l_requested_form, l_message: STRING
			l_result: detachable STRING
			l_item: XM_XPATH_ITEM
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item_1 then
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
			elseif a_result_item_1.is_error then
				-- nothing to do
			else

				-- TODO: fast-path for ASCII?

				if arguments.count = 2 then
					l_item := a_result_item_1
					a_result.put (Void)
					arguments.item (2).evaluate_as_string (a_context)
					check postcondition_of_evaluate_as_string: attached arguments.item (2).last_evaluated_string as l_last_evaluated_string_2 then
						if l_last_evaluated_string_2.is_error then
							a_result.put (l_last_evaluated_string_2)
						else
							l_requested_form := l_last_evaluated_string_2.string_value
							STRING_.left_adjust (l_requested_form)
							STRING_.right_adjust (l_requested_form)
							l_requested_form := l_requested_form.as_upper
							if l_requested_form.is_empty then
								a_result.put (l_item)
							else
								if STRING_.same_string ("NFC", l_requested_form) then
									l_form := Nfc
								elseif STRING_.same_string ("NFKC", l_requested_form) then
									l_form := Nfkc
								elseif STRING_.same_string ("NFD", l_requested_form) then
									l_form := Nfd
								elseif STRING_.same_string ("NFKD", l_requested_form) then
									l_form := Nfkd
								else
									l_message := STRING_.concat ("Requested normalization form ", l_requested_form)
									l_message := STRING_.appended_string (l_message, " is not supported")
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (l_message,
										Xpath_errors_uri, "FOCH0003",	Dynamic_error))
								end
								if a_result.item = Void then

									-- no previous error

									inspect
										l_form
									when Nfc then
										l_result := normalization.to_nfc (l_item.string_value)
									when Nfkc then
										l_result := normalization.to_nfkc (l_item.string_value)
									when Nfd then
										l_result := normalization.as_nfd (l_item.string_value)
									when Nfkd then
										l_result := normalization.as_nfkd (l_item.string_value)
									end
								end
							end
						end
					end
				else
					l_result := normalization.to_nfc (a_result_item_1.string_value)
				end
				if l_result /= Void then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_result))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	Nfc: INTEGER = 0
			-- Default for normalization form

	Nfd: INTEGER = 1
	Nfkc: INTEGER = 2
	Nfkd: INTEGER = 3

end
