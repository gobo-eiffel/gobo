class

	RX_EXAMPLE
		-- a brief how-to in a runable example and regexp-testing
		-- this example should run without exceptions
		-- compile with assertions check enabled

creation
	make


feature

	make is
		do
			some_simple_matches
			localization
		end

	some_simple_matches is
		local
			regexp: RX_STRING
			columns: ARRAY [STRING]
			res: STRING
			i: INTEGER
		do
			-- create the regular expression
			create regexp.make

			-- assign a pattern
			regexp.compile ("((.)\2)") -- look for character pairs (note: we have two subexpressions)
				check
					regexp.is_compiled
				end -- we know, we compiled a valid regexp

			-- match on a subject
			regexp.match ("hello eiffelians")

			-- in this example the query of has_matched is not needed if you
			-- query the match_count for a value greater zero
			-- not has_matched = (match_count = 0)
				check
					regexp.has_matched -- we know there is one
					regexp.match_count = 3 -- because of the two subexpressions
				end

			-- analyse the first match
			res := regexp.matched_portion(1)
				check
					res.is_equal ("ll")
				end
			print (res);print("%N----------------%N")

			res := regexp.matched_portion(2)
				check
					res.is_equal ("l")
				end

			print (res);print("%N----------------%N")

			res := regexp.replace("(\1\)") -- put the matched portion between brakets
				check
					res.is_equal ("he(ll)o eiffelians")
				end
			print (res);print("%N----------------%N")

			regexp.next_match -- try to find a next match
				check
					regexp.has_matched  -- we know there is one
					regexp.match_count = 3 -- because of the two subexpressions
				end

			-- analyse the next hit
			res := regexp.matched_portion(1)
				check
					res.is_equal ("ff")
				end
			print (res);print("%N----------------%N")

			res := regexp.replace("[\1\]") -- put the matched portion between brakets
				check
					res.is_equal ("hello ei[ff]elians")
				end
			print (res);print("%N----------------%N")

			regexp.first_match -- back to the beginning
				check
					regexp.has_matched -- we know there is one
					regexp.match_count = 3 -- because of the two subexpressions
				end

			res := regexp.replace_all("\2\-\2\")
				check
					res.is_equal ("hel-lo eif-felians")
				end
			print (res);print("%N----------------%N")

			-- now we assign a new pattern
			regexp.compile ("%T") -- the same as \t
				check
					regexp.is_compiled -- we know, we compiled a valid regexp
				end

			-- match on a subject
			regexp.match ("this%Tis%Ta%Ttab%Tseparated%Tline%Twith%Tan%Tempty%T%Tcolumn")
				check
					regexp.has_matched -- we know there is one
					regexp.match_count = 1	-- no subexpessions
				end

			columns := regexp.split
				check
					columns.count = 11
				end

			from i := columns.lower until i > columns.upper loop
				print (columns.item(i));print("%N")
				i := i + 1
			end
			print ("----------------%N")
		end

	localization is
		local
			char_casing: RX_CASING_MAPS
			word_set: RX_CHARACTER_SET
			regexp: RX_STRING
			res: STRING
		do
			-- german umlaute added
			create word_set.make("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_ÄÖÜäöü")
			create regexp.make
			regexp.compile ("\w+") -- match a word
			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("Erdbr")
				end
			print (res);print("%N----------------%N")

			-- now we change the word character set
			regexp.reset
			regexp.set_word_set (word_set)
			regexp.compile ("\w+") -- match a word
			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("Erdbrügger")
				end
			print (res);print("%N----------------%N")

			-- reset the word_set
			regexp.reset
			regexp.set_word_set (regexp.default_word_set)

			-- the same query in caseless mode
			-- the (?i) in the pattern is the same as the statements
			-- regexp.reset -- not needed after regexp.make
			-- regexp.set_caseless(True)
			regexp.compile ("(?i)[A-ZÄÖÜ]+")

			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("Erdbr")
				end
			print (res);print("%N----------------%N")

			-- the only way to reset the caseless mode except the routine
			-- regexp.set_default_options
			regexp.reset
			regexp.set_caseless (False)
			-- a new pattern
			regexp.compile ("[A-ZÄÖÜ]+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("E")
				end
			print (res);print("%N----------------%N")

			-- german umlaute added for case insensitivity
			create char_casing.make("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ", "abcdefghijklmnopqrstuvwxyzäöü")
			-- changing the character casing need a reset (not is_compiled)
			regexp.reset
			regexp.set_char_casing (char_casing)
			regexp.compile ("[A-ZÄÖÜ]+")
			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("E")
				end
			print (res)
			print("%N----------------%N")

			-- now we use the caseless-mode
			regexp.compile ("(?i)[A-ZÄÖÜ]+")
				check
					regexp.is_caseless
				end
			regexp.match ("Erdbrügger - my Name")
			res := regexp.matched_portion(0)
				check
					res.is_equal ("Erdbrügger")
				end
			print (res)
			print("%N----------------%N")

			-- if you want to make all regular expressions localized
			-- change the default_char_casing and/or default_word_set
			regexp.default_char_casing.make ("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ", "abcdefghijklmnopqrstuvwxyzäöü")
			regexp.default_word_set.clear
			regexp.default_word_set.add_string ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_ÄÖÜäöü")
			-- after this instructions all new created regular expressions
			-- uses the char_casing and word_set of the changed default values
			-- defined above. only a explizit setting of regexp.set_char_casing
			-- and / or regexp.set_word_set can change this behavior.
		end


end
