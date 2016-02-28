note

	description:

		"A brief PCRE how-to in a runnable example and regexp-testing"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PCRE

inherit

	ANY -- Needed for SE 2.1.

	KL_SHARED_STANDARD_FILES

create

	make

feature {NONE} -- Initialization

	make
			-- Execute example.
		do
			some_simple_matches
			localization
		end

feature -- Examples

	some_simple_matches
			-- Some simple examples.
		local
			regexp: RX_PCRE_REGULAR_EXPRESSION
			columns: ARRAY [STRING]
			res: STRING
			i, nb: INTEGER
		do
				-- Create the regular expression.
			create regexp.make

				-- Compile a pattern: look for character pairs (note: there are two subexpressions).
			regexp.compile ("((.)\2)")
			check
					-- We know, we compiled a valid regexp.
				is_compiled: regexp.is_compiled
			end
				-- Match on a subject.
			regexp.match ("hello eiffelians")
				-- In this example the query of `has_matched' is not needed
				-- if you query the `match_count' for a value greater zero
				-- ('not has_matched = (match_count = 0)').
			check
					-- We know there is one.
				has_matched: regexp.has_matched
					-- Two subexpressions.
				match_count: regexp.match_count = 3
			end
				-- Analyze the first match.
			res := regexp.captured_substring (1)
			check
				double_l: res.is_equal ("ll")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
			res := regexp.captured_substring (2)
			check
				single_l: res.is_equal ("l")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Put the captured substring between parentheses.
			res := regexp.replace ("(\1\)")
			check
				done: res.is_equal ("he(ll)o eiffelians")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Try to find a next match.
			regexp.next_match
			check
					-- We know there is one.
				has_matched2: regexp.has_matched
					-- Two subexpressions.
				match_count2: regexp.match_count = 3
			end
				-- Analyze the next hit.
			res := regexp.captured_substring (1)
			check
				double_f: res.is_equal ("ff")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Put the captured substring between brakets.
			res := regexp.replace ("[\1\]")
			check
				done2: res.is_equal ("hello ei[ff]elians")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Back to the beginning.
			regexp.first_match
			check
					-- We know there is one.
				has_matched3: regexp.has_matched
					-- Two subexpressions.
				match_count3: regexp.match_count = 3
			end
				-- Put an hyphen between double letters.
			res := regexp.replace_all ("\2\-\2\")
			check
				done3: res.is_equal ("hel-lo eif-felians")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Now we compile a new pattern: the same as \t.
			regexp.compile ("%T")
			check
					-- We know, we compiled a valid regexp.
				is_compiled2: regexp.is_compiled
			end
				-- Match on a subject.
			regexp.match ("this%Tis%Ta%Ttab%Tseparated%Tline%Twith%Tan%Tempty%T%Tcolumn")
			check
					-- We know there is one.
				has_matched4: regexp.has_matched
					-- No subexpessions.
				match_count4: regexp.match_count = 1
			end
			columns := regexp.split
			check
				eleven_columns: columns.count = 11
			end
			i := columns.lower
			nb := columns.upper
			from until i > nb loop
				std.output.put_line (columns.item (i))
				i := i + 1
			end
			std.output.put_line ("----------------")
		end

	localization
			-- Example with localization.
		local
			case_mapping: RX_CASE_MAPPING
			word_set: RX_CHARACTER_SET
			regexp: RX_PCRE_REGULAR_EXPRESSION
			res: STRING
		do
				-- German umlaute added.
			create word_set.make ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_ÄÖÜäöü")
			create regexp.make
				-- Compile a pattern: match a word.
			regexp.compile ("\w+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched1: res.is_equal ("Erdbr")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Now we change the word character set.
			regexp.reset
			regexp.set_word_set (word_set)
				-- Compile a pattern: match a word.
			regexp.compile ("\w+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched2: res.is_equal ("Erdbrügger")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Reset the word_set.
			regexp.reset
			regexp.set_word_set (regexp.default_word_set)
				-- The same query in caseless mode:
				-- the (?i) in the pattern is the same as the statements:
				--     regexp.reset -- not needed after regexp.make
				--     regexp.set_caseless (True)
			regexp.compile ("(?i)[A-ZÄÖÜ]+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched3: res.is_equal ("Erdbr")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- The only way to reset the caseless mode except the routine
				-- regexp.set_default_options.
			regexp.reset
			regexp.set_caseless (False)
				-- A new pattern.
			regexp.compile ("[A-ZÄÖÜ]+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched4: res.is_equal ("E")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- German umlaute added for case insensitivity.
			create case_mapping.make ("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ", "abcdefghijklmnopqrstuvwxyzäöü")
				-- Changing the character case mapping need
				-- a reset (not is_compiled).
			regexp.reset
			regexp.set_character_case_mapping (case_mapping)
			regexp.compile ("[A-ZÄÖÜ]+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched5: res.is_equal ("E")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- Now we use the caseless-mode.
			regexp.compile ("(?i)[A-ZÄÖÜ]+")
			check
				is_caseless: regexp.is_caseless
			end
			regexp.match ("Erdbrügger - my Name")
			res := regexp.captured_substring (0)
			check
				matched6: res.is_equal ("Erdbrügger")
			end
			std.output.put_line (res)
			std.output.put_line ("----------------")
				-- If you want to make all regular expressions localized change the
				-- `default_character_case_mapping' and/or `default_word_set'.
			regexp.default_character_case_mapping.clear
			regexp.default_character_case_mapping.add ("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ", "abcdefghijklmnopqrstuvwxyzäöü")
			word_set := regexp.default_word_set
			word_set.wipe_out
			word_set.add_string ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_ÄÖÜäöü")
				-- After these instructions all new created regular expressions uses
				-- the `character_case_mapping' and `word_set' of the changed default values
				-- defined above. Only a explicit setting of `regexp.set_character_case_mapping'
				-- and/or `regexp.set_word_set' can change this behavior.
		end

end
