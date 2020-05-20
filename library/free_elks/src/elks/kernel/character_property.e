note
	description: "[
		Helper functions to provide property of a Unicode character of type CHARACTER_32.
		This includes finding out if a character is lower, upper, title case, or if it is a digit,
		a punctuation, a control or a space character.
	]"
	generator: "Unicode Helper Generator 1.3"
	unicode_version: "13.0.0"
	date: "$Date$"
	revision: "$Revision$"

class CHARACTER_PROPERTY

create
	make

feature {NONE} -- Initialization

	make
		do
		end

feature -- Status report

	is_alpha (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' an alphabetic character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				if ('a' <= a_char and a_char <= 'z') or ('A' <= a_char and a_char <= 'Z') then
					Result := True
				end
			else
				Result := (property (a_char) & (is_lower_flag | is_upper_flag | is_title_flag)) /= 0
			end
		ensure
			definition: Result = (is_lower (a_char) or is_upper (a_char))
		end

	is_lower (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a lower character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				if 'a' <= a_char and a_char <= 'z' then
					Result := True
				end
			else
				Result := (property (a_char) & is_lower_flag) /= 0
			end
		end

	is_upper (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' an upper character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				if 'A' <= a_char and a_char <= 'Z' then
					Result := True
				end
			else
				Result := (property (a_char) & is_upper_flag) /= 0
			end
		end

	is_title (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a title character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				if 'A' <= a_char and a_char <= 'Z' then
					Result := True
				end
			else
				Result := (property (a_char) & is_title_flag) /= 0
			end
		end

	is_digit (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a digit character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				if '0' <= a_char and a_char <= '9' then
					Result := True
				end
			else
				Result := (property (a_char) & is_digit_flag) /= 0
			end
		end

	is_punctuation (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a punctuation character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				Result := a_char.to_character_8.is_punctuation
			else
				Result := (property (a_char) & is_punctuation_flag) /= 0
			end
		end

	is_control (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a control character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				Result := a_char.to_character_8.is_control
			else
				Result := (property (a_char) & is_control_flag) /= 0
			end
		end

	is_hexa_digit (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' an hexadecimal character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				Result := a_char.to_character_8.is_hexa_digit
			else
				Result := (property (a_char) & is_hexa_digit_flag) /= 0
			end
		end

	is_space (a_char: CHARACTER_32): BOOLEAN
			-- Is `a_char' a space character?
		do
			if a_char.natural_32_code <= max_ascii_value then
					-- Fast implementation for ASCII character.
				Result := a_char.to_character_8.is_space
			else
				Result := (property (a_char) & is_space_flag) /= 0
			end
		end

feature -- Constants

	max_ascii_value: NATURAL_32 = 0x7F
	max_latin1_value: NATURAL_32 = 0xFF
	max_unicode_value: NATURAL_32 = 0x10FFFF
			-- Various maximal value for character range.

feature -- Conversion

	to_lower (a_char: CHARACTER_32): CHARACTER_32
			-- Convert `a_char' to lower case.
		local
			l_code: NATURAL_32
		do
				-- Most of the time the character remains unchanged.
			Result := a_char
				-- Fast implementation for ASCII character.			
			l_code := a_char.natural_32_code
			if l_code <= max_ascii_value then
				if 'A' <= a_char and a_char <= 'Z' then
					check
						valid_assumption: ('a').natural_32_code = ('A').natural_32_code + 32
					end
					Result := a_char + 32
				end
			else
				if (192 <= l_code) and (l_code <= 590) then
					Result := to_lower_table_1.item ((l_code - 192).to_integer_32).to_character_32
				else
					if l_code <= 11506 then
						if l_code <= 7359 then
							if l_code <= 4301 then
								if l_code <= 1366 then
									if l_code >= 880 then
										Result := to_lower_table_2.item ((l_code - 880).to_integer_32).to_character_32
									end
								else
									if l_code >= 4256 then
										Result := to_lower_table_3.item ((l_code - 4256).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 5109 then
									if l_code >= 5024 then
										Result := to_lower_table_4.item ((l_code - 5024).to_integer_32).to_character_32
									end
								else
									if l_code >= 7312 then
										Result := to_lower_table_5.item ((l_code - 7312).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 8579 then
								if l_code <= 8188 then
									if l_code >= 7680 then
										Result := to_lower_table_6.item ((l_code - 7680).to_integer_32).to_character_32
									end
								else
									if l_code >= 8486 then
										Result := to_lower_table_7.item ((l_code - 8486).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 9423 then
									if l_code >= 9398 then
										Result := to_lower_table_8.item ((l_code - 9398).to_integer_32).to_character_32
									end
								else
									if l_code >= 11264 then
										Result := to_lower_table_9.item ((l_code - 11264).to_integer_32).to_character_32
									end
								end
							end
						end
					else
						if l_code <= 68786 then
							if l_code <= 65338 then
								if l_code <= 42997 then
									if l_code >= 42560 then
										Result := to_lower_table_10.item ((l_code - 42560).to_integer_32).to_character_32
									end
								else
									if l_code >= 65313 then
										Result := to_lower_table_11.item ((l_code - 65313).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 66771 then
									if l_code >= 66560 then
										Result := to_lower_table_12.item ((l_code - 66560).to_integer_32).to_character_32
									end
								else
									if l_code >= 68736 then
										Result := to_lower_table_13.item ((l_code - 68736).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 93791 then
								if l_code <= 71871 then
									if l_code >= 71840 then
										Result := to_lower_table_14.item ((l_code - 71840).to_integer_32).to_character_32
									end
								else
									if l_code >= 93760 then
										Result := to_lower_table_15.item ((l_code - 93760).to_integer_32).to_character_32
									end
								end
							else
								if l_code >= 125184 and l_code <= 125217 then
									Result := to_lower_table_16.item ((l_code - 125184).to_integer_32).to_character_32
								end
							end
						end
					end
				end
			end
		end

	to_upper (a_char: CHARACTER_32): CHARACTER_32
			-- Convert `a_char' to upper case.
		local
			l_code: NATURAL_32
		do
				-- Most of the time the character remains unchanged.
			Result := a_char
				-- Fast implementation for ASCII character.			
			l_code := a_char.natural_32_code
			if l_code <= max_ascii_value then
				if 'a' <= a_char and a_char <= 'z' then
					check
						valid_assumption: ('a').natural_32_code = ('A').natural_32_code + 32
					end
					Result := a_char - 32
				end
			else
				if (181 <= l_code) and (l_code <= 670) then
					Result := to_upper_table_1.item ((l_code - 181).to_integer_32).to_character_32
				else
					if l_code <= 11565 then
						if l_code <= 7304 then
							if l_code <= 4351 then
								if l_code <= 1414 then
									if l_code >= 837 then
										Result := to_upper_table_2.item ((l_code - 837).to_integer_32).to_character_32
									end
								else
									if l_code >= 4304 then
										Result := to_upper_table_3.item ((l_code - 4304).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 5117 then
									if l_code >= 5112 then
										Result := to_upper_table_4.item ((l_code - 5112).to_integer_32).to_character_32
									end
								else
									if l_code >= 7296 then
										Result := to_upper_table_5.item ((l_code - 7296).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 8580 then
								if l_code <= 8179 then
									if l_code >= 7545 then
										Result := to_upper_table_6.item ((l_code - 7545).to_integer_32).to_character_32
									end
								else
									if l_code >= 8526 then
										Result := to_upper_table_7.item ((l_code - 8526).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 9449 then
									if l_code >= 9424 then
										Result := to_upper_table_8.item ((l_code - 9424).to_integer_32).to_character_32
									end
								else
									if l_code >= 11312 then
										Result := to_upper_table_9.item ((l_code - 11312).to_integer_32).to_character_32
									end
								end
							end
						end
					else
						if l_code <= 66811 then
							if l_code <= 43967 then
								if l_code <= 42998 then
									if l_code >= 42561 then
										Result := to_upper_table_10.item ((l_code - 42561).to_integer_32).to_character_32
									end
								else
									if l_code >= 43859 then
										Result := to_upper_table_11.item ((l_code - 43859).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 65370 then
									if l_code >= 65345 then
										Result := to_upper_table_12.item ((l_code - 65345).to_integer_32).to_character_32
									end
								else
									if l_code >= 66600 then
										Result := to_upper_table_13.item ((l_code - 66600).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 71903 then
								if l_code <= 68850 then
									if l_code >= 68800 then
										Result := to_upper_table_14.item ((l_code - 68800).to_integer_32).to_character_32
									end
								else
									if l_code >= 71872 then
										Result := to_upper_table_15.item ((l_code - 71872).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 93823 then
									if l_code >= 93792 then
										Result := to_upper_table_16.item ((l_code - 93792).to_integer_32).to_character_32
									end
								else
									if l_code >= 125218 and l_code <= 125251 then
										Result := to_upper_table_17.item ((l_code - 125218).to_integer_32).to_character_32
									end
								end
							end
						end
					end
				end
			end
		end

	to_title (a_char: CHARACTER_32): CHARACTER_32
			-- Convert `a_char' to title case.
		local
			l_code: NATURAL_32
		do
				-- Most of the time the character remains unchanged.
			Result := a_char
				-- Fast implementation for ASCII character.			
			l_code := a_char.natural_32_code
			if l_code <= max_ascii_value then
				if 'a' <= a_char and a_char <= 'z' then
					check
						valid_assumption: ('a').natural_32_code = ('A').natural_32_code + 32
					end
					Result := a_char - 32
				end
			else
				if (181 <= l_code) and (l_code <= 670) then
					Result := to_title_table_1.item ((l_code - 181).to_integer_32).to_character_32
				else
					if l_code <= 42998 then
						if l_code <= 8580 then
							if l_code <= 7304 then
								if l_code <= 5117 then
									if l_code <= 1414 then
										if l_code >= 837 then
											Result := to_title_table_2.item ((l_code - 837).to_integer_32).to_character_32
										end
									else
										if l_code >= 5112 then
											Result := to_title_table_3.item ((l_code - 5112).to_integer_32).to_character_32
										end
									end
								else
									if l_code >= 7296 then
										Result := to_title_table_4.item ((l_code - 7296).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 8179 then
									if l_code >= 7545 then
										Result := to_title_table_5.item ((l_code - 7545).to_integer_32).to_character_32
									end
								else
									if l_code >= 8526 then
										Result := to_title_table_6.item ((l_code - 8526).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 11565 then
								if l_code <= 9449 then
									if l_code >= 9424 then
										Result := to_title_table_7.item ((l_code - 9424).to_integer_32).to_character_32
									end
								else
									if l_code >= 11312 then
										Result := to_title_table_8.item ((l_code - 11312).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 42651 then
									if l_code >= 42561 then
										Result := to_title_table_9.item ((l_code - 42561).to_integer_32).to_character_32
									end
								else
									if l_code >= 42787 then
										Result := to_title_table_10.item ((l_code - 42787).to_integer_32).to_character_32
									end
								end
							end
						end
					else
						if l_code <= 66811 then
							if l_code <= 65370 then
								if l_code <= 43967 then
									if l_code >= 43859 then
										Result := to_title_table_11.item ((l_code - 43859).to_integer_32).to_character_32
									end
								else
									if l_code >= 65345 then
										Result := to_title_table_12.item ((l_code - 65345).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 66639 then
									if l_code >= 66600 then
										Result := to_title_table_13.item ((l_code - 66600).to_integer_32).to_character_32
									end
								else
									if l_code >= 66776 then
										Result := to_title_table_14.item ((l_code - 66776).to_integer_32).to_character_32
									end
								end
							end
						else
							if l_code <= 71903 then
								if l_code <= 68850 then
									if l_code >= 68800 then
										Result := to_title_table_15.item ((l_code - 68800).to_integer_32).to_character_32
									end
								else
									if l_code >= 71872 then
										Result := to_title_table_16.item ((l_code - 71872).to_integer_32).to_character_32
									end
								end
							else
								if l_code <= 93823 then
									if l_code >= 93792 then
										Result := to_title_table_17.item ((l_code - 93792).to_integer_32).to_character_32
									end
								else
									if l_code >= 125218 and l_code <= 125251 then
										Result := to_title_table_18.item ((l_code - 125218).to_integer_32).to_character_32
									end
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Helper

	property (a_char: CHARACTER_32): NATURAL_8
			-- Provides the various flags describing `a_char'.
		local
			l_code: NATURAL_32
		do
			l_code := a_char.natural_32_code
			if (128 <= l_code) and (l_code <= 687) then
				Result := property_table_1.item ((l_code - 128).to_integer_32)
			else
				if l_code <= 65381 then
					if l_code <= 8580 then
						if l_code <= 3439 then
							if l_code <= 2800 then
								if l_code <= 2142 then
									if l_code <= 1805 then
										if l_code >= 880 then
											Result := property_table_2.item ((l_code - 880).to_integer_32)
										end
									else
										if l_code >= 1984 then
											Result := property_table_3.item ((l_code - 1984).to_integer_32)
										end
									end
								else
									if l_code <= 2416 then
										if l_code >= 2404 then
											Result := property_table_4.item ((l_code - 2404).to_integer_32)
										end
									else
										if l_code >= 2534 then
											Result := property_table_5.item ((l_code - 2534).to_integer_32)
										end
									end
								end
							else
								if l_code <= 3055 then
									if l_code <= 2927 then
										if l_code >= 2918 then
											Result := property_table_6.item ((l_code - 2918).to_integer_32)
										end
									else
										if l_code >= 3046 then
											Result := property_table_7.item ((l_code - 3046).to_integer_32)
										end
									end
								else
									if l_code <= 3311 then
										if l_code >= 3174 then
											Result := property_table_8.item ((l_code - 3174).to_integer_32)
										end
									else
										if l_code >= 3430 then
											Result := property_table_9.item ((l_code - 3430).to_integer_32)
										end
									end
								end
							end
						else
							if l_code <= 6169 then
								if l_code <= 5120 then
									if l_code <= 4351 then
										if l_code >= 3558 then
											Result := property_table_10.item ((l_code - 3558).to_integer_32)
										end
									else
										if l_code >= 4960 then
											Result := property_table_11.item ((l_code - 4960).to_integer_32)
										end
									end
								else
									if l_code <= 5942 then
										if l_code >= 5742 then
											Result := property_table_12.item ((l_code - 5742).to_integer_32)
										end
									else
										if l_code >= 6100 then
											Result := property_table_13.item ((l_code - 6100).to_integer_32)
										end
									end
								end
							else
								if l_code <= 6829 then
									if l_code <= 6479 then
										if l_code >= 6468 then
											Result := property_table_14.item ((l_code - 6468).to_integer_32)
										end
									else
										if l_code >= 6608 then
											Result := property_table_15.item ((l_code - 6608).to_integer_32)
										end
									end
								else
									if l_code >= 6992 then
										Result := property_table_16.item ((l_code - 6992).to_integer_32)
									end
								end
							end
						end
					else
						if l_code <= 42239 then
							if l_code <= 11632 then
								if l_code <= 10223 then
									if l_code <= 9002 then
										if l_code >= 8968 then
											Result := property_table_17.item ((l_code - 8968).to_integer_32)
										end
									else
										if l_code >= 10088 then
											Result := property_table_18.item ((l_code - 10088).to_integer_32)
										end
									end
								else
									if l_code <= 10749 then
										if l_code >= 10627 then
											Result := property_table_19.item ((l_code - 10627).to_integer_32)
										end
									else
										if l_code >= 11264 then
											Result := property_table_20.item ((l_code - 11264).to_integer_32)
										end
									end
								end
							else
								if l_code <= 12539 then
									if l_code <= 11858 then
										if l_code >= 11776 then
											Result := property_table_21.item ((l_code - 11776).to_integer_32)
										end
									else
										if l_code >= 12288 then
											Result := property_table_22.item ((l_code - 12288).to_integer_32)
										end
									end
								else
									if l_code >= 42238 then
										Result := property_table_23.item ((l_code - 42238).to_integer_32)
									end
								end
							end
						else
							if l_code <= 64279 then
								if l_code <= 43615 then
									if l_code <= 43002 then
										if l_code >= 42509 then
											Result := property_table_24.item ((l_code - 42509).to_integer_32)
										end
									else
										if l_code >= 43124 then
											Result := property_table_25.item ((l_code - 43124).to_integer_32)
										end
									end
								else
									if l_code <= 44025 then
										if l_code >= 43742 then
											Result := property_table_26.item ((l_code - 43742).to_integer_32)
										end
									else
										if l_code >= 64256 then
											Result := property_table_27.item ((l_code - 64256).to_integer_32)
										end
									end
								end
							else
								if l_code <= 65131 then
									if l_code <= 64831 then
										if l_code >= 64830 then
											Result := property_table_28.item ((l_code - 64830).to_integer_32)
										end
									else
										if l_code >= 65040 then
											Result := property_table_29.item ((l_code - 65040).to_integer_32)
										end
									end
								else
									if l_code >= 65281 then
										Result := property_table_30.item ((l_code - 65281).to_integer_32)
									end
								end
							end
						end
					end
				else
					if l_code <= 73129 then
						if l_code <= 69465 then
							if l_code <= 67903 then
								if l_code <= 66927 then
									if l_code <= 65794 then
										if l_code >= 65792 then
											Result := property_table_31.item ((l_code - 65792).to_integer_32)
										end
									else
										if l_code >= 66463 then
											Result := property_table_32.item ((l_code - 66463).to_integer_32)
										end
									end
								else
									if l_code <= 67671 then
										if l_code >= 67671 then
											Result := property_table_33.item ((l_code - 67671).to_integer_32)
										end
									else
										if l_code >= 67871 then
											Result := property_table_34.item ((l_code - 67871).to_integer_32)
										end
									end
								end
							else
								if l_code <= 68921 then
									if l_code <= 68508 then
										if l_code >= 68176 then
											Result := property_table_35.item ((l_code - 68176).to_integer_32)
										end
									else
										if l_code >= 68736 then
											Result := property_table_36.item ((l_code - 68736).to_integer_32)
										end
									end
								else
									if l_code <= 69293 then
										if l_code >= 69293 then
											Result := property_table_37.item ((l_code - 69293).to_integer_32)
										end
									else
										if l_code >= 69461 then
											Result := property_table_38.item ((l_code - 69461).to_integer_32)
										end
									end
								end
							end
						else
							if l_code <= 72025 then
								if l_code <= 70873 then
									if l_code <= 70393 then
										if l_code >= 69703 then
											Result := property_table_39.item ((l_code - 69703).to_integer_32)
										end
									else
										if l_code >= 70731 then
											Result := property_table_40.item ((l_code - 70731).to_integer_32)
										end
									end
								else
									if l_code <= 71486 then
										if l_code >= 71105 then
											Result := property_table_41.item ((l_code - 71105).to_integer_32)
										end
									else
										if l_code >= 71739 then
											Result := property_table_42.item ((l_code - 71739).to_integer_32)
										end
									end
								end
							else
								if l_code <= 72817 then
									if l_code <= 72354 then
										if l_code >= 72162 then
											Result := property_table_43.item ((l_code - 72162).to_integer_32)
										end
									else
										if l_code >= 72769 then
											Result := property_table_44.item ((l_code - 72769).to_integer_32)
										end
									end
								else
									if l_code >= 73040 then
										Result := property_table_45.item ((l_code - 73040).to_integer_32)
									end
								end
							end
						end
					else
						if l_code <= 94178 then
							if l_code <= 92783 then
								if l_code <= 73727 then
									if l_code <= 73464 then
										if l_code >= 73463 then
											Result := property_table_46.item ((l_code - 73463).to_integer_32)
										end
									else
										if l_code >= 73727 then
											Result := property_table_47.item ((l_code - 73727).to_integer_32)
										end
									end
								else
									if l_code <= 74868 then
										if l_code >= 74864 then
											Result := property_table_48.item ((l_code - 74864).to_integer_32)
										end
									else
										if l_code >= 92768 then
											Result := property_table_49.item ((l_code - 92768).to_integer_32)
										end
									end
								end
							else
								if l_code <= 93850 then
									if l_code <= 93017 then
										if l_code >= 92917 then
											Result := property_table_50.item ((l_code - 92917).to_integer_32)
										end
									else
										if l_code >= 93760 then
											Result := property_table_51.item ((l_code - 93760).to_integer_32)
										end
									end
								else
									if l_code >= 94178 then
										Result := property_table_52.item ((l_code - 94178).to_integer_32)
									end
								end
							end
						else
							if l_code <= 123209 then
								if l_code <= 120831 then
									if l_code <= 113823 then
										if l_code >= 113823 then
											Result := property_table_53.item ((l_code - 113823).to_integer_32)
										end
									else
										if l_code >= 119808 then
											Result := property_table_54.item ((l_code - 119808).to_integer_32)
										end
									end
								else
									if l_code <= 121483 then
										if l_code >= 121479 then
											Result := property_table_55.item ((l_code - 121479).to_integer_32)
										end
									else
										if l_code >= 123200 then
											Result := property_table_56.item ((l_code - 123200).to_integer_32)
										end
									end
								end
							else
								if l_code <= 125279 then
									if l_code <= 123641 then
										if l_code >= 123632 then
											Result := property_table_57.item ((l_code - 123632).to_integer_32)
										end
									else
										if l_code >= 125184 then
											Result := property_table_58.item ((l_code - 125184).to_integer_32)
										end
									end
								else
									if l_code >= 130032 and l_code <= 130041 then
										Result := property_table_59.item ((l_code - 130032).to_integer_32)
									end
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Flags

	is_upper_flag: NATURAL_8 = 0x01
	is_lower_flag: NATURAL_8 = 0x02
	is_title_flag: NATURAL_8 = 0x4
	is_digit_flag: NATURAL_8 = 0x08
	is_punctuation_flag: NATURAL_8 = 0x10
	is_control_flag: NATURAL_8 = 0x20
	is_hexa_digit_flag: NATURAL_8 = 0x40
	is_space_flag: NATURAL_8 = 0x80
			-- Flags for character properties used in `property_table'.

feature {NONE} -- Property tables

	to_lower_table_1: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000000C0 .. 0x0000024E.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244,
				245, 246, 215, 248, 249, 250, 251, 252, 253, 254, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233,
				234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255,
				257, 257, 259, 259, 261, 261, 263, 263, 265, 265, 267, 267, 269, 269, 271, 271, 273, 273, 275, 275, 277, 277,
				279, 279, 281, 281, 283, 283, 285, 285, 287, 287, 289, 289, 291, 291, 293, 293, 295, 295, 297, 297, 299, 299,
				301, 301, 303, 303, 105, 305, 307, 307, 309, 309, 311, 311, 312, 314, 314, 316, 316, 318, 318, 320, 320, 322,
				322, 324, 324, 326, 326, 328, 328, 329, 331, 331, 333, 333, 335, 335, 337, 337, 339, 339, 341, 341, 343,
				343, 345, 345, 347, 347, 349, 349, 351, 351, 353, 353, 355, 355, 357, 357, 359, 359, 361, 361, 363, 363,
				365, 365, 367, 367, 369, 369, 371, 371, 373, 373, 375, 375, 255, 378, 378, 380, 380, 382, 382, 383, 384, 595,
				387, 387, 389, 389, 596, 392, 392, 598, 599, 396, 396, 397, 477, 601, 603, 402, 402, 608, 611, 405, 617,
				616, 409, 409, 410, 411, 623, 626, 414, 629, 417, 417, 419, 419, 421, 421, 640, 424, 424, 643, 426, 427,
				429, 429, 648, 432, 432, 650, 651, 436, 436, 438, 438, 658, 441, 441, 442, 443, 445, 445, 446, 447, 448, 449,
				450, 451, 454, 454, 454, 457, 457, 457, 460, 460, 460, 462, 462, 464, 464, 466, 466, 468, 468, 470, 470, 472,
				472, 474, 474, 476, 476, 477, 479, 479, 481, 481, 483, 483, 485, 485, 487, 487, 489, 489, 491, 491, 493,
				493, 495, 495, 496, 499, 499, 499, 501, 501, 405, 447, 505, 505, 507, 507, 509, 509, 511, 511, 513, 513,
				515, 515, 517, 517, 519, 519, 521, 521, 523, 523, 525, 525, 527, 527, 529, 529, 531, 531, 533, 533, 535, 535,
				537, 537, 539, 539, 541, 541, 543, 543, 414, 545, 547, 547, 549, 549, 551, 551, 553, 553, 555, 555, 557, 557,
				559, 559, 561, 561, 563, 563, 564, 565, 566, 567, 568, 569, 11365, 572, 572, 410, 11366, 575, 576, 578, 578, 384,
				649, 652, 583, 583, 585, 585, 587, 587, 589, 589, 591
			>>).area
		end

	to_lower_table_2: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00000370 .. 0x00000556.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				881, 881, 883, 883, 884, 885, 887, 887, 888, 889, 890, 891, 892, 893, 894, 1011, 896, 897, 898, 899, 900,
				901, 940, 903, 941, 942, 943, 907, 972, 909, 973, 974, 912, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954,
				955, 956, 957, 958, 959, 960, 961, 930, 963, 964, 965, 966, 967, 968, 969, 970, 971, 940, 941, 942, 943,
				944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965,
				966, 967, 968, 969, 970, 971, 972, 973, 974, 983, 976, 977, 965, 973, 971, 981, 982, 983, 985, 985, 987, 987,
				989, 989, 991, 991, 993, 993, 995, 995, 997, 997, 999, 999, 1001, 1001, 1003, 1003, 1005, 1005, 1007, 1007, 1008, 1009,
				1010, 1011, 952, 1013, 1014, 1016, 1016, 1010, 1019, 1019, 1020, 891, 892, 893, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111,
				1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084,
				1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1072, 1073,
				1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095,
				1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117,
				1118, 1119, 1121, 1121, 1123, 1123, 1125, 1125, 1127, 1127, 1129, 1129, 1131, 1131, 1133, 1133, 1135, 1135, 1137, 1137, 1139, 1139,
				1141, 1141, 1143, 1143, 1145, 1145, 1147, 1147, 1149, 1149, 1151, 1151, 1153, 1153, 1154, 1155, 1156, 1157, 1158, 1159, 1160, 1161,
				1163, 1163, 1165, 1165, 1167, 1167, 1169, 1169, 1171, 1171, 1173, 1173, 1175, 1175, 1177, 1177, 1179, 1179, 1181, 1181, 1183, 1183,
				1185, 1185, 1187, 1187, 1189, 1189, 1191, 1191, 1193, 1193, 1195, 1195, 1197, 1197, 1199, 1199, 1201, 1201, 1203, 1203, 1205, 1205,
				1207, 1207, 1209, 1209, 1211, 1211, 1213, 1213, 1215, 1215, 1231, 1218, 1218, 1220, 1220, 1222, 1222, 1224, 1224, 1226, 1226, 1228,
				1228, 1230, 1230, 1231, 1233, 1233, 1235, 1235, 1237, 1237, 1239, 1239, 1241, 1241, 1243, 1243, 1245, 1245, 1247, 1247, 1249,
				1249, 1251, 1251, 1253, 1253, 1255, 1255, 1257, 1257, 1259, 1259, 1261, 1261, 1263, 1263, 1265, 1265, 1267, 1267, 1269, 1269,
				1271, 1271, 1273, 1273, 1275, 1275, 1277, 1277, 1279, 1279, 1281, 1281, 1283, 1283, 1285, 1285, 1287, 1287, 1289, 1289, 1291, 1291,
				1293, 1293, 1295, 1295, 1297, 1297, 1299, 1299, 1301, 1301, 1303, 1303, 1305, 1305, 1307, 1307, 1309, 1309, 1311, 1311, 1313, 1313,
				1315, 1315, 1317, 1317, 1319, 1319, 1321, 1321, 1323, 1323, 1325, 1325, 1327, 1327, 1328, 1377, 1378, 1379, 1380, 1381, 1382, 1383,
				1384, 1385, 1386, 1387, 1388, 1389, 1390, 1391, 1392, 1393, 1394, 1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1403, 1404,
				1405, 1406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414
			>>).area
		end

	to_lower_table_3: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000010A0 .. 0x000010CD.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				11520, 11521, 11522, 11523, 11524, 11525, 11526, 11527, 11528, 11529, 11530, 11531, 11532, 11533, 11534, 11535, 11536, 11537, 11538, 11539, 11540,
				11541, 11542, 11543, 11544, 11545, 11546, 11547, 11548, 11549, 11550, 11551, 11552, 11553, 11554, 11555, 11556, 11557, 4294, 11559, 4296, 4297,
				4298, 4299, 4300, 11565
			>>).area
		end

	to_lower_table_4: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000013A0 .. 0x000013F5.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				43888, 43889, 43890, 43891, 43892, 43893, 43894, 43895, 43896, 43897, 43898, 43899, 43900, 43901, 43902, 43903, 43904, 43905, 43906, 43907, 43908,
				43909, 43910, 43911, 43912, 43913, 43914, 43915, 43916, 43917, 43918, 43919, 43920, 43921, 43922, 43923, 43924, 43925, 43926, 43927, 43928, 43929,
				43930, 43931, 43932, 43933, 43934, 43935, 43936, 43937, 43938, 43939, 43940, 43941, 43942, 43943, 43944, 43945, 43946, 43947, 43948, 43949, 43950,
				43951, 43952, 43953, 43954, 43955, 43956, 43957, 43958, 43959, 43960, 43961, 43962, 43963, 43964, 43965, 43966, 43967, 5112, 5113, 5114, 5115,
				5116, 5117
			>>).area
		end

	to_lower_table_5: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001C90 .. 0x00001CBF.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				4304, 4305, 4306, 4307, 4308, 4309, 4310, 4311, 4312, 4313, 4314, 4315, 4316, 4317, 4318, 4319, 4320, 4321, 4322, 4323, 4324,
				4325, 4326, 4327, 4328, 4329, 4330, 4331, 4332, 4333, 4334, 4335, 4336, 4337, 4338, 4339, 4340, 4341, 4342, 4343, 4344, 4345,
				4346, 7355, 7356, 4349, 4350, 4351
			>>).area
		end

	to_lower_table_6: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001E00 .. 0x00001FFC.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				7681, 7681, 7683, 7683, 7685, 7685, 7687, 7687, 7689, 7689, 7691, 7691, 7693, 7693, 7695, 7695, 7697, 7697, 7699, 7699, 7701,
				7701, 7703, 7703, 7705, 7705, 7707, 7707, 7709, 7709, 7711, 7711, 7713, 7713, 7715, 7715, 7717, 7717, 7719, 7719, 7721, 7721,
				7723, 7723, 7725, 7725, 7727, 7727, 7729, 7729, 7731, 7731, 7733, 7733, 7735, 7735, 7737, 7737, 7739, 7739, 7741, 7741, 7743, 7743,
				7745, 7745, 7747, 7747, 7749, 7749, 7751, 7751, 7753, 7753, 7755, 7755, 7757, 7757, 7759, 7759, 7761, 7761, 7763, 7763, 7765, 7765,
				7767, 7767, 7769, 7769, 7771, 7771, 7773, 7773, 7775, 7775, 7777, 7777, 7779, 7779, 7781, 7781, 7783, 7783, 7785, 7785, 7787, 7787,
				7789, 7789, 7791, 7791, 7793, 7793, 7795, 7795, 7797, 7797, 7799, 7799, 7801, 7801, 7803, 7803, 7805, 7805, 7807, 7807, 7809, 7809,
				7811, 7811, 7813, 7813, 7815, 7815, 7817, 7817, 7819, 7819, 7821, 7821, 7823, 7823, 7825, 7825, 7827, 7827, 7829, 7829, 7830, 7831,
				7832, 7833, 7834, 7835, 7836, 7837, 223, 7839, 7841, 7841, 7843, 7843, 7845, 7845, 7847, 7847, 7849, 7849, 7851, 7851, 7853, 7853,
				7855, 7855, 7857, 7857, 7859, 7859, 7861, 7861, 7863, 7863, 7865, 7865, 7867, 7867, 7869, 7869, 7871, 7871, 7873, 7873, 7875, 7875,
				7877, 7877, 7879, 7879, 7881, 7881, 7883, 7883, 7885, 7885, 7887, 7887, 7889, 7889, 7891, 7891, 7893, 7893, 7895, 7895, 7897, 7897,
				7899, 7899, 7901, 7901, 7903, 7903, 7905, 7905, 7907, 7907, 7909, 7909, 7911, 7911, 7913, 7913, 7915, 7915, 7917, 7917, 7919, 7919,
				7921, 7921, 7923, 7923, 7925, 7925, 7927, 7927, 7929, 7929, 7931, 7931, 7933, 7933, 7935, 7935, 7936, 7937, 7938, 7939, 7940, 7941,
				7942, 7943, 7936, 7937, 7938, 7939, 7940, 7941, 7942, 7943, 7952, 7953, 7954, 7955, 7956, 7957, 7958, 7959, 7952, 7953, 7954, 7955,
				7956, 7957, 7966, 7967, 7968, 7969, 7970, 7971, 7972, 7973, 7974, 7975, 7968, 7969, 7970, 7971, 7972, 7973, 7974, 7975, 7984,
				7985, 7986, 7987, 7988, 7989, 7990, 7991, 7984, 7985, 7986, 7987, 7988, 7989, 7990, 7991, 8000, 8001, 8002, 8003, 8004, 8005, 8006,
				8007, 8000, 8001, 8002, 8003, 8004, 8005, 8014, 8015, 8016, 8017, 8018, 8019, 8020, 8021, 8022, 8023, 8024, 8017, 8026, 8019, 8028,
				8021, 8030, 8023, 8032, 8033, 8034, 8035, 8036, 8037, 8038, 8039, 8032, 8033, 8034, 8035, 8036, 8037, 8038, 8039, 8048, 8049, 8050,
				8051, 8052, 8053, 8054, 8055, 8056, 8057, 8058, 8059, 8060, 8061, 8062, 8063, 8064, 8065, 8066, 8067, 8068, 8069, 8070, 8071, 8064,
				8065, 8066, 8067, 8068, 8069, 8070, 8071, 8080, 8081, 8082, 8083, 8084, 8085, 8086, 8087, 8080, 8081, 8082, 8083, 8084, 8085,
				8086, 8087, 8096, 8097, 8098, 8099, 8100, 8101, 8102, 8103, 8096, 8097, 8098, 8099, 8100, 8101, 8102, 8103, 8112, 8113, 8114,
				8115, 8116, 8117, 8118, 8119, 8112, 8113, 8048, 8049, 8115, 8125, 8126, 8127, 8128, 8129, 8130, 8131, 8132, 8133, 8134, 8135, 8050,
				8051, 8052, 8053, 8131, 8141, 8142, 8143, 8144, 8145, 8146, 8147, 8148, 8149, 8150, 8151, 8144, 8145, 8054, 8055, 8156, 8157,
				8158, 8159, 8160, 8161, 8162, 8163, 8164, 8165, 8166, 8167, 8160, 8161, 8058, 8059, 8165, 8173, 8174, 8175, 8176, 8177, 8178, 8179,
				8180, 8181, 8182, 8183, 8056, 8057, 8060, 8061, 8179
			>>).area
		end

	to_lower_table_7: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00002126 .. 0x00002183.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				969, 8487, 8488, 8489, 107, 229, 8492, 8493, 8494, 8495, 8496, 8497, 8526, 8499, 8500, 8501, 8502, 8503, 8504, 8505, 8506,
				8507, 8508, 8509, 8510, 8511, 8512, 8513, 8514, 8515, 8516, 8517, 8518, 8519, 8520, 8521, 8522, 8523, 8524, 8525, 8526, 8527, 8528,
				8529, 8530, 8531, 8532, 8533, 8534, 8535, 8536, 8537, 8538, 8539, 8540, 8541, 8542, 8543, 8560, 8561, 8562, 8563, 8564, 8565, 8566,
				8567, 8568, 8569, 8570, 8571, 8572, 8573, 8574, 8575, 8560, 8561, 8562, 8563, 8564, 8565, 8566, 8567, 8568, 8569, 8570, 8571,
				8572, 8573, 8574, 8575, 8576, 8577, 8578, 8580
			>>).area
		end

	to_lower_table_8: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000024B6 .. 0x000024CF.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				9424, 9425, 9426, 9427, 9428, 9429, 9430, 9431, 9432, 9433, 9434, 9435, 9436, 9437, 9438, 9439, 9440, 9441, 9442, 9443, 9444,
				9445, 9446, 9447, 9448, 9449
			>>).area
		end

	to_lower_table_9: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00002C00 .. 0x00002CF2.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				11312, 11313, 11314, 11315, 11316, 11317, 11318, 11319, 11320, 11321, 11322, 11323, 11324, 11325, 11326, 11327, 11328, 11329, 11330, 11331, 11332,
				11333, 11334, 11335, 11336, 11337, 11338, 11339, 11340, 11341, 11342, 11343, 11344, 11345, 11346, 11347, 11348, 11349, 11350, 11351, 11352, 11353,
				11354, 11355, 11356, 11357, 11358, 11311, 11312, 11313, 11314, 11315, 11316, 11317, 11318, 11319, 11320, 11321, 11322, 11323, 11324, 11325, 11326,
				11327, 11328, 11329, 11330, 11331, 11332, 11333, 11334, 11335, 11336, 11337, 11338, 11339, 11340, 11341, 11342, 11343, 11344, 11345, 11346, 11347, 11348,
				11349, 11350, 11351, 11352, 11353, 11354, 11355, 11356, 11357, 11358, 11359, 11361, 11361, 619, 7549, 637, 11365, 11366, 11368, 11368, 11370, 11370,
				11372, 11372, 593, 625, 592, 594, 11377, 11379, 11379, 11380, 11382, 11382, 11383, 11384, 11385, 11386, 11387, 11388, 11389, 575, 576, 11393,
				11393, 11395, 11395, 11397, 11397, 11399, 11399, 11401, 11401, 11403, 11403, 11405, 11405, 11407, 11407, 11409, 11409, 11411, 11411, 11413, 11413,
				11415, 11415, 11417, 11417, 11419, 11419, 11421, 11421, 11423, 11423, 11425, 11425, 11427, 11427, 11429, 11429, 11431, 11431, 11433, 11433, 11435, 11435,
				11437, 11437, 11439, 11439, 11441, 11441, 11443, 11443, 11445, 11445, 11447, 11447, 11449, 11449, 11451, 11451, 11453, 11453, 11455, 11455, 11457, 11457,
				11459, 11459, 11461, 11461, 11463, 11463, 11465, 11465, 11467, 11467, 11469, 11469, 11471, 11471, 11473, 11473, 11475, 11475, 11477, 11477, 11479, 11479,
				11481, 11481, 11483, 11483, 11485, 11485, 11487, 11487, 11489, 11489, 11491, 11491, 11492, 11493, 11494, 11495, 11496, 11497, 11498, 11500, 11500, 11502,
				11502, 11503, 11504, 11505, 11507
			>>).area
		end

	to_lower_table_10: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000A640 .. 0x0000A7F5.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42561, 42561, 42563, 42563, 42565, 42565, 42567, 42567, 42569, 42569, 42571, 42571, 42573, 42573, 42575, 42575, 42577, 42577, 42579, 42579, 42581,
				42581, 42583, 42583, 42585, 42585, 42587, 42587, 42589, 42589, 42591, 42591, 42593, 42593, 42595, 42595, 42597, 42597, 42599, 42599, 42601, 42601,
				42603, 42603, 42605, 42605, 42606, 42607, 42608, 42609, 42610, 42611, 42612, 42613, 42614, 42615, 42616, 42617, 42618, 42619, 42620, 42621, 42622, 42623,
				42625, 42625, 42627, 42627, 42629, 42629, 42631, 42631, 42633, 42633, 42635, 42635, 42637, 42637, 42639, 42639, 42641, 42641, 42643, 42643, 42645, 42645,
				42647, 42647, 42649, 42649, 42651, 42651, 42652, 42653, 42654, 42655, 42656, 42657, 42658, 42659, 42660, 42661, 42662, 42663, 42664, 42665, 42666, 42667,
				42668, 42669, 42670, 42671, 42672, 42673, 42674, 42675, 42676, 42677, 42678, 42679, 42680, 42681, 42682, 42683, 42684, 42685, 42686, 42687, 42688, 42689,
				42690, 42691, 42692, 42693, 42694, 42695, 42696, 42697, 42698, 42699, 42700, 42701, 42702, 42703, 42704, 42705, 42706, 42707, 42708, 42709, 42710, 42711,
				42712, 42713, 42714, 42715, 42716, 42717, 42718, 42719, 42720, 42721, 42722, 42723, 42724, 42725, 42726, 42727, 42728, 42729, 42730, 42731, 42732, 42733,
				42734, 42735, 42736, 42737, 42738, 42739, 42740, 42741, 42742, 42743, 42744, 42745, 42746, 42747, 42748, 42749, 42750, 42751, 42752, 42753, 42754, 42755,
				42756, 42757, 42758, 42759, 42760, 42761, 42762, 42763, 42764, 42765, 42766, 42767, 42768, 42769, 42770, 42771, 42772, 42773, 42774, 42775, 42776, 42777,
				42778, 42779, 42780, 42781, 42782, 42783, 42784, 42785, 42787, 42787, 42789, 42789, 42791, 42791, 42793, 42793, 42795, 42795, 42797, 42797, 42799, 42799,
				42800, 42801, 42803, 42803, 42805, 42805, 42807, 42807, 42809, 42809, 42811, 42811, 42813, 42813, 42815, 42815, 42817, 42817, 42819, 42819, 42821, 42821,
				42823, 42823, 42825, 42825, 42827, 42827, 42829, 42829, 42831, 42831, 42833, 42833, 42835, 42835, 42837, 42837, 42839, 42839, 42841, 42841, 42843, 42843,
				42845, 42845, 42847, 42847, 42849, 42849, 42851, 42851, 42853, 42853, 42855, 42855, 42857, 42857, 42859, 42859, 42861, 42861, 42863, 42863, 42864, 42865,
				42866, 42867, 42868, 42869, 42870, 42871, 42872, 42874, 42874, 42876, 42876, 7545, 42879, 42879, 42881, 42881, 42883, 42883, 42885, 42885, 42887, 42887,
				42888, 42889, 42890, 42892, 42892, 613, 42894, 42895, 42897, 42897, 42899, 42899, 42900, 42901, 42903, 42903, 42905, 42905, 42907, 42907, 42909, 42909,
				42911, 42911, 42913, 42913, 42915, 42915, 42917, 42917, 42919, 42919, 42921, 42921, 614, 604, 609, 620, 618, 42927, 670, 647, 669, 43859,
				42933, 42933, 42935, 42935, 42937, 42937, 42939, 42939, 42941, 42941, 42943, 42943, 42944, 42945, 42947, 42947, 42900, 642, 7566, 42952, 42952,
				42954, 42954, 42955, 42956, 42957, 42958, 42959, 42960, 42961, 42962, 42963, 42964, 42965, 42966, 42967, 42968, 42969, 42970, 42971, 42972, 42973, 42974,
				42975, 42976, 42977, 42978, 42979, 42980, 42981, 42982, 42983, 42984, 42985, 42986, 42987, 42988, 42989, 42990, 42991, 42992, 42993, 42994, 42995, 42996,
				42998
			>>).area
		end

	to_lower_table_11: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000FF21 .. 0x0000FF3A.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				65345, 65346, 65347, 65348, 65349, 65350, 65351, 65352, 65353, 65354, 65355, 65356, 65357, 65358, 65359, 65360, 65361, 65362, 65363, 65364, 65365,
				65366, 65367, 65368, 65369, 65370
			>>).area
		end

	to_lower_table_12: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010400 .. 0x000104D3.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				66600, 66601, 66602, 66603, 66604, 66605, 66606, 66607, 66608, 66609, 66610, 66611, 66612, 66613, 66614, 66615, 66616, 66617, 66618, 66619, 66620,
				66621, 66622, 66623, 66624, 66625, 66626, 66627, 66628, 66629, 66630, 66631, 66632, 66633, 66634, 66635, 66636, 66637, 66638, 66639, 66600, 66601,
				66602, 66603, 66604, 66605, 66606, 66607, 66608, 66609, 66610, 66611, 66612, 66613, 66614, 66615, 66616, 66617, 66618, 66619, 66620, 66621, 66622, 66623,
				66624, 66625, 66626, 66627, 66628, 66629, 66630, 66631, 66632, 66633, 66634, 66635, 66636, 66637, 66638, 66639, 66640, 66641, 66642, 66643, 66644, 66645,
				66646, 66647, 66648, 66649, 66650, 66651, 66652, 66653, 66654, 66655, 66656, 66657, 66658, 66659, 66660, 66661, 66662, 66663, 66664, 66665, 66666, 66667,
				66668, 66669, 66670, 66671, 66672, 66673, 66674, 66675, 66676, 66677, 66678, 66679, 66680, 66681, 66682, 66683, 66684, 66685, 66686, 66687, 66688, 66689,
				66690, 66691, 66692, 66693, 66694, 66695, 66696, 66697, 66698, 66699, 66700, 66701, 66702, 66703, 66704, 66705, 66706, 66707, 66708, 66709, 66710, 66711,
				66712, 66713, 66714, 66715, 66716, 66717, 66718, 66719, 66720, 66721, 66722, 66723, 66724, 66725, 66726, 66727, 66728, 66729, 66730, 66731, 66732, 66733,
				66734, 66735, 66776, 66777, 66778, 66779, 66780, 66781, 66782, 66783, 66784, 66785, 66786, 66787, 66788, 66789, 66790, 66791, 66792, 66793, 66794, 66795,
				66796, 66797, 66798, 66799, 66800, 66801, 66802, 66803, 66804, 66805, 66806, 66807, 66808, 66809, 66810, 66811
			>>).area
		end

	to_lower_table_13: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010C80 .. 0x00010CB2.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				68800, 68801, 68802, 68803, 68804, 68805, 68806, 68807, 68808, 68809, 68810, 68811, 68812, 68813, 68814, 68815, 68816, 68817, 68818, 68819, 68820,
				68821, 68822, 68823, 68824, 68825, 68826, 68827, 68828, 68829, 68830, 68831, 68832, 68833, 68834, 68835, 68836, 68837, 68838, 68839, 68840, 68841,
				68842, 68843, 68844, 68845, 68846, 68847, 68848, 68849, 68850
			>>).area
		end

	to_lower_table_14: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x000118A0 .. 0x000118BF.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				71872, 71873, 71874, 71875, 71876, 71877, 71878, 71879, 71880, 71881, 71882, 71883, 71884, 71885, 71886, 71887, 71888, 71889, 71890, 71891, 71892,
				71893, 71894, 71895, 71896, 71897, 71898, 71899, 71900, 71901, 71902, 71903
			>>).area
		end

	to_lower_table_15: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00016E40 .. 0x00016E5F.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				93792, 93793, 93794, 93795, 93796, 93797, 93798, 93799, 93800, 93801, 93802, 93803, 93804, 93805, 93806, 93807, 93808, 93809, 93810, 93811, 93812,
				93813, 93814, 93815, 93816, 93817, 93818, 93819, 93820, 93821, 93822, 93823
			>>).area
		end

	to_lower_table_16: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x0001E900 .. 0x0001E921.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				125218, 125219, 125220, 125221, 125222, 125223, 125224, 125225, 125226, 125227, 125228, 125229, 125230, 125231, 125232, 125233, 125234, 125235, 125236, 125237, 125238,
				125239, 125240, 125241, 125242, 125243, 125244, 125245, 125246, 125247, 125248, 125249, 125250, 125251
			>>).area
		end

	to_upper_table_1: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000000B5 .. 0x0000029E.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				924, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201,
				202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223,
				192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213,
				214, 247, 216, 217, 218, 219, 220, 221, 222, 376, 256, 256, 258, 258, 260, 260, 262, 262, 264, 264, 266,
				266, 268, 268, 270, 270, 272, 272, 274, 274, 276, 276, 278, 278, 280, 280, 282, 282, 284, 284, 286, 286, 288,
				288, 290, 290, 292, 292, 294, 294, 296, 296, 298, 298, 300, 300, 302, 302, 304, 73, 306, 306, 308, 308, 310,
				310, 312, 313, 313, 315, 315, 317, 317, 319, 319, 321, 321, 323, 323, 325, 325, 327, 327, 329, 330, 330, 332,
				332, 334, 334, 336, 336, 338, 338, 340, 340, 342, 342, 344, 344, 346, 346, 348, 348, 350, 350, 352, 352, 354,
				354, 356, 356, 358, 358, 360, 360, 362, 362, 364, 364, 366, 366, 368, 368, 370, 370, 372, 372, 374, 374, 376,
				377, 377, 379, 379, 381, 381, 83, 579, 385, 386, 386, 388, 388, 390, 391, 391, 393, 394, 395, 395, 397, 398,
				399, 400, 401, 401, 403, 404, 502, 406, 407, 408, 408, 573, 411, 412, 413, 544, 415, 416, 416, 418, 418, 420,
				420, 422, 423, 423, 425, 426, 427, 428, 428, 430, 431, 431, 433, 434, 435, 435, 437, 437, 439, 440, 440, 442,
				443, 444, 444, 446, 503, 448, 449, 450, 451, 452, 452, 452, 455, 455, 455, 458, 458, 458, 461, 461, 463, 463,
				465, 465, 467, 467, 469, 469, 471, 471, 473, 473, 475, 475, 398, 478, 478, 480, 480, 482, 482, 484, 484,
				486, 486, 488, 488, 490, 490, 492, 492, 494, 494, 496, 497, 497, 497, 500, 500, 502, 503, 504, 504, 506,
				506, 508, 508, 510, 510, 512, 512, 514, 514, 516, 516, 518, 518, 520, 520, 522, 522, 524, 524, 526, 526, 528,
				528, 530, 530, 532, 532, 534, 534, 536, 536, 538, 538, 540, 540, 542, 542, 544, 545, 546, 546, 548, 548, 550,
				550, 552, 552, 554, 554, 556, 556, 558, 558, 560, 560, 562, 562, 564, 565, 566, 567, 568, 569, 570, 571, 571,
				573, 574, 11390, 11391, 577, 577, 579, 580, 581, 582, 582, 584, 584, 586, 586, 588, 588, 590, 590, 11375, 11373,
				11376, 385, 390, 597, 393, 394, 600, 399, 602, 400, 42923, 605, 606, 607, 403, 42924, 610, 404, 612, 42893, 42922,
				615, 407, 406, 42926, 11362, 42925, 621, 622, 412, 624, 11374, 413, 627, 628, 415, 630, 631, 632, 633, 634, 635,
				636, 11364, 638, 639, 422, 641, 42949, 425, 644, 645, 646, 42929, 430, 580, 433, 434, 581, 653, 654, 655, 656, 657,
				439, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 42930, 42928
			>>).area
		end

	to_upper_table_2: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00000345 .. 0x00000586.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				921, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857,
				858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879,
				880, 880, 882, 882, 884, 885, 886, 886, 888, 889, 890, 1021, 1022, 1023, 894, 895, 896, 897, 898, 899, 900, 901,
				902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 938, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923,
				924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 902, 904, 905, 906, 939, 913,
				914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 931, 931, 932, 933, 934,
				935, 936, 937, 938, 939, 908, 910, 911, 975, 914, 920, 978, 979, 980, 934, 928, 975, 984, 984, 986, 986,
				988, 988, 990, 990, 992, 992, 994, 994, 996, 996, 998, 998, 1000, 1000, 1002, 1002, 1004, 1004, 1006, 1006, 922,
				929, 1017, 895, 1012, 917, 1014, 1015, 1015, 1017, 1018, 1018, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029,
				1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051,
				1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1040, 1041,
				1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062,
				1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035,
				1036, 1037, 1038, 1039, 1120, 1120, 1122, 1122, 1124, 1124, 1126, 1126, 1128, 1128, 1130, 1130, 1132, 1132, 1134, 1134, 1136,
				1136, 1138, 1138, 1140, 1140, 1142, 1142, 1144, 1144, 1146, 1146, 1148, 1148, 1150, 1150, 1152, 1152, 1154, 1155, 1156, 1157, 1158,
				1159, 1160, 1161, 1162, 1162, 1164, 1164, 1166, 1166, 1168, 1168, 1170, 1170, 1172, 1172, 1174, 1174, 1176, 1176, 1178, 1178, 1180,
				1180, 1182, 1182, 1184, 1184, 1186, 1186, 1188, 1188, 1190, 1190, 1192, 1192, 1194, 1194, 1196, 1196, 1198, 1198, 1200, 1200, 1202,
				1202, 1204, 1204, 1206, 1206, 1208, 1208, 1210, 1210, 1212, 1212, 1214, 1214, 1216, 1217, 1217, 1219, 1219, 1221, 1221, 1223, 1223,
				1225, 1225, 1227, 1227, 1229, 1229, 1216, 1232, 1232, 1234, 1234, 1236, 1236, 1238, 1238, 1240, 1240, 1242, 1242, 1244, 1244,
				1246, 1246, 1248, 1248, 1250, 1250, 1252, 1252, 1254, 1254, 1256, 1256, 1258, 1258, 1260, 1260, 1262, 1262, 1264, 1264, 1266,
				1266, 1268, 1268, 1270, 1270, 1272, 1272, 1274, 1274, 1276, 1276, 1278, 1278, 1280, 1280, 1282, 1282, 1284, 1284, 1286, 1286, 1288,
				1288, 1290, 1290, 1292, 1292, 1294, 1294, 1296, 1296, 1298, 1298, 1300, 1300, 1302, 1302, 1304, 1304, 1306, 1306, 1308, 1308, 1310,
				1310, 1312, 1312, 1314, 1314, 1316, 1316, 1318, 1318, 1320, 1320, 1322, 1322, 1324, 1324, 1326, 1326, 1328, 1329, 1330, 1331, 1332,
				1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354,
				1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368, 1369, 1370, 1371, 1372, 1373, 1374, 1375, 1376,
				1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350,
				1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366
			>>).area
		end

	to_upper_table_3: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000010D0 .. 0x000010FF.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				7312, 7313, 7314, 7315, 7316, 7317, 7318, 7319, 7320, 7321, 7322, 7323, 7324, 7325, 7326, 7327, 7328, 7329, 7330, 7331, 7332,
				7333, 7334, 7335, 7336, 7337, 7338, 7339, 7340, 7341, 7342, 7343, 7344, 7345, 7346, 7347, 7348, 7349, 7350, 7351, 7352, 7353,
				7354, 4347, 4348, 7357, 7358, 7359
			>>).area
		end

	to_upper_table_4: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000013F8 .. 0x000013FD.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				5104, 5105, 5106, 5107, 5108, 5109
			>>).area
		end

	to_upper_table_5: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001C80 .. 0x00001C88.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				1042, 1044, 1054, 1057, 1058, 1058, 1066, 1122, 42570
			>>).area
		end

	to_upper_table_6: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001D79 .. 0x00001FF3.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42877, 7546, 7547, 7548, 11363, 7550, 7551, 7552, 7553, 7554, 7555, 7556, 7557, 7558, 7559, 7560, 7561, 7562, 7563, 7564, 7565,
				42950, 7567, 7568, 7569, 7570, 7571, 7572, 7573, 7574, 7575, 7576, 7577, 7578, 7579, 7580, 7581, 7582, 7583, 7584, 7585, 7586, 7587,
				7588, 7589, 7590, 7591, 7592, 7593, 7594, 7595, 7596, 7597, 7598, 7599, 7600, 7601, 7602, 7603, 7604, 7605, 7606, 7607, 7608, 7609,
				7610, 7611, 7612, 7613, 7614, 7615, 7616, 7617, 7618, 7619, 7620, 7621, 7622, 7623, 7624, 7625, 7626, 7627, 7628, 7629, 7630, 7631,
				7632, 7633, 7634, 7635, 7636, 7637, 7638, 7639, 7640, 7641, 7642, 7643, 7644, 7645, 7646, 7647, 7648, 7649, 7650, 7651, 7652, 7653,
				7654, 7655, 7656, 7657, 7658, 7659, 7660, 7661, 7662, 7663, 7664, 7665, 7666, 7667, 7668, 7669, 7670, 7671, 7672, 7673, 7674, 7675,
				7676, 7677, 7678, 7679, 7680, 7680, 7682, 7682, 7684, 7684, 7686, 7686, 7688, 7688, 7690, 7690, 7692, 7692, 7694, 7694, 7696, 7696,
				7698, 7698, 7700, 7700, 7702, 7702, 7704, 7704, 7706, 7706, 7708, 7708, 7710, 7710, 7712, 7712, 7714, 7714, 7716, 7716, 7718,
				7718, 7720, 7720, 7722, 7722, 7724, 7724, 7726, 7726, 7728, 7728, 7730, 7730, 7732, 7732, 7734, 7734, 7736, 7736, 7738, 7738, 7740,
				7740, 7742, 7742, 7744, 7744, 7746, 7746, 7748, 7748, 7750, 7750, 7752, 7752, 7754, 7754, 7756, 7756, 7758, 7758, 7760, 7760, 7762,
				7762, 7764, 7764, 7766, 7766, 7768, 7768, 7770, 7770, 7772, 7772, 7774, 7774, 7776, 7776, 7778, 7778, 7780, 7780, 7782, 7782, 7784,
				7784, 7786, 7786, 7788, 7788, 7790, 7790, 7792, 7792, 7794, 7794, 7796, 7796, 7798, 7798, 7800, 7800, 7802, 7802, 7804, 7804, 7806,
				7806, 7808, 7808, 7810, 7810, 7812, 7812, 7814, 7814, 7816, 7816, 7818, 7818, 7820, 7820, 7822, 7822, 7824, 7824, 7826, 7826, 7828,
				7828, 7830, 7831, 7832, 7833, 7834, 7776, 7836, 7837, 7838, 7839, 7840, 7840, 7842, 7842, 7844, 7844, 7846, 7846, 7848, 7848, 7850,
				7850, 7852, 7852, 7854, 7854, 7856, 7856, 7858, 7858, 7860, 7860, 7862, 7862, 7864, 7864, 7866, 7866, 7868, 7868, 7870, 7870, 7872,
				7872, 7874, 7874, 7876, 7876, 7878, 7878, 7880, 7880, 7882, 7882, 7884, 7884, 7886, 7886, 7888, 7888, 7890, 7890, 7892, 7892, 7894,
				7894, 7896, 7896, 7898, 7898, 7900, 7900, 7902, 7902, 7904, 7904, 7906, 7906, 7908, 7908, 7910, 7910, 7912, 7912, 7914, 7914, 7916,
				7916, 7918, 7918, 7920, 7920, 7922, 7922, 7924, 7924, 7926, 7926, 7928, 7928, 7930, 7930, 7932, 7932, 7934, 7934, 7944, 7945, 7946,
				7947, 7948, 7949, 7950, 7951, 7944, 7945, 7946, 7947, 7948, 7949, 7950, 7951, 7960, 7961, 7962, 7963, 7964, 7965, 7958, 7959,
				7960, 7961, 7962, 7963, 7964, 7965, 7966, 7967, 7976, 7977, 7978, 7979, 7980, 7981, 7982, 7983, 7976, 7977, 7978, 7979, 7980, 7981,
				7982, 7983, 7992, 7993, 7994, 7995, 7996, 7997, 7998, 7999, 7992, 7993, 7994, 7995, 7996, 7997, 7998, 7999, 8008, 8009, 8010, 8011,
				8012, 8013, 8006, 8007, 8008, 8009, 8010, 8011, 8012, 8013, 8014, 8015, 8016, 8025, 8018, 8027, 8020, 8029, 8022, 8031, 8024,
				8025, 8026, 8027, 8028, 8029, 8030, 8031, 8040, 8041, 8042, 8043, 8044, 8045, 8046, 8047, 8040, 8041, 8042, 8043, 8044, 8045, 8046,
				8047, 8122, 8123, 8136, 8137, 8138, 8139, 8154, 8155, 8184, 8185, 8170, 8171, 8186, 8187, 8062, 8063, 8072, 8073, 8074, 8075, 8076,
				8077, 8078, 8079, 8072, 8073, 8074, 8075, 8076, 8077, 8078, 8079, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 8095, 8088, 8089,
				8090, 8091, 8092, 8093, 8094, 8095, 8104, 8105, 8106, 8107, 8108, 8109, 8110, 8111, 8104, 8105, 8106, 8107, 8108, 8109, 8110, 8111,
				8120, 8121, 8114, 8124, 8116, 8117, 8118, 8119, 8120, 8121, 8122, 8123, 8124, 8125, 921, 8127, 8128, 8129, 8130, 8140, 8132, 8133,
				8134, 8135, 8136, 8137, 8138, 8139, 8140, 8141, 8142, 8143, 8152, 8153, 8146, 8147, 8148, 8149, 8150, 8151, 8152, 8153, 8154, 8155,
				8156, 8157, 8158, 8159, 8168, 8169, 8162, 8163, 8164, 8172, 8166, 8167, 8168, 8169, 8170, 8171, 8172, 8173, 8174, 8175, 8176, 8177,
				8178, 8188
			>>).area
		end

	to_upper_table_7: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000214E .. 0x00002184.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				8498, 8527, 8528, 8529, 8530, 8531, 8532, 8533, 8534, 8535, 8536, 8537, 8538, 8539, 8540, 8541, 8542, 8543, 8544, 8545, 8546,
				8547, 8548, 8549, 8550, 8551, 8552, 8553, 8554, 8555, 8556, 8557, 8558, 8559, 8544, 8545, 8546, 8547, 8548, 8549, 8550, 8551, 8552,
				8553, 8554, 8555, 8556, 8557, 8558, 8559, 8576, 8577, 8578, 8579, 8579
			>>).area
		end

	to_upper_table_8: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000024D0 .. 0x000024E9.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				9398, 9399, 9400, 9401, 9402, 9403, 9404, 9405, 9406, 9407, 9408, 9409, 9410, 9411, 9412, 9413, 9414, 9415, 9416, 9417, 9418,
				9419, 9420, 9421, 9422, 9423
			>>).area
		end

	to_upper_table_9: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00002C30 .. 0x00002D2D.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				11264, 11265, 11266, 11267, 11268, 11269, 11270, 11271, 11272, 11273, 11274, 11275, 11276, 11277, 11278, 11279, 11280, 11281, 11282, 11283, 11284,
				11285, 11286, 11287, 11288, 11289, 11290, 11291, 11292, 11293, 11294, 11295, 11296, 11297, 11298, 11299, 11300, 11301, 11302, 11303, 11304, 11305,
				11306, 11307, 11308, 11309, 11310, 11359, 11360, 11360, 11362, 11363, 11364, 570, 574, 11367, 11367, 11369, 11369, 11371, 11371, 11373, 11374,
				11375, 11376, 11377, 11378, 11378, 11380, 11381, 11381, 11383, 11384, 11385, 11386, 11387, 11388, 11389, 11390, 11391, 11392, 11392, 11394, 11394, 11396,
				11396, 11398, 11398, 11400, 11400, 11402, 11402, 11404, 11404, 11406, 11406, 11408, 11408, 11410, 11410, 11412, 11412, 11414, 11414, 11416, 11416, 11418,
				11418, 11420, 11420, 11422, 11422, 11424, 11424, 11426, 11426, 11428, 11428, 11430, 11430, 11432, 11432, 11434, 11434, 11436, 11436, 11438, 11438, 11440,
				11440, 11442, 11442, 11444, 11444, 11446, 11446, 11448, 11448, 11450, 11450, 11452, 11452, 11454, 11454, 11456, 11456, 11458, 11458, 11460, 11460, 11462,
				11462, 11464, 11464, 11466, 11466, 11468, 11468, 11470, 11470, 11472, 11472, 11474, 11474, 11476, 11476, 11478, 11478, 11480, 11480, 11482, 11482, 11484,
				11484, 11486, 11486, 11488, 11488, 11490, 11490, 11492, 11493, 11494, 11495, 11496, 11497, 11498, 11499, 11499, 11501, 11501, 11503, 11504, 11505, 11506,
				11506, 11508, 11509, 11510, 11511, 11512, 11513, 11514, 11515, 11516, 11517, 11518, 11519, 4256, 4257, 4258, 4259, 4260, 4261, 4262, 4263, 4264,
				4265, 4266, 4267, 4268, 4269, 4270, 4271, 4272, 4273, 4274, 4275, 4276, 4277, 4278, 4279, 4280, 4281, 4282, 4283, 4284, 4285,
				4286, 4287, 4288, 4289, 4290, 4291, 4292, 4293, 11558, 4295, 11560, 11561, 11562, 11563, 11564, 4301
			>>).area
		end

	to_upper_table_10: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000A641 .. 0x0000A7F6.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42560, 42562, 42562, 42564, 42564, 42566, 42566, 42568, 42568, 42570, 42570, 42572, 42572, 42574, 42574, 42576, 42576, 42578, 42578, 42580, 42580,
				42582, 42582, 42584, 42584, 42586, 42586, 42588, 42588, 42590, 42590, 42592, 42592, 42594, 42594, 42596, 42596, 42598, 42598, 42600, 42600, 42602,
				42602, 42604, 42604, 42606, 42607, 42608, 42609, 42610, 42611, 42612, 42613, 42614, 42615, 42616, 42617, 42618, 42619, 42620, 42621, 42622, 42623, 42624,
				42624, 42626, 42626, 42628, 42628, 42630, 42630, 42632, 42632, 42634, 42634, 42636, 42636, 42638, 42638, 42640, 42640, 42642, 42642, 42644, 42644, 42646,
				42646, 42648, 42648, 42650, 42650, 42652, 42653, 42654, 42655, 42656, 42657, 42658, 42659, 42660, 42661, 42662, 42663, 42664, 42665, 42666, 42667, 42668,
				42669, 42670, 42671, 42672, 42673, 42674, 42675, 42676, 42677, 42678, 42679, 42680, 42681, 42682, 42683, 42684, 42685, 42686, 42687, 42688, 42689, 42690,
				42691, 42692, 42693, 42694, 42695, 42696, 42697, 42698, 42699, 42700, 42701, 42702, 42703, 42704, 42705, 42706, 42707, 42708, 42709, 42710, 42711, 42712,
				42713, 42714, 42715, 42716, 42717, 42718, 42719, 42720, 42721, 42722, 42723, 42724, 42725, 42726, 42727, 42728, 42729, 42730, 42731, 42732, 42733, 42734,
				42735, 42736, 42737, 42738, 42739, 42740, 42741, 42742, 42743, 42744, 42745, 42746, 42747, 42748, 42749, 42750, 42751, 42752, 42753, 42754, 42755, 42756,
				42757, 42758, 42759, 42760, 42761, 42762, 42763, 42764, 42765, 42766, 42767, 42768, 42769, 42770, 42771, 42772, 42773, 42774, 42775, 42776, 42777, 42778,
				42779, 42780, 42781, 42782, 42783, 42784, 42785, 42786, 42786, 42788, 42788, 42790, 42790, 42792, 42792, 42794, 42794, 42796, 42796, 42798, 42798, 42800,
				42801, 42802, 42802, 42804, 42804, 42806, 42806, 42808, 42808, 42810, 42810, 42812, 42812, 42814, 42814, 42816, 42816, 42818, 42818, 42820, 42820, 42822,
				42822, 42824, 42824, 42826, 42826, 42828, 42828, 42830, 42830, 42832, 42832, 42834, 42834, 42836, 42836, 42838, 42838, 42840, 42840, 42842, 42842, 42844,
				42844, 42846, 42846, 42848, 42848, 42850, 42850, 42852, 42852, 42854, 42854, 42856, 42856, 42858, 42858, 42860, 42860, 42862, 42862, 42864, 42865, 42866,
				42867, 42868, 42869, 42870, 42871, 42872, 42873, 42873, 42875, 42875, 42877, 42878, 42878, 42880, 42880, 42882, 42882, 42884, 42884, 42886, 42886, 42888,
				42889, 42890, 42891, 42891, 42893, 42894, 42895, 42896, 42896, 42898, 42898, 42948, 42901, 42902, 42902, 42904, 42904, 42906, 42906, 42908, 42908, 42910,
				42910, 42912, 42912, 42914, 42914, 42916, 42916, 42918, 42918, 42920, 42920, 42922, 42923, 42924, 42925, 42926, 42927, 42928, 42929, 42930, 42931, 42932,
				42932, 42934, 42934, 42936, 42936, 42938, 42938, 42940, 42940, 42942, 42942, 42944, 42945, 42946, 42946, 42948, 42949, 42950, 42951, 42951, 42953, 42953,
				42955, 42956, 42957, 42958, 42959, 42960, 42961, 42962, 42963, 42964, 42965, 42966, 42967, 42968, 42969, 42970, 42971, 42972, 42973, 42974, 42975,
				42976, 42977, 42978, 42979, 42980, 42981, 42982, 42983, 42984, 42985, 42986, 42987, 42988, 42989, 42990, 42991, 42992, 42993, 42994, 42995, 42996, 42997,
				42997
			>>).area
		end

	to_upper_table_11: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000AB53 .. 0x0000ABBF.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42931, 43860, 43861, 43862, 43863, 43864, 43865, 43866, 43867, 43868, 43869, 43870, 43871, 43872, 43873, 43874, 43875, 43876, 43877, 43878, 43879,
				43880, 43881, 43882, 43883, 43884, 43885, 43886, 43887, 5024, 5025, 5026, 5027, 5028, 5029, 5030, 5031, 5032, 5033, 5034, 5035, 5036, 5037,
				5038, 5039, 5040, 5041, 5042, 5043, 5044, 5045, 5046, 5047, 5048, 5049, 5050, 5051, 5052, 5053, 5054, 5055, 5056, 5057, 5058,
				5059, 5060, 5061, 5062, 5063, 5064, 5065, 5066, 5067, 5068, 5069, 5070, 5071, 5072, 5073, 5074, 5075, 5076, 5077, 5078, 5079,
				5080, 5081, 5082, 5083, 5084, 5085, 5086, 5087, 5088, 5089, 5090, 5091, 5092, 5093, 5094, 5095, 5096, 5097, 5098, 5099, 5100,
				5101, 5102, 5103
			>>).area
		end

	to_upper_table_12: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000FF41 .. 0x0000FF5A.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				65313, 65314, 65315, 65316, 65317, 65318, 65319, 65320, 65321, 65322, 65323, 65324, 65325, 65326, 65327, 65328, 65329, 65330, 65331, 65332, 65333,
				65334, 65335, 65336, 65337, 65338
			>>).area
		end

	to_upper_table_13: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010428 .. 0x000104FB.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				66560, 66561, 66562, 66563, 66564, 66565, 66566, 66567, 66568, 66569, 66570, 66571, 66572, 66573, 66574, 66575, 66576, 66577, 66578, 66579, 66580,
				66581, 66582, 66583, 66584, 66585, 66586, 66587, 66588, 66589, 66590, 66591, 66592, 66593, 66594, 66595, 66596, 66597, 66598, 66599, 66640, 66641,
				66642, 66643, 66644, 66645, 66646, 66647, 66648, 66649, 66650, 66651, 66652, 66653, 66654, 66655, 66656, 66657, 66658, 66659, 66660, 66661, 66662, 66663,
				66664, 66665, 66666, 66667, 66668, 66669, 66670, 66671, 66672, 66673, 66674, 66675, 66676, 66677, 66678, 66679, 66680, 66681, 66682, 66683, 66684, 66685,
				66686, 66687, 66688, 66689, 66690, 66691, 66692, 66693, 66694, 66695, 66696, 66697, 66698, 66699, 66700, 66701, 66702, 66703, 66704, 66705, 66706, 66707,
				66708, 66709, 66710, 66711, 66712, 66713, 66714, 66715, 66716, 66717, 66718, 66719, 66720, 66721, 66722, 66723, 66724, 66725, 66726, 66727, 66728, 66729,
				66730, 66731, 66732, 66733, 66734, 66735, 66736, 66737, 66738, 66739, 66740, 66741, 66742, 66743, 66744, 66745, 66746, 66747, 66748, 66749, 66750, 66751,
				66752, 66753, 66754, 66755, 66756, 66757, 66758, 66759, 66760, 66761, 66762, 66763, 66764, 66765, 66766, 66767, 66768, 66769, 66770, 66771, 66772, 66773,
				66774, 66775, 66736, 66737, 66738, 66739, 66740, 66741, 66742, 66743, 66744, 66745, 66746, 66747, 66748, 66749, 66750, 66751, 66752, 66753, 66754, 66755,
				66756, 66757, 66758, 66759, 66760, 66761, 66762, 66763, 66764, 66765, 66766, 66767, 66768, 66769, 66770, 66771
			>>).area
		end

	to_upper_table_14: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010CC0 .. 0x00010CF2.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				68736, 68737, 68738, 68739, 68740, 68741, 68742, 68743, 68744, 68745, 68746, 68747, 68748, 68749, 68750, 68751, 68752, 68753, 68754, 68755, 68756,
				68757, 68758, 68759, 68760, 68761, 68762, 68763, 68764, 68765, 68766, 68767, 68768, 68769, 68770, 68771, 68772, 68773, 68774, 68775, 68776, 68777,
				68778, 68779, 68780, 68781, 68782, 68783, 68784, 68785, 68786
			>>).area
		end

	to_upper_table_15: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x000118C0 .. 0x000118DF.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				71840, 71841, 71842, 71843, 71844, 71845, 71846, 71847, 71848, 71849, 71850, 71851, 71852, 71853, 71854, 71855, 71856, 71857, 71858, 71859, 71860,
				71861, 71862, 71863, 71864, 71865, 71866, 71867, 71868, 71869, 71870, 71871
			>>).area
		end

	to_upper_table_16: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00016E60 .. 0x00016E7F.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				93760, 93761, 93762, 93763, 93764, 93765, 93766, 93767, 93768, 93769, 93770, 93771, 93772, 93773, 93774, 93775, 93776, 93777, 93778, 93779, 93780,
				93781, 93782, 93783, 93784, 93785, 93786, 93787, 93788, 93789, 93790, 93791
			>>).area
		end

	to_upper_table_17: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x0001E922 .. 0x0001E943.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				125184, 125185, 125186, 125187, 125188, 125189, 125190, 125191, 125192, 125193, 125194, 125195, 125196, 125197, 125198, 125199, 125200, 125201, 125202, 125203, 125204,
				125205, 125206, 125207, 125208, 125209, 125210, 125211, 125212, 125213, 125214, 125215, 125216, 125217
			>>).area
		end

	to_title_table_1: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000000B5 .. 0x0000029E.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				924, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201,
				202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223,
				192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213,
				214, 247, 216, 217, 218, 219, 220, 221, 222, 376, 256, 256, 258, 258, 260, 260, 262, 262, 264, 264, 266,
				266, 268, 268, 270, 270, 272, 272, 274, 274, 276, 276, 278, 278, 280, 280, 282, 282, 284, 284, 286, 286, 288,
				288, 290, 290, 292, 292, 294, 294, 296, 296, 298, 298, 300, 300, 302, 302, 304, 73, 306, 306, 308, 308, 310,
				310, 312, 313, 313, 315, 315, 317, 317, 319, 319, 321, 321, 323, 323, 325, 325, 327, 327, 329, 330, 330, 332,
				332, 334, 334, 336, 336, 338, 338, 340, 340, 342, 342, 344, 344, 346, 346, 348, 348, 350, 350, 352, 352, 354,
				354, 356, 356, 358, 358, 360, 360, 362, 362, 364, 364, 366, 366, 368, 368, 370, 370, 372, 372, 374, 374, 376,
				377, 377, 379, 379, 381, 381, 83, 579, 385, 386, 386, 388, 388, 390, 391, 391, 393, 394, 395, 395, 397, 398,
				399, 400, 401, 401, 403, 404, 502, 406, 407, 408, 408, 573, 411, 412, 413, 544, 415, 416, 416, 418, 418, 420,
				420, 422, 423, 423, 425, 426, 427, 428, 428, 430, 431, 431, 433, 434, 435, 435, 437, 437, 439, 440, 440, 442,
				443, 444, 444, 446, 503, 448, 449, 450, 451, 453, 453, 453, 456, 456, 456, 459, 459, 459, 461, 461, 463, 463,
				465, 465, 467, 467, 469, 469, 471, 471, 473, 473, 475, 475, 398, 478, 478, 480, 480, 482, 482, 484, 484,
				486, 486, 488, 488, 490, 490, 492, 492, 494, 494, 496, 498, 498, 498, 500, 500, 502, 503, 504, 504, 506,
				506, 508, 508, 510, 510, 512, 512, 514, 514, 516, 516, 518, 518, 520, 520, 522, 522, 524, 524, 526, 526, 528,
				528, 530, 530, 532, 532, 534, 534, 536, 536, 538, 538, 540, 540, 542, 542, 544, 545, 546, 546, 548, 548, 550,
				550, 552, 552, 554, 554, 556, 556, 558, 558, 560, 560, 562, 562, 564, 565, 566, 567, 568, 569, 570, 571, 571,
				573, 574, 11390, 11391, 577, 577, 579, 580, 581, 582, 582, 584, 584, 586, 586, 588, 588, 590, 590, 11375, 11373,
				11376, 385, 390, 597, 393, 394, 600, 399, 602, 400, 42923, 605, 606, 607, 403, 42924, 610, 404, 612, 42893, 42922,
				615, 407, 406, 42926, 11362, 42925, 621, 622, 412, 624, 11374, 413, 627, 628, 415, 630, 631, 632, 633, 634, 635,
				636, 11364, 638, 639, 422, 641, 42949, 425, 644, 645, 646, 42929, 430, 580, 433, 434, 581, 653, 654, 655, 656, 657,
				439, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 42930, 42928
			>>).area
		end

	to_title_table_2: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00000345 .. 0x00000586.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				921, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857,
				858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879,
				880, 880, 882, 882, 884, 885, 886, 886, 888, 889, 890, 1021, 1022, 1023, 894, 895, 896, 897, 898, 899, 900, 901,
				902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 938, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923,
				924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 902, 904, 905, 906, 939, 913,
				914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 931, 931, 932, 933, 934,
				935, 936, 937, 938, 939, 908, 910, 911, 975, 914, 920, 978, 979, 980, 934, 928, 975, 984, 984, 986, 986,
				988, 988, 990, 990, 992, 992, 994, 994, 996, 996, 998, 998, 1000, 1000, 1002, 1002, 1004, 1004, 1006, 1006, 922,
				929, 1017, 895, 1012, 917, 1014, 1015, 1015, 1017, 1018, 1018, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029,
				1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051,
				1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1040, 1041,
				1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062,
				1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035,
				1036, 1037, 1038, 1039, 1120, 1120, 1122, 1122, 1124, 1124, 1126, 1126, 1128, 1128, 1130, 1130, 1132, 1132, 1134, 1134, 1136,
				1136, 1138, 1138, 1140, 1140, 1142, 1142, 1144, 1144, 1146, 1146, 1148, 1148, 1150, 1150, 1152, 1152, 1154, 1155, 1156, 1157, 1158,
				1159, 1160, 1161, 1162, 1162, 1164, 1164, 1166, 1166, 1168, 1168, 1170, 1170, 1172, 1172, 1174, 1174, 1176, 1176, 1178, 1178, 1180,
				1180, 1182, 1182, 1184, 1184, 1186, 1186, 1188, 1188, 1190, 1190, 1192, 1192, 1194, 1194, 1196, 1196, 1198, 1198, 1200, 1200, 1202,
				1202, 1204, 1204, 1206, 1206, 1208, 1208, 1210, 1210, 1212, 1212, 1214, 1214, 1216, 1217, 1217, 1219, 1219, 1221, 1221, 1223, 1223,
				1225, 1225, 1227, 1227, 1229, 1229, 1216, 1232, 1232, 1234, 1234, 1236, 1236, 1238, 1238, 1240, 1240, 1242, 1242, 1244, 1244,
				1246, 1246, 1248, 1248, 1250, 1250, 1252, 1252, 1254, 1254, 1256, 1256, 1258, 1258, 1260, 1260, 1262, 1262, 1264, 1264, 1266,
				1266, 1268, 1268, 1270, 1270, 1272, 1272, 1274, 1274, 1276, 1276, 1278, 1278, 1280, 1280, 1282, 1282, 1284, 1284, 1286, 1286, 1288,
				1288, 1290, 1290, 1292, 1292, 1294, 1294, 1296, 1296, 1298, 1298, 1300, 1300, 1302, 1302, 1304, 1304, 1306, 1306, 1308, 1308, 1310,
				1310, 1312, 1312, 1314, 1314, 1316, 1316, 1318, 1318, 1320, 1320, 1322, 1322, 1324, 1324, 1326, 1326, 1328, 1329, 1330, 1331, 1332,
				1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354,
				1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368, 1369, 1370, 1371, 1372, 1373, 1374, 1375, 1376,
				1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350,
				1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366
			>>).area
		end

	to_title_table_3: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000013F8 .. 0x000013FD.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				5104, 5105, 5106, 5107, 5108, 5109
			>>).area
		end

	to_title_table_4: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001C80 .. 0x00001C88.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				1042, 1044, 1054, 1057, 1058, 1058, 1066, 1122, 42570
			>>).area
		end

	to_title_table_5: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00001D79 .. 0x00001FF3.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42877, 7546, 7547, 7548, 11363, 7550, 7551, 7552, 7553, 7554, 7555, 7556, 7557, 7558, 7559, 7560, 7561, 7562, 7563, 7564, 7565,
				42950, 7567, 7568, 7569, 7570, 7571, 7572, 7573, 7574, 7575, 7576, 7577, 7578, 7579, 7580, 7581, 7582, 7583, 7584, 7585, 7586, 7587,
				7588, 7589, 7590, 7591, 7592, 7593, 7594, 7595, 7596, 7597, 7598, 7599, 7600, 7601, 7602, 7603, 7604, 7605, 7606, 7607, 7608, 7609,
				7610, 7611, 7612, 7613, 7614, 7615, 7616, 7617, 7618, 7619, 7620, 7621, 7622, 7623, 7624, 7625, 7626, 7627, 7628, 7629, 7630, 7631,
				7632, 7633, 7634, 7635, 7636, 7637, 7638, 7639, 7640, 7641, 7642, 7643, 7644, 7645, 7646, 7647, 7648, 7649, 7650, 7651, 7652, 7653,
				7654, 7655, 7656, 7657, 7658, 7659, 7660, 7661, 7662, 7663, 7664, 7665, 7666, 7667, 7668, 7669, 7670, 7671, 7672, 7673, 7674, 7675,
				7676, 7677, 7678, 7679, 7680, 7680, 7682, 7682, 7684, 7684, 7686, 7686, 7688, 7688, 7690, 7690, 7692, 7692, 7694, 7694, 7696, 7696,
				7698, 7698, 7700, 7700, 7702, 7702, 7704, 7704, 7706, 7706, 7708, 7708, 7710, 7710, 7712, 7712, 7714, 7714, 7716, 7716, 7718,
				7718, 7720, 7720, 7722, 7722, 7724, 7724, 7726, 7726, 7728, 7728, 7730, 7730, 7732, 7732, 7734, 7734, 7736, 7736, 7738, 7738, 7740,
				7740, 7742, 7742, 7744, 7744, 7746, 7746, 7748, 7748, 7750, 7750, 7752, 7752, 7754, 7754, 7756, 7756, 7758, 7758, 7760, 7760, 7762,
				7762, 7764, 7764, 7766, 7766, 7768, 7768, 7770, 7770, 7772, 7772, 7774, 7774, 7776, 7776, 7778, 7778, 7780, 7780, 7782, 7782, 7784,
				7784, 7786, 7786, 7788, 7788, 7790, 7790, 7792, 7792, 7794, 7794, 7796, 7796, 7798, 7798, 7800, 7800, 7802, 7802, 7804, 7804, 7806,
				7806, 7808, 7808, 7810, 7810, 7812, 7812, 7814, 7814, 7816, 7816, 7818, 7818, 7820, 7820, 7822, 7822, 7824, 7824, 7826, 7826, 7828,
				7828, 7830, 7831, 7832, 7833, 7834, 7776, 7836, 7837, 7838, 7839, 7840, 7840, 7842, 7842, 7844, 7844, 7846, 7846, 7848, 7848, 7850,
				7850, 7852, 7852, 7854, 7854, 7856, 7856, 7858, 7858, 7860, 7860, 7862, 7862, 7864, 7864, 7866, 7866, 7868, 7868, 7870, 7870, 7872,
				7872, 7874, 7874, 7876, 7876, 7878, 7878, 7880, 7880, 7882, 7882, 7884, 7884, 7886, 7886, 7888, 7888, 7890, 7890, 7892, 7892, 7894,
				7894, 7896, 7896, 7898, 7898, 7900, 7900, 7902, 7902, 7904, 7904, 7906, 7906, 7908, 7908, 7910, 7910, 7912, 7912, 7914, 7914, 7916,
				7916, 7918, 7918, 7920, 7920, 7922, 7922, 7924, 7924, 7926, 7926, 7928, 7928, 7930, 7930, 7932, 7932, 7934, 7934, 7944, 7945, 7946,
				7947, 7948, 7949, 7950, 7951, 7944, 7945, 7946, 7947, 7948, 7949, 7950, 7951, 7960, 7961, 7962, 7963, 7964, 7965, 7958, 7959,
				7960, 7961, 7962, 7963, 7964, 7965, 7966, 7967, 7976, 7977, 7978, 7979, 7980, 7981, 7982, 7983, 7976, 7977, 7978, 7979, 7980, 7981,
				7982, 7983, 7992, 7993, 7994, 7995, 7996, 7997, 7998, 7999, 7992, 7993, 7994, 7995, 7996, 7997, 7998, 7999, 8008, 8009, 8010, 8011,
				8012, 8013, 8006, 8007, 8008, 8009, 8010, 8011, 8012, 8013, 8014, 8015, 8016, 8025, 8018, 8027, 8020, 8029, 8022, 8031, 8024,
				8025, 8026, 8027, 8028, 8029, 8030, 8031, 8040, 8041, 8042, 8043, 8044, 8045, 8046, 8047, 8040, 8041, 8042, 8043, 8044, 8045, 8046,
				8047, 8122, 8123, 8136, 8137, 8138, 8139, 8154, 8155, 8184, 8185, 8170, 8171, 8186, 8187, 8062, 8063, 8072, 8073, 8074, 8075, 8076,
				8077, 8078, 8079, 8072, 8073, 8074, 8075, 8076, 8077, 8078, 8079, 8088, 8089, 8090, 8091, 8092, 8093, 8094, 8095, 8088, 8089,
				8090, 8091, 8092, 8093, 8094, 8095, 8104, 8105, 8106, 8107, 8108, 8109, 8110, 8111, 8104, 8105, 8106, 8107, 8108, 8109, 8110, 8111,
				8120, 8121, 8114, 8124, 8116, 8117, 8118, 8119, 8120, 8121, 8122, 8123, 8124, 8125, 921, 8127, 8128, 8129, 8130, 8140, 8132, 8133,
				8134, 8135, 8136, 8137, 8138, 8139, 8140, 8141, 8142, 8143, 8152, 8153, 8146, 8147, 8148, 8149, 8150, 8151, 8152, 8153, 8154, 8155,
				8156, 8157, 8158, 8159, 8168, 8169, 8162, 8163, 8164, 8172, 8166, 8167, 8168, 8169, 8170, 8171, 8172, 8173, 8174, 8175, 8176, 8177,
				8178, 8188
			>>).area
		end

	to_title_table_6: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000214E .. 0x00002184.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				8498, 8527, 8528, 8529, 8530, 8531, 8532, 8533, 8534, 8535, 8536, 8537, 8538, 8539, 8540, 8541, 8542, 8543, 8544, 8545, 8546,
				8547, 8548, 8549, 8550, 8551, 8552, 8553, 8554, 8555, 8556, 8557, 8558, 8559, 8544, 8545, 8546, 8547, 8548, 8549, 8550, 8551, 8552,
				8553, 8554, 8555, 8556, 8557, 8558, 8559, 8576, 8577, 8578, 8579, 8579
			>>).area
		end

	to_title_table_7: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x000024D0 .. 0x000024E9.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				9398, 9399, 9400, 9401, 9402, 9403, 9404, 9405, 9406, 9407, 9408, 9409, 9410, 9411, 9412, 9413, 9414, 9415, 9416, 9417, 9418,
				9419, 9420, 9421, 9422, 9423
			>>).area
		end

	to_title_table_8: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x00002C30 .. 0x00002D2D.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				11264, 11265, 11266, 11267, 11268, 11269, 11270, 11271, 11272, 11273, 11274, 11275, 11276, 11277, 11278, 11279, 11280, 11281, 11282, 11283, 11284,
				11285, 11286, 11287, 11288, 11289, 11290, 11291, 11292, 11293, 11294, 11295, 11296, 11297, 11298, 11299, 11300, 11301, 11302, 11303, 11304, 11305,
				11306, 11307, 11308, 11309, 11310, 11359, 11360, 11360, 11362, 11363, 11364, 570, 574, 11367, 11367, 11369, 11369, 11371, 11371, 11373, 11374,
				11375, 11376, 11377, 11378, 11378, 11380, 11381, 11381, 11383, 11384, 11385, 11386, 11387, 11388, 11389, 11390, 11391, 11392, 11392, 11394, 11394, 11396,
				11396, 11398, 11398, 11400, 11400, 11402, 11402, 11404, 11404, 11406, 11406, 11408, 11408, 11410, 11410, 11412, 11412, 11414, 11414, 11416, 11416, 11418,
				11418, 11420, 11420, 11422, 11422, 11424, 11424, 11426, 11426, 11428, 11428, 11430, 11430, 11432, 11432, 11434, 11434, 11436, 11436, 11438, 11438, 11440,
				11440, 11442, 11442, 11444, 11444, 11446, 11446, 11448, 11448, 11450, 11450, 11452, 11452, 11454, 11454, 11456, 11456, 11458, 11458, 11460, 11460, 11462,
				11462, 11464, 11464, 11466, 11466, 11468, 11468, 11470, 11470, 11472, 11472, 11474, 11474, 11476, 11476, 11478, 11478, 11480, 11480, 11482, 11482, 11484,
				11484, 11486, 11486, 11488, 11488, 11490, 11490, 11492, 11493, 11494, 11495, 11496, 11497, 11498, 11499, 11499, 11501, 11501, 11503, 11504, 11505, 11506,
				11506, 11508, 11509, 11510, 11511, 11512, 11513, 11514, 11515, 11516, 11517, 11518, 11519, 4256, 4257, 4258, 4259, 4260, 4261, 4262, 4263, 4264,
				4265, 4266, 4267, 4268, 4269, 4270, 4271, 4272, 4273, 4274, 4275, 4276, 4277, 4278, 4279, 4280, 4281, 4282, 4283, 4284, 4285,
				4286, 4287, 4288, 4289, 4290, 4291, 4292, 4293, 11558, 4295, 11560, 11561, 11562, 11563, 11564, 4301
			>>).area
		end

	to_title_table_9: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000A641 .. 0x0000A69B.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42560, 42562, 42562, 42564, 42564, 42566, 42566, 42568, 42568, 42570, 42570, 42572, 42572, 42574, 42574, 42576, 42576, 42578, 42578, 42580, 42580,
				42582, 42582, 42584, 42584, 42586, 42586, 42588, 42588, 42590, 42590, 42592, 42592, 42594, 42594, 42596, 42596, 42598, 42598, 42600, 42600, 42602,
				42602, 42604, 42604, 42606, 42607, 42608, 42609, 42610, 42611, 42612, 42613, 42614, 42615, 42616, 42617, 42618, 42619, 42620, 42621, 42622, 42623, 42624,
				42624, 42626, 42626, 42628, 42628, 42630, 42630, 42632, 42632, 42634, 42634, 42636, 42636, 42638, 42638, 42640, 42640, 42642, 42642, 42644, 42644, 42646,
				42646, 42648, 42648, 42650, 42650
			>>).area
		end

	to_title_table_10: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000A723 .. 0x0000A7F6.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42786, 42788, 42788, 42790, 42790, 42792, 42792, 42794, 42794, 42796, 42796, 42798, 42798, 42800, 42801, 42802, 42802, 42804, 42804, 42806, 42806,
				42808, 42808, 42810, 42810, 42812, 42812, 42814, 42814, 42816, 42816, 42818, 42818, 42820, 42820, 42822, 42822, 42824, 42824, 42826, 42826, 42828,
				42828, 42830, 42830, 42832, 42832, 42834, 42834, 42836, 42836, 42838, 42838, 42840, 42840, 42842, 42842, 42844, 42844, 42846, 42846, 42848, 42848, 42850,
				42850, 42852, 42852, 42854, 42854, 42856, 42856, 42858, 42858, 42860, 42860, 42862, 42862, 42864, 42865, 42866, 42867, 42868, 42869, 42870, 42871, 42872,
				42873, 42873, 42875, 42875, 42877, 42878, 42878, 42880, 42880, 42882, 42882, 42884, 42884, 42886, 42886, 42888, 42889, 42890, 42891, 42891, 42893, 42894,
				42895, 42896, 42896, 42898, 42898, 42948, 42901, 42902, 42902, 42904, 42904, 42906, 42906, 42908, 42908, 42910, 42910, 42912, 42912, 42914, 42914, 42916,
				42916, 42918, 42918, 42920, 42920, 42922, 42923, 42924, 42925, 42926, 42927, 42928, 42929, 42930, 42931, 42932, 42932, 42934, 42934, 42936, 42936, 42938,
				42938, 42940, 42940, 42942, 42942, 42944, 42945, 42946, 42946, 42948, 42949, 42950, 42951, 42951, 42953, 42953, 42955, 42956, 42957, 42958, 42959, 42960,
				42961, 42962, 42963, 42964, 42965, 42966, 42967, 42968, 42969, 42970, 42971, 42972, 42973, 42974, 42975, 42976, 42977, 42978, 42979, 42980, 42981, 42982,
				42983, 42984, 42985, 42986, 42987, 42988, 42989, 42990, 42991, 42992, 42993, 42994, 42995, 42996, 42997, 42997
			>>).area
		end

	to_title_table_11: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000AB53 .. 0x0000ABBF.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				42931, 43860, 43861, 43862, 43863, 43864, 43865, 43866, 43867, 43868, 43869, 43870, 43871, 43872, 43873, 43874, 43875, 43876, 43877, 43878, 43879,
				43880, 43881, 43882, 43883, 43884, 43885, 43886, 43887, 5024, 5025, 5026, 5027, 5028, 5029, 5030, 5031, 5032, 5033, 5034, 5035, 5036, 5037,
				5038, 5039, 5040, 5041, 5042, 5043, 5044, 5045, 5046, 5047, 5048, 5049, 5050, 5051, 5052, 5053, 5054, 5055, 5056, 5057, 5058,
				5059, 5060, 5061, 5062, 5063, 5064, 5065, 5066, 5067, 5068, 5069, 5070, 5071, 5072, 5073, 5074, 5075, 5076, 5077, 5078, 5079,
				5080, 5081, 5082, 5083, 5084, 5085, 5086, 5087, 5088, 5089, 5090, 5091, 5092, 5093, 5094, 5095, 5096, 5097, 5098, 5099, 5100,
				5101, 5102, 5103
			>>).area
		end

	to_title_table_12: SPECIAL [NATURAL_16]
			-- Table for Unicode characters in the range 0x0000FF41 .. 0x0000FF5A.
		once
			Result := ({ARRAY [NATURAL_16]} <<
				65313, 65314, 65315, 65316, 65317, 65318, 65319, 65320, 65321, 65322, 65323, 65324, 65325, 65326, 65327, 65328, 65329, 65330, 65331, 65332, 65333,
				65334, 65335, 65336, 65337, 65338
			>>).area
		end

	to_title_table_13: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010428 .. 0x0001044F.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				66560, 66561, 66562, 66563, 66564, 66565, 66566, 66567, 66568, 66569, 66570, 66571, 66572, 66573, 66574, 66575, 66576, 66577, 66578, 66579, 66580,
				66581, 66582, 66583, 66584, 66585, 66586, 66587, 66588, 66589, 66590, 66591, 66592, 66593, 66594, 66595, 66596, 66597, 66598, 66599
			>>).area
		end

	to_title_table_14: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x000104D8 .. 0x000104FB.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				66736, 66737, 66738, 66739, 66740, 66741, 66742, 66743, 66744, 66745, 66746, 66747, 66748, 66749, 66750, 66751, 66752, 66753, 66754, 66755, 66756,
				66757, 66758, 66759, 66760, 66761, 66762, 66763, 66764, 66765, 66766, 66767, 66768, 66769, 66770, 66771
			>>).area
		end

	to_title_table_15: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00010CC0 .. 0x00010CF2.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				68736, 68737, 68738, 68739, 68740, 68741, 68742, 68743, 68744, 68745, 68746, 68747, 68748, 68749, 68750, 68751, 68752, 68753, 68754, 68755, 68756,
				68757, 68758, 68759, 68760, 68761, 68762, 68763, 68764, 68765, 68766, 68767, 68768, 68769, 68770, 68771, 68772, 68773, 68774, 68775, 68776, 68777,
				68778, 68779, 68780, 68781, 68782, 68783, 68784, 68785, 68786
			>>).area
		end

	to_title_table_16: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x000118C0 .. 0x000118DF.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				71840, 71841, 71842, 71843, 71844, 71845, 71846, 71847, 71848, 71849, 71850, 71851, 71852, 71853, 71854, 71855, 71856, 71857, 71858, 71859, 71860,
				71861, 71862, 71863, 71864, 71865, 71866, 71867, 71868, 71869, 71870, 71871
			>>).area
		end

	to_title_table_17: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x00016E60 .. 0x00016E7F.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				93760, 93761, 93762, 93763, 93764, 93765, 93766, 93767, 93768, 93769, 93770, 93771, 93772, 93773, 93774, 93775, 93776, 93777, 93778, 93779, 93780,
				93781, 93782, 93783, 93784, 93785, 93786, 93787, 93788, 93789, 93790, 93791
			>>).area
		end

	to_title_table_18: SPECIAL [NATURAL_32]
			-- Table for Unicode characters in the range 0x0001E922 .. 0x0001E943.
		once
			Result := ({ARRAY [NATURAL_32]} <<
				125184, 125185, 125186, 125187, 125188, 125189, 125190, 125191, 125192, 125193, 125194, 125195, 125196, 125197, 125198, 125199, 125200, 125201, 125202, 125203, 125204,
				125205, 125206, 125207, 125208, 125209, 125210, 125211, 125212, 125213, 125214, 125215, 125216, 125217
			>>).area
		end

	property_table_1: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000080 .. 0x000002AF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				32, 32, 32, 32, 32, 160, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
				32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 128, 16, 0, 0, 0, 0, 0, 16, 0, 0,
				0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 16, 16, 0, 0, 0, 16, 0, 0, 0, 16,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2,
				1, 2, 2, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 1, 1,
				2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1,
				1, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 2, 0,
				1, 2, 2, 2, 0, 0, 0, 0, 1, 4, 2, 1, 4, 2, 1, 4, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 4, 2, 1, 2, 1, 1, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1,
				1, 2, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
			>>).area
		end

	property_table_2: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000370 .. 0x0000070D.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 2, 1, 2, 0, 0, 1, 2, 0, 0, 0, 2, 2, 2, 16, 1, 0, 0, 0, 0, 0,
				0, 1, 16, 1, 1, 1, 0, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 1, 1, 1, 2, 2, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 2, 2, 2, 2, 1, 2, 0, 1, 2, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 0, 0, 0, 16, 16, 16, 16, 16, 16, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16,
				0, 16, 0, 0, 16, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 16, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 16, 16, 16
			>>).area
		end

	property_table_3: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000007C0 .. 0x0000085E.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 16
			>>).area
		end

	property_table_4: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000964 .. 0x00000970.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16
			>>).area
		end

	property_table_5: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000009E6 .. 0x00000AF0.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 16
			>>).area
		end

	property_table_6: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000B66 .. 0x00000B6F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_7: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000BE6 .. 0x00000BEF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_8: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000C66 .. 0x00000CEF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_9: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000D66 .. 0x00000D6F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_10: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00000DE6 .. 0x000010FF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 0, 0, 0, 0, 16, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16,
				16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0,
				0, 1, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 16, 0, 2, 2, 2
			>>).area
		end

	property_table_11: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00001360 .. 0x00001400.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 16
			>>).area
		end

	property_table_12: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000166E .. 0x00001736.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 16, 16
			>>).area
		end

	property_table_13: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000017D4 .. 0x00001819.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 0, 16, 16, 16, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8,
				8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_14: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00001944 .. 0x0000194F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_15: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000019D0 .. 0x00001AAD.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 0, 16, 16,
				16, 16, 16, 16
			>>).area
		end

	property_table_16: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00001B50 .. 0x00002184.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16,
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1,
				1, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2,
				2, 2, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 1,
				1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1,
				1, 1, 2, 2, 2, 2, 2, 2, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2,
				1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2,
				2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 2, 2,
				2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 0, 2, 2, 1, 1, 1, 1,
				4, 0, 2, 0, 0, 0, 2, 2, 2, 0, 2, 2, 1, 1, 1, 1, 4, 0, 0, 0, 2,
				2, 2, 2, 0, 0, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2,
				2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2, 2, 1, 1, 1,
				1, 4, 0, 0, 0, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 0, 0, 0, 0, 0,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 128, 128, 0, 0, 0, 0, 0, 128, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 128, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 2, 1, 1, 1, 2, 2, 1, 1, 1, 2, 0,
				1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1,
				1, 1, 1, 0, 2, 1, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 2, 2, 1, 1,
				0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 2
			>>).area
		end

	property_table_17: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00002308 .. 0x0000232A.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16
			>>).area
		end

	property_table_18: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00002768 .. 0x000027EF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16
			>>).area
		end

	property_table_19: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00002983 .. 0x000029FD.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16,
				16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16
			>>).area
		end

	property_table_20: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00002C00 .. 0x00002D70.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 1, 2, 1, 1, 1, 2, 2, 1, 2,
				1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 2, 2, 1, 2, 2, 2, 2, 2, 2, 0, 0,
				1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 0, 0, 0,
				0, 0, 0, 1, 2, 1, 2, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 16, 16, 16, 16, 0,
				16, 16, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0,
				0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 16
			>>).area
		end

	property_table_21: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00002E00 .. 0x00002E52.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 16
			>>).area
		end

	property_table_22: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00003000 .. 0x000030FB.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				128, 16, 16, 16, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 16,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16
			>>).area
		end

	property_table_23: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000A4FE .. 0x0000A4FF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16
			>>).area
		end

	property_table_24: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000A60D .. 0x0000A7FA.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0, 0, 0, 16, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 16, 0, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 1,
				2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0, 1, 2, 1, 2,
				0, 1, 2, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
				1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1,
				2, 1, 2, 1, 2, 1, 2, 0, 0, 1, 2, 1, 1, 1, 1, 2, 1, 2, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0,
				2
			>>).area
		end

	property_table_25: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000A874 .. 0x0000AA5F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 16, 16, 16, 0, 16, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 0, 0, 16, 16, 16, 16
			>>).area
		end

	property_table_26: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000AADE .. 0x0000ABF9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0,
				0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 8
			>>).area
		end

	property_table_27: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000FB00 .. 0x0000FB17.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2,
				2, 2, 2
			>>).area
		end

	property_table_28: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000FD3E .. 0x0000FD3F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16
			>>).area
		end

	property_table_29: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000FE10 .. 0x0000FE6B.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 16, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 16, 0,
				0, 0, 0, 16, 0, 16, 16
			>>).area
		end

	property_table_30: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0000FF01 .. 0x0000FF65.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 0, 16, 16, 16, 16, 16, 16, 0, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 16, 16, 0, 0, 0, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 0, 16,
				0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 16, 0, 16, 0, 16, 16, 16, 16, 16, 16, 16
			>>).area
		end

	property_table_31: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010100 .. 0x00010102.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16
			>>).area
		end

	property_table_32: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001039F .. 0x0001056F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16
			>>).area
		end

	property_table_33: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010857 .. 0x00010857.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16
			>>).area
		end

	property_table_34: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001091F .. 0x0001093F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16
			>>).area
		end

	property_table_35: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010A50 .. 0x00010B9C.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				16, 16, 16, 16
			>>).area
		end

	property_table_36: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010C80 .. 0x00010D39.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_37: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010EAD .. 0x00010EAD.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16
			>>).area
		end

	property_table_38: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00010F55 .. 0x00010F59.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16
			>>).area
		end

	property_table_39: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00011047 .. 0x000112F9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 0, 0, 0, 0, 16, 0, 0,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 16, 0, 16, 16, 16, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_40: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001144B .. 0x000114D9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 0, 16, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_41: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000115C1 .. 0x0001173E.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16,
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8,
				8, 8, 0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 16, 16, 16
			>>).area
		end

	property_table_42: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001183B .. 0x00011959.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_43: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x000119E2 .. 0x00011AA2.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 0, 16, 16, 16, 16, 16
			>>).area
		end

	property_table_44: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00011C41 .. 0x00011C71.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 16, 16
			>>).area
		end

	property_table_45: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00011D50 .. 0x00011DA9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8,
				8, 8, 8
			>>).area
		end

	property_table_46: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00011EF7 .. 0x00011EF8.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16
			>>).area
		end

	property_table_47: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00011FFF .. 0x00011FFF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16
			>>).area
		end

	property_table_48: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00012470 .. 0x00012474.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16
			>>).area
		end

	property_table_49: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00016A60 .. 0x00016A6F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 16, 16
			>>).area
		end

	property_table_50: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00016AF5 .. 0x00016B59.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_51: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00016E40 .. 0x00016E9A.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 16, 16, 16, 16
			>>).area
		end

	property_table_52: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x00016FE2 .. 0x00016FE2.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16
			>>).area
		end

	property_table_53: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001BC9F .. 0x0001BC9F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16
			>>).area
		end

	property_table_54: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001D400 .. 0x0001D7FF.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2,
				2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0,
				0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 0, 2, 0, 2,
				2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1,
				1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 0, 1,
				1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
				0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2,
				2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 0, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2,
				2, 2, 2, 1, 2, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_55: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001DA87 .. 0x0001DA8B.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				16, 16, 16, 16, 16
			>>).area
		end

	property_table_56: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001E140 .. 0x0001E149.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_57: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001E2F0 .. 0x0001E2F9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end

	property_table_58: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001E900 .. 0x0001E95F.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8,
				8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 16, 16
			>>).area
		end

	property_table_59: SPECIAL [NATURAL_8]
			-- Table for Unicode characters in the range 0x0001FBF0 .. 0x0001FBF9.
		once
			Result := ({ARRAY [NATURAL_8]} <<
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8
			>>).area
		end


note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
