-- Special array for lalr1_parser tables.
-- Index into array has lower bound of 0.

indexing
	author: "Andreas Auras"

class PARSER_ARRAY inherit

	ARRAY [INTEGER]
		rename
			make_from_array as a_make_from_array
		export
			{NONE} a_make_from_array
		end

	ARRAY [INTEGER]
		redefine
			make_from_array
		select
			make_from_array
		end

creation

	make_from_array

feature

	make_from_array (a: ARRAY [INTEGER]) is
			-- Initialize from the items of `a'
			-- set lower bound to 0
		do
			a_make_from_array(a)
			upper := upper - lower
			lower := 0
		end
end -- PARSER_ARRAY

--|-------------------------------------------------------------------
--| ibyacc V1.0    : A yacc parser generator for Eiffel
--|
--| Copyright (C) 1995-1996 Halstenbach ACT GmbH
--| Breidenbrucherstr 2
--| D - 51674 Wiehl
--| Tel +49 2261 99020      Fax +49 2261 990299
--| Customer support e-mail <support@halstenbach.de>
--| All rights reserved. Duplication and distribution prohibited.
--|-------------------------------------------------------------------
