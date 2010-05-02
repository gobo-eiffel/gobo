note

	description:

		"Objects that implement the XPath translate() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TRANSLATE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "translate"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Translate_function_type_code
			minimum_argument_count := 3
			maximum_argument_count := 3
			create arguments.make (3)
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
			inspect
				argument_number
			when 1 then
				create Result.make_optional_string
			when 2 then
				create Result.make_single_string
			when 3 then
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_string: STRING
			l_source_map, l_target_map: XM_XPATH_STRING_VALUE
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then a_result.item.is_error then
				-- nothing to do
			else
				if a_result.item /= Void then
					l_string := a_result.item.string_value
				end
				if l_string = Void then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
				else
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					if a_result.item /= Void and then a_result.item.is_error then
						-- nothing to do
					else
						check
							source_map: a_result.item /= Void and then a_result.item.is_string_value
							-- static typing
						end
						l_source_map := a_result.item.as_string_value
						a_result.put (Void)
						arguments.item (3).evaluate_item (a_result, a_context)
						if a_result.item /= Void and then a_result.item.is_error then
							-- nothing to do
						else
							check
								target_map: a_result.item /= Void and then a_result.item.is_string_value
								-- static typing
							end
							l_target_map := a_result.item.as_string_value
							a_result.put (create {XM_XPATH_STRING_VALUE}.make (translated_string (l_string, l_source_map.string_value, l_target_map.string_value)))
						end
					end
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

	translated_string (a_value, a_source_map, a_target_map: STRING): STRING
			-- Translated version of `a_value'
		require
			valid_value: a_value /= Void
			source_map_not_void: a_source_map /= Void
			target_map_not_void: a_target_map /= Void
		local
			an_index, a_count: INTEGER
			a_char, l_string: STRING
		do
			from
				Result := ""
				an_index := 1
				a_count := a_value.count
			until
				an_index > a_count
			loop
				a_char := a_value.substring (an_index,an_index)
				l_string := translated_character (a_char, a_source_map, a_target_map)
				if l_string = Void then
					l_string := a_char
				end
				Result := STRING_.appended_string (Result, l_string)
				an_index := an_index + 1
			end
		ensure
			translated_string_not_void: Result /= Void
		end

	translated_character (a_char, a_source_map, a_target_map: STRING): STRING
			-- Translate one character
		require
			source_map_not_void: a_source_map /= Void
			target_map_not_void: a_target_map /= Void
			a_char_not_void: a_char /= Void
			a_char_single: a_char.count = 1
		local
			an_index: INTEGER
		do
			an_index := STRING_.substring_index (a_source_map, a_char, 1)
			if an_index > 0 then
				if an_index <= a_target_map.count then
					Result := a_target_map.substring (an_index, an_index)
				else
					Result := ""
				end
			else
				Result := Void
			end
		ensure
			result_single: Result /= Void implies Result.count = 1 or else Result.count = 0
		end

end

