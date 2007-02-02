indexing

	description:

		"Implement the XPath normalize-space() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
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

	make is
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
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_form: INTEGER
			a_requested_form, a_message, a_result: STRING
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
			elseif arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				
				-- TODO: fast-path for ASCII?

				if arguments.count = 2 then
					arguments.item (2).evaluate_as_string (a_context)
					if arguments.item (2).last_evaluated_string.is_error then
						last_evaluated_item := arguments.item (2).last_evaluated_string
					else
						a_requested_form := arguments.item (2).last_evaluated_string.string_value
						STRING_.left_adjust (a_requested_form)
						STRING_.right_adjust (a_requested_form)
						a_requested_form := a_requested_form.as_upper
						if a_requested_form.is_empty then
							last_evaluated_item := arguments.item (1).last_evaluated_item
						else
							if STRING_.same_string ("NFC", a_requested_form) then
								a_form := Nfc
							elseif STRING_.same_string ("NFKC", a_requested_form) then
								a_form := Nfkc
							elseif STRING_.same_string ("NFD", a_requested_form) then
								a_form := Nfd
							elseif STRING_.same_string ("NFKD", a_requested_form) then
								a_form := Nfkd
							else
								a_message := STRING_.concat ("Requested normalization form ", a_requested_form)
								a_message := STRING_.appended_string (a_message, " is not supported")
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message,
																															Xpath_errors_uri,
																															"FOCH0003",
																															Dynamic_error)
							end
							if last_evaluated_item = Void then

								-- no previous error

								inspect
									a_form
								when Nfc then
									a_result := normalization.to_nfc (arguments.item (1).last_evaluated_item.string_value)
								when Nfkc then
									a_result := normalization.to_nfkc (arguments.item (1).last_evaluated_item.string_value)
								when Nfd then
									a_result := normalization.as_nfd (arguments.item (1).last_evaluated_item.string_value)
								when Nfkd then
									a_result := normalization.as_nfkd (arguments.item (1).last_evaluated_item.string_value)
								end
							end
						end
					end
				else
					a_result := normalization.to_nfc (arguments.item (1).last_evaluated_item.string_value)
				end
				if a_result /= Void then
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_result)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	Nfc: INTEGER is 0
			-- Default for normalization form

	Nfd: INTEGER is 1
	Nfkc: INTEGER is 2
	Nfkd: INTEGER is 3

end
