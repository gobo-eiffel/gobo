﻿note

	description:

		"Objects that implement the XPath matches() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_MATCHES

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

	XM_XPATH_REGEXP_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "matches"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Matches_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
			tolerate_empty_string_match
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
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

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			n: INTEGER
		do
			Precursor (a_replacement)
			if a_replacement.item = Current then
				if arguments.count = 3 then
					n := 3
				end
				try_to_compile (n, arguments)
				if attached regexp_error_value as l_regexp_error_value then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_regexp_error_value))
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_input_string: STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item then
				l_input_string := ""
			elseif not a_result_item.is_error then
				l_input_string := a_result_item.string_value
				a_result.put (Void)
				l_input_string := utf8.to_utf8 (l_input_string)
			else
				l_input_string := ""
			end
			if not attached regexp_cache_entry as l_regexp_cache_entry then
				compile_regexp (a_result, a_context)
			else
				regexp := l_regexp_cache_entry.regexp
			end
			if a_result.item = Void then
				check attached regexp as l_regexp then
					a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (l_regexp.matches (l_input_string)))
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

	regexp: detachable RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression

	compile_regexp (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Compile and execute `regexp' at evaluation time
		require
			a_result_not_void: a_result /= Void
			a_result_is_empty: a_result.item = Void
			dynamic_context_not_void: a_context /= Void
		local
			l_regexp_cache_entry: like regexp_cache_entry
			l_pattern_string, l_key: STRING
			l_flags_string: detachable STRING
		do
			arguments.item (2).evaluate_item (a_result, a_context)
			check
				pattern_not_empty: attached a_result.item as a_result_item_2
				--static typing
			then
				if not a_result_item_2.is_error then
					check
						atomic_pattern: a_result_item_2.is_atomic_value
						-- Statically typed as a single string
					end
					l_pattern_string := a_result_item_2.as_atomic_value.string_value
					l_pattern_string := utf8.to_utf8 (l_pattern_string)
					a_result.put (Void)
					if arguments.count = 2 then
						l_flags_string := ""
					else
						arguments.item (3).evaluate_item (a_result, a_context)
						check attached a_result.item as a_result_item_3 then
							if not a_result_item_3.is_error then
								check
									flags_not_empty: a_result.item /= Void
									atomic_pattern: a_result_item_3.is_atomic_value
									-- Statically typed as a single string
								end
								l_flags_string := normalized_flags_string (a_result_item_3.as_atomic_value.string_value)
							end
						end
					end
					if not attached a_result.item as a_result_item or else not a_result_item.is_error then
						if l_flags_string = Void then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error))
						else
							a_result.put (Void)
							l_key := composed_key (l_pattern_string, l_flags_string)
							l_regexp_cache_entry := shared_regexp_cache.item (l_key)
							if l_regexp_cache_entry = Void then
								create l_regexp_cache_entry.make (l_pattern_string, l_flags_string)
								if not l_regexp_cache_entry.is_error then
									shared_regexp_cache.put (l_regexp_cache_entry, l_key)
								end
							end
							if not l_regexp_cache_entry.is_error then
								regexp := l_regexp_cache_entry.regexp
							else
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error))
							end
						end
					end
				end
			end
		ensure
			regexp_not_void: a_result.item = Void implies regexp /= Void
			error: attached a_result.item as a_result_item implies a_result_item.is_error
		end

end

