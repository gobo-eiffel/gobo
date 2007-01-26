indexing

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

	make is
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			a_string: STRING
			a_source_map, a_target_map: XM_XPATH_STRING_VALUE
		do
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item /= Void then a_string := an_item.string_value end
			if a_string = Void then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
			else
				arguments.item (2).evaluate_item (a_context)
				check
					source_map: arguments.item (2).last_evaluated_item /= Void and then arguments.item (2).last_evaluated_item.is_string_value
					-- static typing
				end
				a_source_map := arguments.item (2).last_evaluated_item.as_string_value
				arguments.item (3).evaluate_item (a_context)
				check
					target_map: arguments.item (3).last_evaluated_item /= Void and then arguments.item (3).last_evaluated_item.is_string_value
					-- static typing
				end
				a_target_map := arguments.item (3).last_evaluated_item.as_string_value
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (translated_string (a_string, a_source_map.string_value, a_target_map.string_value))
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

	translated_string (a_value, a_source_map, a_target_map: STRING): STRING is
			-- Translated version of `a_value'
		require
			valid_value: a_value /= Void
			source_map_not_void: a_source_map /= Void
			target_map_not_void: a_target_map /= Void
		local
			an_index, a_count: INTEGER
			a_char, a_string: STRING
		do
			from
				Result := ""
				an_index := 1
				a_count := a_value.count
			until
				an_index > a_count
			loop
				a_char := a_value.substring (an_index,an_index)
				a_string := translated_character (a_char, a_source_map, a_target_map)
				if a_string = Void then
					a_string := a_char
				end
				Result := STRING_.appended_string (Result, a_string)												  
				an_index := an_index + 1
			end
		ensure
			translated_string_not_void: Result /= Void
		end

	translated_character (a_char, a_source_map, a_target_map: STRING): STRING is
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
	
