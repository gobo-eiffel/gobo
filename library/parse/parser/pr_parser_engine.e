indexing

	description:

		"Parser engines to be plugged to parser skeletons"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_PARSER_ENGINE

feature -- Tables

	yytranslate: ARRAY [INTEGER]
			-- Mapping between lex token numbers and
			-- yacc internal token numbers

	yyr1: ARRAY [INTEGER]
			-- Symbol number of symbol that each rule derives
			-- (i.e. left-hand-side of the rule), indexed by
			-- rule id

	yyr2: ARRAY [INTEGER]
			-- Number of symbols in the right-hand-side
			-- of each rule, indexed by rule id

	yydefact: ARRAY [INTEGER]
			-- Default rule to reduce in each state,
			-- when `yytable' doesn't specify something
			-- else to do. 0 means the default is an
			-- error. Indexed by state id

	yydefgoto: ARRAY [INTEGER]
			-- Default state to go to after a reduction
			-- of a rule that generates a variable,
			-- except when `yytable' specifies something
			-- else to do. Indexed by variable id - nb_tokens

	yypact: ARRAY [INTEGER]
			-- Index in `yytable' of the portion describing
			-- a state, indexed by state id. The lookahead
			-- token's type is used to index that portion
			-- to find out what to do. If the value in `yytable'
			-- is positive, we shift the token and go to that
			-- state. If the value is negative, it is minus
			-- a rule number to reduce by. If the value is
			-- zero, the default action from `yydefact' for
			-- that state is used.

	yypgoto: ARRAY [INTEGER]
			-- Index in `yytable' of the portion describing
			-- what to do after reducing a rule that derives
			-- a variable, indexed by variable id - nb_tokens.
			-- This portion is indexed by the parser state
			-- number `s' as of before the text for this 
			-- nonterminal was read. The value from `yytable'
			-- is the state to go to if the corresponding
			-- value in `yycheck' is `s'.

	yytable: ARRAY [INTEGER]
			-- Filled with portions for different uses, found
			-- via `yypact' and `yypgoto'

	yycheck: ARRAY [INTEGER]
			-- Array indexed in parallel with `yytable'. It
			-- indicates, in a roundabout way, the bounds of
			-- the portion you are tryng to examine. Suppose
			-- that the portion of `yytable' starts at index
			-- `p' and the index to be examined within the 
			-- portion is `i'. Then if `yycheck.item (p+i)/=i',
			-- `i' is outside the bounds of what is actually
			-- allocated, and the default (from `yydefact'
			-- or `yydefgoto') should be used. Otherwise,
			-- `yytable.item (p+i)' should be used.

feature -- Constants

	yyFinal: INTEGER
			-- Termination state id

	yyFlag: INTEGER
			-- Most negative INTEGER

	yyNtbase: INTEGER
			-- Number of tokens

	yyLast: INTEGER
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER
			-- Number of symbols
			-- (terminal and nonterminal)

invariant

	yytranslate_not_void: yytranslate /= Void
	yytranslate_lower: yytranslate.lower = 0
	yytranslate_upper: yytranslate.upper = yyMax_token
	yyr1_not_void: yyr1 /= Void
	yyr1_lower: yyr1.lower = 0
	yyr2_not_void: yyr2 /= Void
	yyr2_lower: yyr2.lower = 0
	yydefact_not_void: yydefact /= Void
	yydefact_lower: yydefact.lower = 0
	yydefgoto_not_void: yydefgoto /= Void
	yydefgoto_lower: yydefgoto.lower = 0
	yypact_not_void: yypact /= Void
	yypact_lower: yypact.lower = 0
	yypgoto_not_void: yypgoto /= Void
	yypgoto_lower: yypgoto.lower = 0
	yytable_not_void: yytable /= Void
	yytable_lower: yytable.lower = 0
	yytable_upper: yytable.upper = yyLast
	yycheck_not_void: yycheck /= Void
	yycheck_lower: yycheck.lower = 0
	yycheck_upper: yycheck.upper = yyLast

end -- class PR_PARSER_ENGINE
