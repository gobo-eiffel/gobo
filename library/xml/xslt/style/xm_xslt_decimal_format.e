indexing

	description:

		"xsl:decimal-format element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, is_decimal_format, as_decimal_format
		end

	ST_IMPORTED_UNICODE_CHARACTER_CLASS_ROUTINES
		export {NONE} all end

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

feature -- Status report

	is_decimal_format: BOOLEAN is
			-- Is `Current' an xsl:decimal_format?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			-- this has already been done in `preprepare_attributes'
			attributes_prepared := True			
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			check_empty
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction, or to Eiffel code.
		do
			last_generated_expression := Void
		end

	register is
			-- Register decimal format represented by `Current' with the manager.
		local
			l_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			l_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			l_message: STRING
			l_fingerprint: INTEGER
			l_error: XM_XPATH_ERROR_VALUE
		do
			preprepare_attributes
			if not any_compile_errors then
				if name = Void then
					l_fingerprint := -1
				elseif is_qname (name) then
					generate_name_code (name)
					if last_generated_name_code = -1 then
						create l_error.make_from_string (STRING_.concat("Invalid QName for xsl:decimal-format: ", name_code_error_value.description), Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (l_error)
					else
						l_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					end
				else
					create l_error.make_from_string (STRING_.concat(name, " is not a valid QName"), Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (l_error)
				end
				if not any_compile_errors then
					l_decimal_format := created_decimal_format (l_fingerprint)
					if not l_decimal_format.are_all_distinct then
						create l_error.make_from_string ("Not all picture characters are distinct.", Xpath_errors_uri, "XTSE1300", Static_error)
						report_compile_error (l_error)
					else
						l_format_manager := principal_stylesheet.decimal_format_manager
						if l_fingerprint = -1 then
							if l_format_manager.is_default_format_set then
								if l_format_manager.is_different_from_default_format (l_decimal_format) then
									create l_error.make_from_string ("Cannot define a default xsl:decimal-format twice, unless all attributes are identical", Xpath_errors_uri, "XTSE1290", Static_error)
									report_compile_error (l_error)
									-- else nothing to do
								end
							else
								l_format_manager.set_default_format (l_decimal_format)
							end
						else
							if l_format_manager.has_named_format (l_fingerprint) then
								if not l_format_manager.is_duplicate_format (l_decimal_format) then
									if l_decimal_format.precedence = l_format_manager.named_format (l_fingerprint).precedence then
										l_message := STRING_.concat ("Cannot define xsl:decimal-format named ", name)
										l_message := STRING_.appended_string (l_message, " twice, unless all values are identical")
										create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1290", Static_error)
										report_compile_error (l_error)
									end
								end
							else
								l_format_manager.set_named_format (l_decimal_format)
							end
						end
					end
				end
			end
		end

feature -- Conversion
	
	as_decimal_format: XM_XSLT_DECIMAL_FORMAT is
			-- `Current' seen as an xsl:decimal_format
		do
			Result := Current
		end

feature {NONE} -- Implementation

	preprepare_attributes is
			-- Prepare attributes early.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name: STRING
		do
			from
				l_cursor := attribute_collection.name_code_cursor
				l_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - l_cursor.index
			until
				l_cursor.after or any_compile_errors
			loop
				l_name_code := l_cursor.item
				l_expanded_name := shared_name_pool.expanded_name_from_name_code (l_name_code)
				if STRING_.same_string (l_expanded_name, Name_attribute) then
					name := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Decimal_separator_attribute) then
					decimal_separator	:= attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Grouping_separator_attribute) then
					grouping_separator := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Infinity_attribute) then
					infinity := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Minus_sign_attribute) then
					minus_sign := attribute_value_by_index (l_cursor.index)					
				elseif STRING_.same_string (l_expanded_name, Nan_attribute) then
					nan := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Percent_attribute) then
					percent := attribute_value_by_index (l_cursor.index)										
				elseif STRING_.same_string (l_expanded_name, Per_mille_attribute) then
					per_mille := attribute_value_by_index (l_cursor.index)										
				elseif STRING_.same_string (l_expanded_name, Zero_digit_attribute) then
					zero_digit := attribute_value_by_index (l_cursor.index)										
				elseif STRING_.same_string (l_expanded_name, Digit_attribute) then
					digit := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Pattern_separator_attribute) then
					pattern_separator	:= attribute_value_by_index (l_cursor.index)					
				else
					check_unknown_attribute (l_name_code)
				end
				l_cursor.forth
			end
			if not any_compile_errors then
				validate_decimal_separator
			end
			if not any_compile_errors then
				validate_grouping_separator
			end
			if not any_compile_errors then
				validate_percent
			end
			if not any_compile_errors then
				validate_per_mille
			end
			if not any_compile_errors then
				validate_zero_digit
			end
			if not any_compile_errors then
				validate_digit
			end
			if not any_compile_errors then
				validate_pattern_separator
			end
			if not any_compile_errors then
				validate_minus_sign
			end
		end

	validate_decimal_separator is
			-- Validate `decimal_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if decimal_separator /= Void and then decimal_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format decimal-separator must be s single character. Found ", decimal_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_grouping_separator is
			-- Validate `grouping_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if grouping_separator /= Void and then grouping_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format grouping-separator must be s single character. Found ", grouping_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_percent is
			-- Validate `percent'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if percent /= Void and then percent.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format percent must be s single character. Found ", percent)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_per_mille is
			-- Validate `per_mille'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if per_mille /= Void and then per_mille.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format per-mille must be s single character. Found ", per_mille)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_zero_digit is
			-- Validate `zero_digit'.
		require
			no_error_yet: not any_compile_errors
		local
			l_code: INTEGER
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if zero_digit /= Void then
				if zero_digit.count /= 1 then
					l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be s single character. Found ", zero_digit)
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
					report_compile_error (l_error)
				else
					l_code := zero_digit.item_code (1)
					if not unicode_character_class.is_decimal_digit (l_code) then
						l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be a Unicode decimal digit. Found ", zero_digit)
						create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
						report_compile_error (l_error)
					elseif unicode_character_class.decimal_digit_value (l_code) /= 0 then
						l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be a Unicode decimal digit of value zero. Found ", zero_digit)
						create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
						report_compile_error (l_error)
					end
				end
			end
		end
		
	validate_digit is
			-- Validate `digit'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if digit /= Void and then digit.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format digit must be s single character. Found ", digit)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_pattern_separator is
			-- Validate `pattern_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if pattern_separator /= Void and then pattern_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format pattern-separator must be s single character. Found ", pattern_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_minus_sign is
			-- Validate `minus_sign'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if minus_sign /= Void and then minus_sign.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format minus-sign must be s single character. Found ", minus_sign)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	created_decimal_format (a_fingerprint: INTEGER): XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Decimal format named bu `a_fingerprint'.
		require
			no_error_yet: not any_compile_errors
		do
			create Result.make (a_fingerprint, containing_stylesheet.import_precedence)
			if decimal_separator /= Void then
				Result.set_decimal_separator (decimal_separator)
			end
			if grouping_separator /= Void then
				Result.set_grouping_separator (grouping_separator)
			end
			if pattern_separator /= Void then
				Result.set_pattern_separator (pattern_separator)
			end
			if percent /= Void then
				Result.set_percent (percent)
			end						
			if per_mille /= Void then
				Result.set_per_mille (per_mille)
			end						
			if minus_sign /= Void then
				Result.set_minus_sign (minus_sign)
			end						
			if zero_digit /= Void then
				Result.set_zero_digit (zero_digit)
			end						
			if digit /= Void then
				Result.set_digit_sign (digit)
			end
			if infinity /= Void then
				Result.set_infinity (infinity)
			end						
			if nan /= Void then
				Result.set_nan (nan)
			end						
		ensure
			created_decimal_format_not_void: Result /= Void
		end

end
