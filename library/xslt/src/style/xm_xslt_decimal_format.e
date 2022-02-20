note

	description:

		"xsl:decimal-format element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
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

	name: detachable STRING
			-- Name

	decimal_separator: detachable STRING
			-- Decimal separator sign

	grouping_separator: detachable STRING
			-- Grouping separator sign

	infinity: detachable STRING
			-- Infinity symbol

	minus_sign: detachable STRING
			-- Minus symbol

	nan: detachable STRING
			-- NaN symbol

	percent: detachable STRING
			-- Percent symbol

	per_mille: detachable STRING
			-- Per-mill symbol

	zero_digit: detachable STRING
			-- Zero digit symbol

	digit: detachable STRING
			-- Digit sign

	pattern_separator: detachable STRING
			-- Pattern separator sign

feature -- Status report

	is_decimal_format: BOOLEAN
			-- Is `Current' an xsl:decimal_format?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		do
			-- this has already been done in `preprepare_attributes'
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			check_empty
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction, or to Eiffel code.
		do
			last_generated_expression := Void
		end

	register
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
				if not attached name as l_name then
					l_fingerprint := -1
				elseif is_qname (l_name) then
					generate_name_code (l_name)
					if last_generated_name_code = -1 then
						check postcondition_of_generate_name_code: attached name_code_error_value as l_name_code_error_value then
							create l_error.make_from_string (STRING_.concat("Invalid QName for xsl:decimal-format: ", l_name_code_error_value.description), Xpath_errors_uri, "XTSE0020", Static_error)
						end
						report_compile_error (l_error)
					else
						l_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					end
				else
					create l_error.make_from_string (STRING_.concat (l_name, " is not a valid QName"), Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (l_error)
				end
				if not any_compile_errors then
					l_decimal_format := created_decimal_format (l_fingerprint)
					if not l_decimal_format.are_all_distinct then
						create l_error.make_from_string ("Not all picture characters are distinct.", Xpath_errors_uri, "XTSE1300", Static_error)
						report_compile_error (l_error)
					else
						check attached principal_stylesheet as l_principal_stylesheet then
							l_format_manager := l_principal_stylesheet.decimal_format_manager
						end
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
										check attached name as l_name then
											l_message := STRING_.concat ("Cannot define xsl:decimal-format named ", l_name)
										end
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

	as_decimal_format: XM_XSLT_DECIMAL_FORMAT
			-- `Current' seen as an xsl:decimal_format
		do
			Result := Current
		end

feature {NONE} -- Implementation

	preprepare_attributes
			-- Prepare attributes early.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name: STRING
		do
			check attached attribute_collection as l_attribute_collection then
				from
					l_cursor := l_attribute_collection.name_code_cursor
					l_cursor.start
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
				variant
					l_attribute_collection.number_of_attributes + 1 - l_cursor.index
				end
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

	validate_decimal_separator
			-- Validate `decimal_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached decimal_separator as l_decimal_separator and then l_decimal_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format decimal-separator must be s single character. Found ", l_decimal_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_grouping_separator
			-- Validate `grouping_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached grouping_separator as l_grouping_separator and then l_grouping_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format grouping-separator must be s single character. Found ", l_grouping_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_percent
			-- Validate `percent'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached percent as l_percent and then l_percent.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format percent must be s single character. Found ", l_percent)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_per_mille
			-- Validate `per_mille'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached per_mille as l_per_mille and then l_per_mille.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format per-mille must be s single character. Found ", l_per_mille)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_zero_digit
			-- Validate `zero_digit'.
		require
			no_error_yet: not any_compile_errors
		local
			l_code: INTEGER
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached zero_digit as l_zero_digit then
				if l_zero_digit.count /= 1 then
					l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be s single character. Found ", l_zero_digit)
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
					report_compile_error (l_error)
				else
					l_code := l_zero_digit.code (1).to_integer_32
					if not unicode_character_class.is_decimal_digit (l_code) then
						l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be a Unicode decimal digit. Found ", l_zero_digit)
						create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
						report_compile_error (l_error)
					elseif unicode_character_class.decimal_digit_value (l_code) /= 0 then
						l_message := STRING_.appended_string ("xsl:decimal-format zero-digit must be a Unicode decimal digit of value zero. Found ", l_zero_digit)
						create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1295", Static_error)
						report_compile_error (l_error)
					end
				end
			end
		end

	validate_digit
			-- Validate `digit'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached digit as l_digit and then l_digit.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format digit must be s single character. Found ", l_digit)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_pattern_separator
			-- Validate `pattern_separator'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached pattern_separator as l_pattern_separator and then l_pattern_separator.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format pattern-separator must be s single character. Found ", l_pattern_separator)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	validate_minus_sign
			-- Validate `minus_sign'.
		require
			no_error_yet: not any_compile_errors
		local
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached minus_sign as l_minus_sign and then l_minus_sign.count /= 1 then
				l_message := STRING_.appended_string ("xsl:decimal-format minus-sign must be s single character. Found ", l_minus_sign)
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (l_error)
			end
		end

	created_decimal_format (a_fingerprint: INTEGER): XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Decimal format named bu `a_fingerprint'.
		require
			no_error_yet: not any_compile_errors
		do
			check attached containing_stylesheet as l_containing_stylesheet then
				create Result.make (a_fingerprint, l_containing_stylesheet.import_precedence)
			end
			if attached decimal_separator as l_decimal_separator then
				Result.set_decimal_separator (l_decimal_separator)
			end
			if attached grouping_separator as l_grouping_separator then
				Result.set_grouping_separator (l_grouping_separator)
			end
			if attached pattern_separator as l_pattern_separator then
				Result.set_pattern_separator (l_pattern_separator)
			end
			if attached percent as l_percent then
				Result.set_percent (l_percent)
			end
			if attached per_mille as l_per_mille then
				Result.set_per_mille (l_per_mille)
			end
			if attached minus_sign as l_minus_sign then
				Result.set_minus_sign (l_minus_sign)
			end
			if attached zero_digit as l_zero_digit then
				Result.set_zero_digit (l_zero_digit)
			end
			if attached digit as l_digit then
				Result.set_digit_sign (l_digit)
			end
			if attached infinity as l_infinity then
				Result.set_infinity (l_infinity)
			end
			if attached nan as l_nan then
				Result.set_nan (l_nan)
			end
		ensure
			created_decimal_format_not_void: Result /= Void
		end

end
