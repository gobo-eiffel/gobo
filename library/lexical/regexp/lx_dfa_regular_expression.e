indexing

	description:

		"Regular expressions implemented with DFA engines";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_FULL_DFA_REGULAR_EXPRESSION

inherit

	LX_REGULAR_EXPRESSION

creation

	compile

feature -- Element change

	compile (a_regexp: STRING) is
			-- Compile `a_regexp'. Set `compiled' to True
			-- after successful compilation.
		local
			a_parser: LX_REGEXP_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: GELEX_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
		do
			!! an_error_handler.make
			!! a_description.make
			a_description.set_equiv_classes_used (False)
			a_description.set_meta_equiv_classes_used (False)
			a_description.set_full_table (True)
			!! a_parser.make_from_description (a_description, an_error_handler)
			a_parser.parse_string (a_regexp)
			if an_error_handler.syntax_error then
				yy_nxt := Void
				yy_accept := Void
			else
				!! a_dfa.make (a_description)
				a_full_tables := a_dfa
				yy_nxt := a_full_tables.yy_nxt
				yy_accept := a_full_tables.yy_accept
				yyNb_rows := a_full_tables.yyNb_rows
			end
		end

feature -- Status report

	compiled: BOOLEAN is
			-- Has current regular expression
			-- been sucessfully compiled?
		do
			Result := yy_nxt /= Void
		end

	matches (a_string: STRING): BOOLEAN is
			-- Does current regular expression match `a_string'?
		local
			i, j, nb: INTEGER
			a_state: INTEGER
			a_symbol: INTEGER
		do
			from
				nb := a_string.count
				from
					j := 1
					a_state := 2
					Result := yy_accept.item (a_state) /= 0
				until
					Result or j > nb
				loop
					a_symbol := a_string.item (j).code
					a_state := yy_nxt.item (a_state * yyNb_rows + a_symbol)
					if a_state > 0 then
						Result := yy_accept.item (a_state) /= 0
						j := j + 1
					else
						j := nb + 1
					end
				end
				i := 2
			until
				Result or i > nb
			loop
				from
					j := i
					if j = 1 or else a_string.item (j - 1) = '%N' then
						a_state := 2
					else
						a_state := 1
					end
					Result := yy_accept.item (a_state) /= 0
				until
					Result or j > nb
				loop
					a_symbol := a_string.item (j).code
					a_state := yy_nxt.item (a_state * yyNb_rows + a_symbol)
					if a_state > 0 then
						Result := yy_accept.item (a_state) /= 0
						j := j + 1
					else
						j := nb + 1
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

	yyNb_rows: INTEGER
			-- Number of rows in `yy_nxt'

end -- class LX_FULL_DFA_REGULAR_EXPRESSION
