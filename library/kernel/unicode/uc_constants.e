indexing

   description:
   
   "Unicode Constants (General Categories, ...)";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_CONSTANTS

feature -- Categories

   gc_no_category: INTEGER is 0
	 -- No Category given

   gc_mark_nonspacing: INTEGER is 1
	 -- Category Mn

   gc_mark_space_combining: INTEGER is 2
	 -- Category Mc

   gc_mark_enclosing: INTEGER is 3
	 -- Catgeory Me

   gc_number_decimal_digit: INTEGER is 4
	 -- Category Nd

   gc_number_letter: INTEGER is 5
	 -- Category Nl

   gc_number_other: INTEGER is 6
	 -- Category No

   gc_separator_space: INTEGER is 7
	 -- Category Zs

   gc_separator_line: INTEGER is 8
	 -- Category Zl

   gc_separator_paragraph: INTEGER is 9
	 -- Category Zp

   gc_other_control: INTEGER is 10
	 -- Category Cc

   gc_other_format: INTEGER is 11
	 -- Category Cf

   gc_other_surrogate: INTEGER is 12
	 -- Category Cs

   gc_other_private_use: INTEGER is 13
	 -- Category Co

   gc_other_not_assigned: INTEGER is 14
	 -- Category Cn

   gc_letter_uppercase: INTEGER is 15
	 -- Category Lu

   gc_letter_lowercase: INTEGER is 16
	 -- Category Ll

   gc_letter_titlecase: INTEGER is 17
	 -- Category Lt

   gc_letter_modifier: INTEGER is 18
	 -- informative Category Lm

   gc_letter_other: INTEGER is 19
	 -- informative Category Lo

   gc_punctuation_connector: INTEGER is 20
	 -- informative Category Pc

   gc_punctuation_dash: INTEGER is 21
	 -- informative Category Pd

   gc_punctuation_open: INTEGER is 22
	 -- informative Category Ps

   gc_punctuation_close: INTEGER is 23
	 -- informative Category Pe

   gc_punctuation_initial_quote: INTEGER is 24
	 -- informative Category Pi

   gc_punctuation_final_quote: INTEGER is 25
	 -- informative Category Pf

   gc_punctuation_other: INTEGER is 26
	 -- informative Category Po

   gc_symbol_math: INTEGER is 27
	 -- informative category Sm

   gc_symbol_currency: INTEGER is 28
	 -- informative category Sc

   gc_symbol_modifier: INTEGER is 29
	 -- informative category Sk

   gc_symbol_other: INTEGER is 30
	 -- informative category So

feature -- BiDI

   bidi_left_to_right: INTEGER is 1
	 -- BiDi Category

   bidi_left_to_right_embedding: INTEGER is 2
	 -- BiDi Category

   bidi_left_to_right_override: INTEGER is 3
	 -- BiDi Category

   bidi_right_to_left: INTEGER is 4 
	 -- BiDi Category

   bidi_right_to_left_arabic: INTEGER is 5
	 -- BiDi Category

   bidi_right_to_left_embedding: INTEGER is 6
	 -- BiDi Category

   bidi_right_to_left_override: INTEGER is 7
	 -- BiDi Category

   bidi_pop_directional_format: INTEGER is 8
	 -- BiDi Category

   bidi_european_number: INTEGER is 9
	 -- BiDi Category

   bidi_european_number_separator: INTEGER is 10
	 -- BiDi Category

   bidi_european_number_terminator: INTEGER is 11
	 -- BiDi Category

   bidi_arabic_number: INTEGER is 12
	 -- BiDi Category

   bidi_common_number_separator: INTEGER is 13
	 -- BiDi Category

   bidi_non_spacing_mark: INTEGER is 14
	 -- BiDi Category

   bidi_boundary_neutral: INTEGER is 15
	 -- BiDi Category

   bidi_paragraph_separator: INTEGER is 16
	 -- BiDi Category

   bidi_segment_separator: INTEGER is 17
	 -- BiDi Category

   bidi_whitespace: INTEGER is 18
	 -- BiDi Category

   bidi_other_neutrals: INTEGER is 19
	 -- BiDi Category

   bidi_no_information: INTEGER is -1
	 -- BiDi Category

end -- class UC_CONSTANTS
