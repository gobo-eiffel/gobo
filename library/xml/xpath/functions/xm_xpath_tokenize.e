indexing

	description:

		"Objects that implement the XPath tokenize() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TOKENIZE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, iterator
		end

	XM_XPATH_REGEXP_CACHE_ROUTINES

	XM_XPATH_SHARED_REGEXP_CACHE

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "tokenize"
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
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
			simplify_arguments
			if arguments.count = 3 then n := 3 end
			try_to_compile (n)
		end
		
feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_input_string, a_pattern_string, a_flags_string, a_key: STRING
			a_regexp_cache_entry: like regexp_cache_entry
		do
			arguments.item (1).evaluate_item (a_context)
			an_input_string := arguments.item (1).last_evaluated_item.string_value
			if regexp_cache_entry = Void then
				arguments.item (2).evaluate_item (a_context)
				an_atomic_value ?= arguments.item (2).last_evaluated_item
				check
					atomic_pattern: an_atomic_value /= Void
					-- Statically typed as a single string
				end
				a_pattern_string := an_atomic_value.string_value
				if arguments.count = 2 then
					a_flags_string := ""
				else
					arguments.item (3).evaluate_item (a_context)
					an_atomic_value ?= arguments.item (3).last_evaluated_item
					check
						atomic_pattern: an_atomic_value /= Void
						-- Statically typed as a single string
					end
					a_flags_string := normalized_flags_string (an_atomic_value.string_value)
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
						if a_regexp_cache_entry.regexp.matches ("") then
							create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Dynamic_error)
						else
							create {XM_XPATH_TOKEN_ITERATOR} Result.make (an_input_string, a_regexp_cache_entry)
						end
					else
						create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error)
					end
				end
			else
				create {XM_XPATH_TOKEN_ITERATOR} Result.make (an_input_string, regexp_cache_entry)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

feature {NONE} -- Implementation

	regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY
			-- Cached regular expression

	try_to_compile (a_flag_argument_position: INTEGER) is
			-- Attempt to compile `regexp'.
		require
			flag_argument_number: a_flag_argument_position = 0
				or else ( a_flag_argument_position > 2 and then a_flag_argument_position <= arguments.count)
		local
			a_flags_string, a_key: STRING
			a_string_value: XM_XPATH_STRING_VALUE
		do
			if a_flag_argument_position = 0 then
				a_flags_string := ""
			else
				a_string_value ?= arguments.item (a_flag_argument_position)
				if a_string_value /= Void then
					a_flags_string := normalized_flags_string (a_string_value.string_value)
				end
			end
			if a_flags_string = Void then
				set_last_error_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error)
			else
				a_string_value ?= arguments.item (2) -- the pattern
				if a_string_value /= Void then
					a_key := composed_key (a_string_value.string_value, a_flags_string)
					regexp_cache_entry :=  shared_regexp_cache.item (a_key)
					if regexp_cache_entry = Void then
						create regexp_cache_entry.make (a_string_value.string_value, a_flags_string)
						if regexp_cache_entry.is_error then
							regexp_cache_entry := Void
						else
							shared_regexp_cache.put (regexp_cache_entry, a_key)
						end
					end
					if regexp_cache_entry /= Void then
						if regexp_cache_entry.regexp.matches ("") then
							set_last_error_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Static_error)
						end
					end
				end
			end
		end
	
end
	
