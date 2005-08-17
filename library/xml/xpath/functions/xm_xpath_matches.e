indexing

	description:

		"Objects that implement the XPath matches() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MATCHES

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

	XM_XPATH_REGEXP_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "matches"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Matches_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
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

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			n: INTEGER
		do
			Precursor
			if arguments.count = 3 then n := 3 end
			try_to_compile (n, arguments)
			if regexp_error_value /= Void then set_last_error (regexp_error_value) end
		end
		
feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_input_string, a_pattern_string, a_flags_string, a_key: STRING
			a_regexp_cache_entry: like regexp_cache_entry
			an_item: XM_XPATH_ITEM
		do
			last_evaluated_item := Void
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item = Void then
				an_input_string := ""
			elseif an_item.is_error then
				last_evaluated_item := an_item
			else
				an_input_string := an_item.string_value
			end
			if last_evaluated_item = Void then -- else it's an error
				if regexp_cache_entry = Void then
					arguments.item (2).evaluate_item (a_context)
					an_item := arguments.item (2).last_evaluated_item
					check
						pattern_not_empty: an_item /= Void
						--static typing
					end
					if an_item.is_error then
						last_evaluated_item := an_item
					else	
						check
							atomic_pattern: an_item.is_atomic_value
							-- Statically typed as a single string
						end
						a_pattern_string := an_item.as_atomic_value.string_value
						if arguments.count = 2 then
							a_flags_string := ""
						else
							arguments.item (3).evaluate_item (a_context)
							an_item := arguments.item (3).last_evaluated_item
							check
								flags_not_empty: an_item /= Void
								--static typing
							end
							if an_item.is_error then
								last_evaluated_item := an_item
							else
								check
									atomic_pattern: an_item.is_atomic_value
									-- Statically typed as a single string
								end
								a_flags_string := normalized_flags_string (an_item.as_atomic_value.string_value)
							end
							if a_flags_string = Void then
								set_last_error_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error)
							else
								a_key := composed_key (a_pattern_string, a_flags_string)
								a_regexp_cache_entry := shared_regexp_cache.item (a_key)
								if a_regexp_cache_entry = Void then
									create a_regexp_cache_entry.make( a_pattern_string, a_flags_string)
									if not a_regexp_cache_entry.is_error then
										shared_regexp_cache.put (a_regexp_cache_entry, a_key)
									end
								end
								if not a_regexp_cache_entry.is_error then
									regexp := a_regexp_cache_entry.regexp
								else
									create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error)
								end
							end
						end
					end
				else
					regexp := regexp_cache_entry.regexp
				end
				if last_evaluated_item = Void then
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (regexp.matches (an_input_string))
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

	regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression

end
	
