indexing

	description:

		"Regular expressions implemented with DFA engines"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_DFA_REGULAR_EXPRESSION

inherit

	LX_REGULAR_EXPRESSION

creation

	compile

feature -- Element change

	compile (a_regexp: STRING; i: BOOLEAN) is
			-- Compile `a_regexp'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		local
			a_parser: LX_REGEXP_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: UT_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
			a_string: STRING
			nb: INTEGER
		do
			!! an_error_handler.make_null
			!! a_description.make
			a_description.set_equiv_classes_used (False)
			a_description.set_meta_equiv_classes_used (False)
			a_description.set_full_table (True)
			a_description.set_case_insensitive (i)
			!! a_parser.make_from_description (a_description, an_error_handler)
			a_string := clone (a_regexp)
			nb := a_string.count
			if nb > 0 and then a_string.item (1) = '^' then
				has_caret := True
				a_string.tail (nb - 1)
				nb := nb - 1
			else
				has_caret := False
			end
			if nb > 0 and then a_string.item (nb) = '$' then
				has_dollar := True
				a_string.head (nb - 1)
			else
				has_dollar := False
			end
			a_parser.parse_string (a_string)
			if a_parser.successful then
				!! a_dfa.make (a_description)
				a_full_tables := a_dfa
				yy_nxt := a_full_tables.yy_nxt
				yy_accept := a_full_tables.yy_accept
				yyNb_rows := a_full_tables.yyNb_rows
			else
				yy_nxt := Void
				yy_accept := Void
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
			-- Does `a_string' include a token of the language
			-- described by current regular expression?
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			if has_caret then
				if has_dollar then
					Result := longest_end_position (a_string, 1) = nb
				else
					Result := smallest_end_position (a_string, 1) /= -1
				end
			else
				if has_dollar then
					from
						i := 1
					until
						Result or i > nb
					loop
						Result := longest_end_position (a_string, i) = nb
						i := i + 1
					end
				else
					from
						i := 1
					until
						Result or i > nb
					loop
						Result := smallest_end_position (a_string, i) /= -1
						i := i + 1
					end
				end
			end
		end

	recognizes (a_string: STRING): BOOLEAN is
			-- Is `a_string' a token of the language
			-- described by current regular expression?
		do
			Result := longest_end_position (a_string, 1) = a_string.count
		end

feature -- Access

	matched_position (a_string: STRING): DS_PAIR [INTEGER, INTEGER] is
			-- Position of the longest-leftmost token matched
			-- by current regular expression in `a_string'
		local
			i, nb: INTEGER
			e: INTEGER
		do
			nb := a_string.count
			if has_caret then
				e := longest_end_position (a_string, 1)
				if has_dollar then
					if e = nb then
						!! Result.make (1, e)
					end
				else
					if e /= -1 then
						!! Result.make (1, e)
					end
				end
			else
				if has_dollar then
					from
						i := 1
					until
						Result /= Void or i > nb
					loop
						e := longest_end_position (a_string, i)
						if e = nb then
							!! Result.make (i, e)
						else
							i := i + 1
						end
					end
				else
					from
						i := 1
					until
						Result /= Void or i > nb
					loop
						e := longest_end_position (a_string, i)
						if e /= -1 then
							!! Result.make (i, e)
						else
							i := i + 1
						end
					end
				end
			end
		end

feature {NONE} -- Matching

	smallest_end_position (a_string: STRING; start_pos: INTEGER): INTEGER is
			-- Position of the last character of the longest
			-- token in `a_string' starting at position `start_pos'
			-- and matched by current regular expression;
			-- -1 if no such token exists
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
			valid_start_pos: start_pos >= 1 and start_pos <= a_string.count + 1
		local
			i, nb: INTEGER
			a_state: INTEGER
			a_symbol: INTEGER
		do
			from
				i := start_pos
				nb := a_string.count
				a_state := 1
				if yy_accept.item (a_state) /= 0 then
					Result := i - 1
				else
					Result := -1
				end
			until
				Result /= -1 or i > nb
			loop
				a_symbol := a_string.item (i).code
				a_state := yy_nxt.item (a_state * yyNb_rows + a_symbol)
				if a_state > 0 then
					if yy_accept.item (a_state) /= 0 then
						Result := i
					else
						i := i + 1
					end
				else
					i := nb + 1
				end
			end
		ensure
			valid_position: Result /= -1 implies
				(start_pos <= Result + 1 and Result <= a_string.count)
		end

	longest_end_position (a_string: STRING; start_pos: INTEGER): INTEGER is
			-- Position of the last character of the longest
			-- token in `a_string' starting at position `start_pos'
			-- and matched by current regular expression;
			-- -1 if no such token exists
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
			valid_start_pos: start_pos >= 1 and start_pos <= a_string.count + 1
		local
			i, nb: INTEGER
			a_state: INTEGER
			a_symbol: INTEGER
		do
			from
				i := start_pos
				nb := a_string.count
				a_state := 1
				if yy_accept.item (a_state) /= 0 then
					Result := i - 1  
				else
					Result := -1
				end
			until
				i > nb
			loop
				a_symbol := a_string.item (i).code
				a_state := yy_nxt.item (a_state * yyNb_rows + a_symbol)
				if a_state > 0 then
					if yy_accept.item (a_state) /= 0 then
						Result := i
					end
					i := i + 1
				else
					i := nb + 1
				end
			end
		ensure
			valid_position: Result /= -1 implies
				(start_pos <= Result + 1 and Result <= a_string.count)
		end

feature {NONE} -- Engine Data

	has_caret: BOOLEAN
			-- Does current regular expression start with '^'?
			-- ('^' matches at start of string as a whole.)

	has_dollar: BOOLEAN
			-- Does current regular expression end with '$'?
			-- ('$' matches at end of string as a whole.)

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

	yyNb_rows: INTEGER
			-- Number of rows in `yy_nxt'

end -- class LX_DFA_REGULAR_EXPRESSION
