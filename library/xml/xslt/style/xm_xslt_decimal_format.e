indexing

	description:

		"xsl:decimal-format element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	name: STRING
			-- Name

	decimal_separator: STRING
			-- Decimal separator sign

	grouping_separator: STRING
			-- Grouping separator sign

	infinity: STRING
			-- Infinity symbol

	minus_sign: STRING
			-- Minus symbol

	nan: STRING
			-- NaN symbol

	percent: STRING
			-- Percent symbol

	per_mille: STRING
			-- Per-mill symbol

	zero_digit: STRING
			-- Zero digit symbol

	digit: STRING
			-- Digit sign

	pattern_separator: STRING
			-- Pattern separator sign

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					name := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Decimal_separator_attribute) then
					decimal_separator	:= attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Grouping_separator_attribute) then
					grouping_separator := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Infinity_attribute) then
					infinity := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Minus_sign_attribute) then
					minus_sign := attribute_value_by_index (a_cursor.index)					
				elseif STRING_.same_string (an_expanded_name, Nan_attribute) then
					nan := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Percent_attribute) then
					percent := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Per_mille_attribute) then
					per_mille := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Zero_digit_attribute) then
					zero_digit := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Digit_attribute) then
					digit := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Pattern_separator_attribute) then
					pattern_separator	:= attribute_value_by_index (a_cursor.index)					
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			attributes_prepared := True			
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			check_empty
			validate_decimal_separator
			validate_grouping_separator
			validate_percent
			validate_per_mille
			validate_zero_digit
			validate_digit
			validate_pattern_separator
			validate_minus_sign
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		local
			a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			a_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			a_message: STRING
			a_fingerprint: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if name = Void then
				a_fingerprint := -1
			elseif is_qname (name) then
				generate_name_code (name)
				if last_generated_name_code = -1 then
					create an_error.make_from_string (STRING_.concat("Invalid QName for xsl:decimal-format: ", name_code_error_value.description), Xpath_errors_uri, "XTDE1280", Static_error)
					report_compile_error (an_error)
				else
					a_fingerprint := last_generated_name_code
				end
			else
				create an_error.make_from_string (STRING_.concat(name, " is not a valid QName"), Xpath_errors_uri, "XTDE1280", Static_error)
				report_compile_error (an_error)
			end
			create a_decimal_format.make (a_fingerprint)
			if decimal_separator /= Void then
				a_decimal_format.set_decimal_separator (decimal_separator)
			end
			if grouping_separator /= Void then
				a_decimal_format.set_grouping_separator (grouping_separator)
			end
			if pattern_separator /= Void then
				a_decimal_format.set_pattern_separator (pattern_separator)
			end
			if percent /= Void then
				a_decimal_format.set_percent (percent)
			end						
			if per_mille /= Void then
				a_decimal_format.set_per_mille (per_mille)
			end						
			if minus_sign /= Void then
				a_decimal_format.set_minus_sign (minus_sign)
			end						
			if zero_digit /= Void then
				a_decimal_format.set_zero_digit (zero_digit)
			end						
			if digit /= Void then
				a_decimal_format.set_digit_sign (digit)
			end
			if infinity /= Void then
				a_decimal_format.set_infinity (infinity)
			end						
			if nan /= Void then
				a_decimal_format.set_nan (nan)
			end						
			if not a_decimal_format.are_all_distinct then
				create an_error.make_from_string ("Not all picture characters are distinct.", Xpath_errors_uri, "XTSE1300", Static_error)
				report_compile_error (an_error)
			else
				a_format_manager := principal_stylesheet.decimal_format_manager
				if a_fingerprint = -1 then
					if a_format_manager.is_default_format_set then
						if a_format_manager.is_different_from_default_format (a_decimal_format) then
							create an_error.make_from_string ("Cannot define a default xsl:decimal-format twice, unless all attributes are identical", Xpath_errors_uri, "XTSE1290", Static_error)
							report_compile_error (an_error)
						end
					else
						a_format_manager.set_default_format (a_decimal_format)
					end
				else
					if a_format_manager.has_named_format (a_fingerprint) then
						if not a_format_manager.is_duplicate_format (a_decimal_format) then
							a_message := STRING_.concat ("Cannot define xsl:decimal-format named ", name)
							a_message := STRING_.appended_string (a_message, " twice, unless all values are identical")
							create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1290", Static_error)
							report_compile_error (an_error)
						end
					else
						a_format_manager.set_named_format (a_decimal_format)
					end
				end
			end
			last_generated_expression := Void
		end

feature {NONE} -- Implementation

	validate_decimal_separator is
			-- Validate `decimal_separator'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if decimal_separator /= Void and then decimal_separator.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format decimal-separator must be s single character. Found ", decimal_separator)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_grouping_separator is
			-- Validate `grouping_separator'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if grouping_separator /= Void and then grouping_separator.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format grouping-separator must be s single character. Found ", grouping_separator)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_percent is
			-- Validate `percent'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if percent /= Void and then percent.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format percent must be s single character. Found ", percent)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_per_mille is
			-- Validate `per_mille'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if per_mille /= Void and then per_mille.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format per-mille must be s single character. Found ", per_mille)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_zero_digit is
			-- Validate `zero_digit'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if zero_digit /= Void and then zero_digit.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be s single character. Found ", zero_digit)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end
		
	validate_digit is
			-- Validate `digit'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if digit /= Void and then digit.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format digit must be s single character. Found ", digit)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_pattern_separator is
			-- Validate `pattern_separator'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if pattern_separator /= Void and then pattern_separator.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format pattern-separator must be s single character. Found ", pattern_separator)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

	validate_minus_sign is
			-- Validate `minus_sign'.
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if minus_sign /= Void and then minus_sign.count /= 1 then
				a_message := STRING_.appended_string ("xsl:decimal-format minus-sign must be s single character. Found ", minus_sign)
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			end
		end

end
