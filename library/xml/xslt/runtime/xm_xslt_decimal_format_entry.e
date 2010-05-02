note

	description:

		"Objects that are the compiled represntation of an xsl:decimal-format"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT_ENTRY

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_fingerprint, a_precedence: INTEGER)
			-- Establish default settings.
		require
			nearly_positive_fingerprint : a_fingerprint > -2
		do
			fingerprint := a_fingerprint
			precedence := a_precedence
			set_defaults
		ensure
			fingerprint_set: fingerprint = a_fingerprint
			precedence_set: precedence = a_precedence
		end

feature -- Access

	fingerprint: INTEGER
			-- Fingerprint of name

	precedence: INTEGER
			-- Import precedence of containing stylesheet module

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

	digit_sign: STRING
			-- Digit sign

	pattern_separator: STRING
			-- Pattern separator sign

feature -- Status report

	is_different_from (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN
			-- Does `a_format' differ from `Current' by any value?
		require
			format_not_void: a_format /= Void
		do
			Result := fingerprint /= a_format.fingerprint
				or else not STRING_.same_string (decimal_separator, a_format.decimal_separator)
				or else not STRING_.same_string (grouping_separator, a_format.grouping_separator)
				or else not STRING_.same_string (pattern_separator, a_format.pattern_separator)
				or else not STRING_.same_string (infinity, a_format.infinity)
				or else not STRING_.same_string (minus_sign, a_format.minus_sign)
				or else not STRING_.same_string (nan, a_format.nan)
				or else not STRING_.same_string (percent, a_format.percent)
				or else not STRING_.same_string (per_mille, a_format.per_mille)
				or else not STRING_.same_string (zero_digit, a_format.zero_digit)
				or else not STRING_.same_string (digit_sign, a_format.digit_sign)
		end

	are_all_distinct: BOOLEAN
			-- Are all important picture characters distinct?
		local
			a_set: DS_HASH_SET [INTEGER]
			a_character_code: INTEGER
		do
			create a_set.make (7)
			a_character_code := decimal_separator.item_code (1)
			a_set.put (a_character_code)
			a_character_code := grouping_separator.item_code (1)
			if a_set.has (a_character_code) then
				Result := False
			else
				a_set.put (a_character_code)
				a_character_code := pattern_separator.item_code (1)
				if a_set.has (a_character_code) then
					Result := False
				else
					a_set.put (a_character_code)
					a_character_code := percent.item_code (1)
					if a_set.has (a_character_code) then
						Result := False
					else
						a_set.put (a_character_code)
						a_character_code := per_mille.item_code (1)
						if a_set.has (a_character_code) then
							Result := False
						else
							a_set.put (a_character_code)
							a_character_code := zero_digit.item_code (1)
							if a_set.has (a_character_code) then
								Result := False
							else
								a_set.put (a_character_code)
								a_character_code := digit_sign.item_code (1)
							end
							if a_set.has (a_character_code) then
								Result := False
							else
								Result := True
							end
						end
					end
				end
			end
		end

feature -- Element change

	set_decimal_separator (a_decimal_separator: STRING)
			-- Set `decimal_separator'.
		require
			decimal_separator_is_one_character: a_decimal_separator /= Void and then a_decimal_separator.count = 1
		do
			decimal_separator := a_decimal_separator
		ensure
			decimal_separator_set: decimal_separator = a_decimal_separator
		end

	set_grouping_separator (a_grouping_separator: STRING)
			-- Set `grouping_separator'.
		require
			grouping_separator_is_one_character: a_grouping_separator /= Void and then a_grouping_separator.count = 1
		do
			grouping_separator := a_grouping_separator
		ensure
			grouping_separator_set: grouping_separator = a_grouping_separator
		end

	set_pattern_separator (a_pattern_separator: STRING)
			-- Set `pattern_separator'.
		require
			pattern_separator_is_one_character: a_pattern_separator /= Void and then a_pattern_separator.count = 1
		do
			pattern_separator := a_pattern_separator
		ensure
			pattern_separator_set: pattern_separator = a_pattern_separator
		end

	set_minus_sign (a_minus_sign: STRING)
			-- Set `minus_sign'.
		require
			minus_sign_is_one_character: a_minus_sign /= Void and then a_minus_sign.count = 1
		do
			minus_sign := a_minus_sign
		ensure
			minus_sign_set: minus_sign = a_minus_sign
		end

	set_percent (a_percent: STRING)
			-- Set `percent'.
		require
			percent_is_one_character: a_percent /= Void and then a_percent.count = 1
		do
			percent := a_percent
		ensure
			percent_set: percent = a_percent
		end

	set_per_mille (a_per_mille: STRING)
			-- Set `per_mille'.
		require
			per_mille_is_one_character: a_per_mille /= Void and then a_per_mille.count = 1
		do
			per_mille := a_per_mille
		ensure
			per_mille_set: per_mille = a_per_mille
		end

	set_zero_digit (a_zero_digit: STRING)
			-- Set `zero_digit'.
		require
			zero_digit_is_one_character: a_zero_digit /= Void and then a_zero_digit.count = 1
		do
			zero_digit := a_zero_digit
		ensure
			zero_digit_set: zero_digit = a_zero_digit
		end


	set_digit_sign (a_digit: STRING)
			-- Set `digit_sign'.
		require
			digit_sign_is_one_character: a_digit /= Void and then a_digit.count = 1
		do
			digit_sign := a_digit
		ensure
			digit_sign_set: digit_sign = a_digit
		end

	set_infinity (an_infinity: STRING)
			-- Set `infinity'.
		require
			infinity_not_void: an_infinity /= Void
		do
			infinity := an_infinity
		ensure
			infinity_set: infinity = an_infinity
		end

	set_nan (an_nan: STRING)
			-- Set `nan'.
		require
			nan_not_void: an_nan /= Void
		do
			nan := an_nan
		ensure
			nan_set: nan = an_nan
		end

	set_defaults
			-- Set all attributes to their defaults.
		do
			decimal_separator := "."
			grouping_separator := ","
			pattern_separator := ";"
			minus_sign := "-"
			percent := "%%"
			per_mille := new_unicode_string_filled_code (8240, 1)
			zero_digit := "0"
			digit_sign := "#"
			infinity := "Infinity"
			nan := "NaN"
		end

invariant

	nearly_positive_fingerprint : fingerprint > -2
	decimal_separator: decimal_separator /= Void and then decimal_separator.count = 1
	grouping_separator: grouping_separator /= Void and then grouping_separator.count = 1
	pattern_separator: pattern_separator /= Void and then pattern_separator.count = 1
	percent: percent /= Void and then percent.count = 1
	per_mille: per_mille /= Void and then per_mille.count = 1
	zero_digit: zero_digit /= Void and then zero_digit.count = 1
	digit_sign: digit_sign /= Void and then digit_sign.count = 1
	minus_sign: minus_sign /= Void and then minus_sign.count = 1
	infinity: infinity /= Void
	nan: nan /= Void

end
