note

	description:

		"Routines that support XPath regular expression functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REGEXP_ROUTINES

inherit

	XM_XPATH_REGEXP_CACHE_ROUTINES

	XM_XPATH_SHARED_REGEXP_CACHE

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

feature {NONE} -- Implementation

	is_empty_match_ok: BOOLEAN
			-- Is matching the empty string OK?
	
	regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY
			-- Cached regular expression

	regexp_error_value: XM_XPATH_ERROR_VALUE
			-- Possible error set by `try_to_compile'

	tolerate_empty_string_match is
			-- Allow matching empty string.
		do
			is_empty_match_ok := True
		ensure
			may_match_empty_string: is_empty_match_ok = True
		end

	try_to_compile (a_flag_argument_position: INTEGER; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Attempt to compile `regexp'.
		require
			flag_argument_number: a_flag_argument_position = 0
				or else ( a_flag_argument_position > 2 and then a_flag_argument_position <= arguments.count)
				arguments: arguments /= Void and then arguments.equality_tester.is_equal (expression_tester)
		local
			a_flags_string, a_key: STRING
			an_expression: XM_XPATH_EXPRESSION
			a_string_value: XM_XPATH_STRING_VALUE
		do
			regexp_error_value := Void
			if a_flag_argument_position = 0 then
				a_flags_string := ""
			else
				an_expression := arguments.item (a_flag_argument_position)
				if an_expression.is_string_value then
					a_flags_string := normalized_flags_string (an_expression.as_string_value.string_value)
				end
			end
			if a_flags_string /= Void then
				an_expression := arguments.item (2) -- the pattern
				if an_expression.is_string_value then
					a_string_value := an_expression.as_string_value
					a_key := composed_key (utf8.to_utf8 (a_string_value.string_value), a_flags_string)
					regexp_cache_entry :=  shared_regexp_cache.item (a_key)
					if regexp_cache_entry = Void then
						create regexp_cache_entry.make (utf8.to_utf8 (a_string_value.string_value), a_flags_string)
						if regexp_cache_entry.is_error then
							regexp_cache_entry := Void
						else
							shared_regexp_cache.put (regexp_cache_entry, a_key)
						end
					end
					if regexp_cache_entry /= Void and not is_empty_match_ok then
						if regexp_cache_entry.regexp.matches ("") then
							create regexp_error_value.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Static_error)
						end
					end
				end
			end
		end
	
end
	
