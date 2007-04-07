indexing

	description:

		"Objects that implement the XPath tokenize() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TOKENIZE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, create_iterator
		end

	XM_XPATH_REGEXP_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "tokenize"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Tokenize_function_type_code
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

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			l_item: XM_XPATH_ITEM
			l_input_string, l_pattern_string, l_flags_string, l_key: STRING
			l_regexp_cache_entry: like regexp_cache_entry
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			last_iterator := Void
			create l_result.make (Void)
			arguments.item (1).evaluate_item (l_result, a_context)
			if l_result.item = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif l_result.item.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
			else
				l_input_string := l_result.item.string_value
				if regexp_cache_entry = Void then
					create l_result.make (Void)
					arguments.item (2).evaluate_item (l_result, a_context)
					l_item := l_result.item
					check
						pattern_not_void: l_item /= Void
						-- static typing
					end
					if l_item.is_error then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_item.error_value)
					else
						check
							atomic_pattern: l_item.is_atomic_value
							-- Statically typed as a single string
						end
						l_pattern_string := l_item.as_atomic_value.string_value
						if arguments.count = 2 then
							l_flags_string := ""
						else
							create l_result.make (Void)
							arguments.item (3).evaluate_item (l_result, a_context)
							l_item := l_result.item
							if l_item.is_error then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_item.error_value)
							else
								check
									atomic_pattern: l_item.is_atomic_value
									-- Statically typed as a single string
								end
								l_flags_string := normalized_flags_string (l_item.as_atomic_value.string_value)
							end
						end
						if last_iterator /= Void then
							-- in error
						elseif l_flags_string = Void then
							set_last_error_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error)
						else
							l_pattern_string := utf8.to_utf8 (l_pattern_string)
							l_key := composed_key (l_pattern_string, l_flags_string)
							l_regexp_cache_entry := shared_regexp_cache.item (l_key)
							if l_regexp_cache_entry = Void then
								create l_regexp_cache_entry.make( l_pattern_string, l_flags_string)
								if not l_regexp_cache_entry.is_error then
									shared_regexp_cache.put (l_regexp_cache_entry, l_key)
								end
							end
							if not l_regexp_cache_entry.is_error then
								if l_regexp_cache_entry.regexp.matches ("") then
									create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Dynamic_error)
								else
									l_input_string := utf8.to_utf8 (l_input_string)
									create {XM_XPATH_TOKEN_ITERATOR} last_iterator.make (l_input_string, l_regexp_cache_entry)
								end
							else
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error)
							end
						end
					end
				else
					l_input_string := utf8.to_utf8 (l_input_string)
					create {XM_XPATH_TOKEN_ITERATOR} last_iterator.make (l_input_string, regexp_cache_entry)
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
			set_cardinality_zero_or_more
		end

end
	
