indexing

	description:

		"Pattern matchers implemented with DFA engines"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_DFA_PATTERN_MATCHER

inherit

	LX_PATTERN_MATCHER

feature -- Status report

	compiled: BOOLEAN is
			-- Has pattern been sucessfully compiled?
		do
			Result := yy_nxt /= Void
		end

	matches (a_string: STRING): BOOLEAN is
			-- Does `a_string' include a token of the language
			-- described by current pattern?
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				if smallest_end_position (a_string, i) /= -1 then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	recognizes (a_string: STRING): BOOLEAN is
			-- Is `a_string' a token of the language
			-- described by current pattern?
		do
			Result := (longest_end_position (a_string, 1) = a_string.count)
		end

feature -- Access

	matched_position (a_string: STRING): DS_PAIR [INTEGER, INTEGER] is
			-- Position of the longest-leftmost token matched
			-- by current pattern in `a_string'
		local
			i, nb: INTEGER
			e: INTEGER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				e := longest_end_position (a_string, i)
				if e /= -1 then
					!! Result.make (i, e)
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Matching

	smallest_end_position (a_string: STRING; start_pos: INTEGER): INTEGER is
			-- Position of the last character of the smallest
			-- token in `a_string' starting at position `start_pos'
			-- and matched by current pattern;
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
			-- and matched by current pattern;
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

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

	yyNb_rows: INTEGER
			-- Number of rows in `yy_nxt'

end -- class LX_DFA_PATTERN_MATCHER
