indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library:		"Gobo Eiffel Regexp Library"
	author:		"Harald Erdbrügger <he@he-me.de>"
	copyright:	"Copyright (c) 2002, Harald Erdbrügger and others"
	license:		"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:			"$Date$"
	revision:	"$Revision$"


class

	RX_CHARACTER_TABLES


inherit

	KL_INTEGER_ROUTINES


feature
	-- each compiler and matcher run uses these character sets to
	-- classify a character type. make your own changes to these sets
	-- if you would localize your compiler.  have in mind that changes
	-- will be shared by all compilers, so the changes made manipulates
	-- the behaviour of all following compiler runs of all compiler!

	default_char_casing: RX_CASING_MAPS is
		once
			create Result.make("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")
		end

	default_word_set: RX_CHARACTER_SET is
		once
			create Result.make("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_")
		end

	word_set: RX_CHARACTER_SET
			-- active word set


feature {NONE}

	class_names: ARRAY [STRING] is
			-- Tables of names of POSIX character classes. The first
			-- three must be alpha, upper, lower, as this is assumed for
			-- handling case independence.
		once
			Result :=
				<<	"alpha", "lower", "upper",
						"alnum", "ascii", "cntrl", "digit", "graph",
						"print", "punct", "space", "word", "xdigit">>
		end


	class_sets: ARRAY [RX_CHARACTER_SET] is
			-- Must correspond to the list class_names obove
		require
			word_set_is_set: word_set /= Void
		once
			Result :=
				<<	alpha_set, lower_set, upper_set, alnum_set, ascii_set, cntrl_set,
						digit_set, graph_set, print_set, punct_set, space_set, word_set, xdigit_set>>
		end


feature {NONE}

	upper_set: RX_CHARACTER_SET is
		once
			create Result.make("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
		end

	lower_set: RX_CHARACTER_SET is
		once
			create Result.make("abcdefghijklmnopqrstuvwxyz")
		end

	alpha_set: RX_CHARACTER_SET is
		once
			create Result.make_empty
			Result.add_set (lower_set, False)
			Result.add_set (upper_set, False)
		end

	digit_set: RX_CHARACTER_SET is
		once
			create Result.make("0123456789")
		end

	alnum_set: RX_CHARACTER_SET is
		once
			create Result.make_empty
			Result.add_set (alpha_set, False)
			Result.add_set (digit_set, False)
		end

	xdigit_set: RX_CHARACTER_SET is
		once
			create Result.make("0123456789abcdefABCDEF")
		end

	cntrl_set: RX_CHARACTER_SET is
		local
			i: INTEGER
		once
			create Result.make_empty
			from
				i := 0
			until
				i = 32
			loop
				Result.add_character (to_character (i))
				i := i + 1
			end
		end

	graph_set: RX_CHARACTER_SET is
		once
			create Result.make("!%"#$%%&%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~")
		end

	print_set: RX_CHARACTER_SET is
		once
			create Result.make(" !%"#$%%&%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~")
		end

	punct_set: RX_CHARACTER_SET is
		once
			create Result.make("!%"#$%%&%'()*+,-./:;<=>?@[\]^_`{|}~")
		end

	ascii_set: RX_CHARACTER_SET is
		once
			create Result.make_full
		end

	space_set: RX_CHARACTER_SET is
		once
			create Result.make("%T%N%F%R ")
		end

	meta_set: RX_CHARACTER_SET is
		once
			create Result.make("*+?{^.$|()[")
		end


end -- class RX_CHARACTER_TABLES
