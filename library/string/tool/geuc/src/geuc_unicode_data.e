note

	description:

		"Unicode data for one code point"

	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEUC_UNICODE_DATA

inherit

	GEUC_CONSTANTS

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_code: INTEGER; a_name: STRING; some_fields: DS_LIST [STRING])
			-- Create a new unicode data for `a_code'.
		require
			code_large_enough: a_code >= 0
			code_small_enough: a_code <= maximum_unicode_character_code
			name_not_void: a_name /= Void
			fields_not_void: some_fields /= Void
			fifteen_fields: some_fields.count = Field_count
		local
			a_decimal: INTEGER
			a_hex_code: STRING
			l_decomposition_mapping: like decomposition_mapping
		do
			code := a_code
			name := a_name
			general_category := category (some_fields.item (3))
			is_valid := general_category /= Unassigned_other_category
			if general_category = Decimal_digit_number_category then
				if not some_fields.item (7).is_integer then
					is_valid := False
				else
					internal_decimal_digit_value := Bad_decimal_value
					a_decimal := some_fields.item (7).to_integer
					if a_decimal >= 0 and then a_decimal < 10 then
						internal_decimal_digit_value := INTEGER_.to_integer_8 (a_decimal)
						is_valid := True
					else
						is_valid := False
					end
				end
			end
			if some_fields.item (13).is_empty then
				upper_code := -1
			else
				a_hex_code := some_fields.item (13)
				if STRING_.is_hexadecimal (a_hex_code) then
					upper_code := STRING_.hexadecimal_to_integer (a_hex_code)
					if upper_code < 0 or upper_code > maximum_unicode_character_code then
						is_valid := False
					end
				else
					is_valid := False
				end
			end
			if some_fields.item (15).is_empty then
				title_code := -1
			else
				a_hex_code := some_fields.item (15)
				if STRING_.is_hexadecimal (a_hex_code) then
					title_code := STRING_.hexadecimal_to_integer (a_hex_code)
					if title_code < 0 or title_code > maximum_unicode_character_code then
						is_valid := False
					end
				else
					is_valid := False
				end
			end
			if some_fields.item (14).is_empty then
				lower_code := -1
			else
				a_hex_code := some_fields.item (14)
				if STRING_.is_hexadecimal (a_hex_code) then
					lower_code := STRING_.hexadecimal_to_integer (a_hex_code)
					if lower_code < 0 or lower_code > maximum_unicode_character_code then
						is_valid := False
					end
				else
					is_valid := False
				end
			end
			if some_fields.item (4).is_empty then
				is_valid := False
			elseif not some_fields.item (4).is_integer then
				is_valid := False
			else
				canonical_combining_class := some_fields.item (4).to_integer
				is_valid := canonical_combining_class >= 0 and canonical_combining_class <= Highest_combining_class
			end
			if some_fields.item (6).is_empty then
				is_valid := True
				decomposition_type := Canonical_decomposition_mapping
				decomposition_mapping := Void
			elseif is_valid_decomposition_type (some_fields.item (6)) then
				decomposition_type := encoded_decomposition_type (some_fields.item (6))
				l_decomposition_mapping := mapped_decomposition (some_fields.item (6))
				decomposition_mapping := l_decomposition_mapping
				is_valid := not l_decomposition_mapping.is_empty
			else
				is_valid := False
			end

			-- TODO: extract any other fields of interest

		ensure
			code_set: code = a_code
			name_set: name = a_name
		end

feature -- Access

	Highest_combining_class: INTEGER = 240
			-- Highest combining class in current version of Unicode

	code: INTEGER
			-- Code point number

	name: STRING
			-- Name of character

	general_category: INTEGER
			-- Coded general category

	upper_code: INTEGER
			-- Code point of upper cased equivalent character, or -1

	lower_code: INTEGER
			-- Code point of lower cased equivalent character, or -1

	title_code: INTEGER
			-- Code point of title cased equivalent character, or -1

	canonical_combining_class: INTEGER -- TODO NATURAL_8 when all support it
			-- Canonical combining class

	decomposition_type: INTEGER
			-- Decomposition type

	decomposition_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Decomposition mapping;

	lower_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Full mapping to lower case
		do
			Result := optional_lower_mapping
			if Result = Void then
				if lower_code /= -1 then
					create Result.make (1)
					Result.put (lower_code, 1)
				end
			end
		end

	title_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Full mapping to title case
		do
			Result := optional_title_mapping
			if Result = Void then
				if title_code /= -1 then
					create Result.make (1)
					Result.put (title_code, 1)
				end
			end
		end

	upper_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Full mapping to upper case
		do
			Result := optional_upper_mapping
			if Result = Void then
				if upper_code /= -1 then
					create Result.make (1)
					Result.put (upper_code, 1)
				end
			end
		end

	decimal_digit_value: INTEGER_8
			-- Value of `Current' as a decimal digit
		require
			decimal_digit: general_category = Decimal_digit_number_category
		do
			Result := internal_decimal_digit_value
		ensure
			value_in_range: Result >= 0 and Result < 10
		end

	category (a_category: STRING): INTEGER
			-- Coded version of `a_category', or `Unassigned_other_category' if unrecognized
		require
			category_not_void: a_category /= Void
		do
			if a_category.is_equal ("Lu") then
				Result := Uppercase_letter_category
			elseif a_category.is_equal ("Ll") then
				Result := Lowercase_letter_category
			elseif a_category.is_equal ("Lt") then
				Result := Titlecase_letter_category
			elseif a_category.is_equal ("Lm") then
				Result := Modifier_letter_category
			elseif a_category.is_equal ("Lo") then
				Result := Other_letter_category
			elseif a_category.is_equal ("Mn") then
				Result := Non_spacing_mark_category
			elseif a_category.is_equal ("Mc") then
				Result := Spacing_combining_mark_category
			elseif a_category.is_equal ("Me") then
				Result := Enclosing_mark_category
			elseif a_category.is_equal ("Nd") then
				Result := Decimal_digit_number_category
			elseif a_category.is_equal ("Nl") then
				Result := Letter_number_category
			elseif a_category.is_equal ("No") then
				Result := Other_number_category
			elseif a_category.is_equal ("Pc") then
				Result := Connector_punctuation_category
			elseif a_category.is_equal ("Pd") then
				Result := Dash_punctuation_category
			elseif a_category.is_equal ("Ps") then
				Result := Open_punctuation_category
			elseif a_category.is_equal ("Pe") then
				Result := Close_punctuation_category
			elseif a_category.is_equal ("Pi") then
				Result := Initial_quote_punctuation_category
			elseif a_category.is_equal ("Pf") then
				Result := Final_quote_punctuation_category
			elseif a_category.is_equal ("Po") then
				Result := Other_punctuation_category
			elseif a_category.is_equal ("Sm") then
				Result := Math_symbol_category
			elseif a_category.is_equal ("Sc") then
				Result := Currency_symbol_category
			elseif a_category.is_equal ("Sk") then
				Result := Modifier_symbol_category
			elseif a_category.is_equal ("So") then
				Result := Other_symbol_category
			elseif a_category.is_equal ("Zs") then
				Result := Space_separator_category
			elseif a_category.is_equal ("Zl") then
				Result := Line_separator_category
			elseif a_category.is_equal ("Zp") then
				Result := Paragraph_separator_category
			elseif a_category.is_equal ("Cc") then
				Result := Control_other_category
			elseif a_category.is_equal ("Cf") then
				Result := Format_other_category
			elseif a_category.is_equal ("Cs") then
				Result := Surrogate_other_category
			elseif a_category.is_equal ("Co") then
				Result := Private_other_category
			else
				Result := Unassigned_other_category
			end
		end

	encoded_decomposition_type (a_string: STRING): INTEGER
			-- Decomposition type
		require
			string_not_void: a_string /= Void
			string_not_empty: not a_string.is_empty
			valid_decomposition: is_valid_decomposition_type (a_string)
		local
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_type: STRING
		do
			create a_splitter.make
			some_fields := a_splitter.split (a_string)
			a_type := some_fields.item (1)
			if STRING_.is_hexadecimal (a_type) then
				Result := Canonical_decomposition_mapping
			elseif STRING_.same_string ("<font>", a_type) then
				Result := Font_decomposition_mapping
			elseif STRING_.same_string ("<noBreak>", a_type) then
				Result := No_break_decomposition_mapping
			elseif STRING_.same_string ("<initial>", a_type) then
				Result := Initial_decomposition_mapping
			elseif STRING_.same_string ("<medial>", a_type) then
				Result := Medial_decomposition_mapping
			elseif STRING_.same_string ("<final>", a_type) then
				Result := Final_decomposition_mapping
			elseif STRING_.same_string ("<isolated>", a_type) then
				Result := Isolated_decomposition_mapping
			elseif STRING_.same_string ("<circle>", a_type) then
				Result := Encircled_decomposition_mapping
			elseif STRING_.same_string ("<super>", a_type) then
				Result := Superscript_decomposition_mapping
			elseif STRING_.same_string ("<sub>", a_type) then
				Result := Subscript_decomposition_mapping
			elseif STRING_.same_string ("<vertical>", a_type) then
				Result := Vertical_decomposition_mapping
			elseif STRING_.same_string ("<wide>", a_type) then
				Result := Wide_decomposition_mapping
			elseif STRING_.same_string ("<narrow>", a_type) then
				Result := Narrow_decomposition_mapping
			elseif STRING_.same_string ("<small>", a_type) then
				Result := Small_decomposition_mapping
			elseif STRING_.same_string ("<square>", a_type) then
				Result := Square_decomposition_mapping
			elseif STRING_.same_string ("<fraction>", a_type) then
				Result := Fraction_decomposition_mapping
			else
				check
					unspecified_compatibility_mapping: STRING_.same_string ("<compat>", a_type)
					-- from pre-condition
				end
				Result := Compatibility_decomposition_mapping
			end
		end

	mapped_decomposition (a_string: STRING): DS_ARRAYED_LIST [INTEGER]
			-- Decomposition mapping
		require
			string_not_void: a_string /= Void
			string_not_empty: not a_string.is_empty
			valid_decomposition: is_valid_decomposition_type (a_string)
		local
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_type: STRING
			i, j: INTEGER
		do
			create a_splitter.make
			some_fields := a_splitter.split (a_string)
			a_type := some_fields.item (1)
			j := some_fields.count
			if STRING_.is_hexadecimal (a_type) then
				i := 1
				create Result.make (j)
			else
				i := 2
				create Result.make (j - 1)
			end
			from until i > j loop
				a_type := some_fields.item (i)
				if STRING_.is_hexadecimal (a_type) then
					Result.put_last (STRING_.hexadecimal_to_integer (a_type))
					i := i + 1
				else
					Result.wipe_out; i := j + 1
				end
			end
		ensure
			mapped_decomposition_not_void: Result /= Void
		end

feature -- Status report

	is_valid: BOOLEAN
			-- Does `Current' represent a validly parsed line "UnicodeData.txt"?

	internal_decimal_digit_value: INTEGER_8
			-- Decimal digit value

	is_valid_decomposition_type (a_string: STRING): BOOLEAN
			-- Does `a_string' start with a valid decomposition type?
		require
			string_not_void: a_string /= Void
			string_not_empty: not a_string.is_empty
		local
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_type: STRING
		do
			create a_splitter.make
			some_fields := a_splitter.split (a_string)
			a_type := some_fields.item (1)
			if STRING_.is_hexadecimal (a_type) then
				Result := True -- Canonical decomposition
			else
				Result := STRING_.same_string ("<font>", a_type) or
					STRING_.same_string ("<noBreak>", a_type) or
					STRING_.same_string ("<initial>", a_type) or
					STRING_.same_string ("<medial>", a_type) or
					STRING_.same_string ("<final>", a_type) or
					STRING_.same_string ("<isolated>", a_type) or
					STRING_.same_string ("<circle>", a_type) or
					STRING_.same_string ("<super>", a_type) or
					STRING_.same_string ("<sub>", a_type) or
					STRING_.same_string ("<vertical>", a_type) or
					STRING_.same_string ("<wide>", a_type) or
					STRING_.same_string ("<narrow>", a_type) or
					STRING_.same_string ("<small>", a_type) or
					STRING_.same_string ("<square>", a_type) or
					STRING_.same_string ("<fraction>", a_type) or
					STRING_.same_string ("<compat>", a_type)
			end
		end

feature -- Setting

	set_special_case_mappings (a_lower, a_title, a_upper: STRING)
			-- Set `lower_mapping', `title_mapping' and `upper_mapping' from `a_lower', `a_title' and `a_upper' respectively.
		require
			a_lower_not_void: a_lower /= Void
			a_title_not_void: a_title /= Void
			a_upper_not_void: a_upper /= Void
		local
			l_result: DS_CELL [detachable DS_ARRAYED_LIST [INTEGER]]
		do
			create l_result.make (Void)
			create_special_casing_codes (l_result, a_lower)
			optional_lower_mapping := l_result.item
			create l_result.make (Void)
			create_special_casing_codes (l_result, a_title)
			optional_title_mapping := l_result.item
			create l_result.make (Void)
			create_special_casing_codes (l_result, a_upper)
			optional_upper_mapping := l_result.item
		ensure
			optional_lower_mapping_not_void: optional_lower_mapping /= Void
			optional_title_mapping_not_void: optional_title_mapping /= Void
			optional_upper_mapping_not_void: optional_upper_mapping /= Void
		end

feature {NONE} -- Implementation

	optional_lower_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Optional special mapping to lower case

	optional_title_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Optional special mapping to title case

	optional_upper_mapping: detachable DS_ARRAYED_LIST [INTEGER]
			-- Optional special mapping to upper case

	create_special_casing_codes (a_result: DS_CELL [detachable DS_ARRAYED_LIST [INTEGER]]; a_string: STRING)
			-- Create sequence of code-points decoded from `a_string' and place in `a_result'.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			a_string_not_void: a_string /= Void
			a_string_not_empty: not a_string.is_empty
		local
			l_splitter: ST_SPLITTER
			l_fields: DS_LIST [STRING]
			l_result: DS_ARRAYED_LIST [INTEGER]
		do
			create l_splitter.make
			l_fields := l_splitter.split (a_string)
			if l_fields.is_empty then
				is_valid := False
			else
				create l_result.make (l_fields.count)
				l_fields.do_all (agent append_code_point (l_result, ?))
				a_result.put (l_result)
			end
		ensure
			special_casing_codes_created: a_result.item /= Void
		end

	append_code_point (a_result: DS_ARRAYED_LIST [INTEGER]; a_field: STRING)
			-- Decode and append `a_field' onto `a_result'.
			-- Set `is_valid' to `False' if decoding fails.
		require
			a_result_not_void: a_result /= Void
			a_field_not_void: a_field /= Void
		do
			if STRING_.is_hexadecimal (a_field) then
				a_result.force_last (STRING_.hexadecimal_to_integer (a_field))
			else
				is_valid := False
			end
		ensure
			one_more_or_invalid: (a_result.count = old a_result.count + 1) or not is_valid
		end

invariant

	code_large_enough: code >= 0
	code_small_enough: code <= maximum_unicode_character_code
	name_not_void: name /= Void

end
