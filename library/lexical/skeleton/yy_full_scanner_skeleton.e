indexing

	description:

		"Skeletons of scanners implemented with full tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_FULL_SCANNER_SKELETON

inherit

	YY_SCANNER_SKELETON
		redefine
			yy_build_tables
		end

feature -- Scanning

	read_token is
			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		local
			yy_cp, yy_bp: INTEGER
			yy_current_state: INTEGER
			yy_next_state: INTEGER
			yy_matched_count: INTEGER
			yy_act: INTEGER
			yy_goto: INTEGER
			yy_c: INTEGER
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast scanning routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				last_token := yyUnknown_token
				yy_goto := yyNext_token
			until
				last_token /= yyUnknown_token
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := yy_end - yy_start
						yy_more_flag := False
					else
						yy_more_len := 0
						line := yy_line
						column := yy_column
						position := yy_position
					end
					yy_cp := yy_end
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
					yy_current_state := yy_start_state + yy_at_beginning_of_line
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					from
						if yy_ec /= Void then
							yy_c := yy_ec.item (yy_content.item (yy_cp).code)
						else
							yy_c := yy_content.item (yy_cp).code
						end
						yy_current_state := yy_nxt.item
							(yy_current_state * yyNb_rows + yy_c)
					until
						yy_current_state <= 0
					loop
						if
							yyBacking_up and then
							yy_accept.item (yy_current_state) /= 0
						then
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						yy_cp := yy_cp + 1
						if yy_ec /= Void then
							yy_c := yy_ec.item (yy_content.item (yy_cp).code)
						else
							yy_c := yy_content.item (yy_cp).code
						end
						yy_current_state := yy_nxt.item
							(yy_current_state * yyNb_rows + yy_c)
					end
					yy_current_state := - yy_current_state
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					yy_act := yy_accept.item (yy_current_state)
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
						if yyBacking_up then
								-- Must back up.
							yy_cp := yy_last_accepting_cpos + 1
							yy_bp := yy_bp + yy_more_len
							yy_current_state := yy_last_accepting_state
							yy_goto := yyFind_action
						else
							last_token := yyError_token
							fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_end' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_end' will already have been 
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the 
							-- end-of-buffer state). Contrast this with the
							-- test in `read_character'.
						if yy_end <= input_buffer.upper + 1 then
								-- This was really a NULL character.
							yy_end := yy_bp + yy_matched_count
							yy_current_state := yy_previous_state
								-- We're now positioned to make the NULL
								-- transition. We couldn't have
								-- `yy_previous_state' go ahead and do it
								-- for us because it doesn't know how to deal
								-- with the possibility of jamming (and we
								-- don't want to build jamming into it because
								-- then it will run more slowly).
							yy_next_state :=
								yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								yy_cp := yy_end
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_end := yy_end - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyMatch
							elseif
								yy_end - yy_start - yy_more_len /= 0
							then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched, 
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start
									yy_cp := yy_end
									yy_execute_eof_action
										((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
					end
				end
			end
		end

feature {NONE} -- Tables

	yy_nxt: like FIXED_INTEGER_ARRAY_TYPE
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_ec: like FIXED_INTEGER_ARRAY_TYPE
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_accept: like FIXED_INTEGER_ARRAY_TYPE
			-- Accepting ids indexed by state ids

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		deferred
		ensure then
			yy_nxt_not_void: yy_nxt /= Void
			yy_accept_not_void: yy_accept /= Void
		end

	yy_previous_state: INTEGER is
			-- State just before EOB character was reached
		local
			yy_cp, yy_nb: INTEGER
			yy_c: INTEGER
		do
				-- Find the start state.
			Result := yy_start_state + yy_at_beginning_of_line
			from
				yy_cp := yy_start + yy_more_len
				yy_nb := yy_end
			until
				yy_cp >= yy_nb
			loop
					-- Find the next state.
				yy_c := yy_content.item (yy_cp).code
				if yy_c = 0 then
					yy_c := yyNull_equiv_class
				elseif yy_ec /= Void then
					yy_c := yy_ec.item (yy_c)
				end
				Result := yy_nxt.item (Result * yyNb_rows + yy_c)
				if yyBacking_up and then yy_accept.item (Result) /= 0 then
					yy_last_accepting_state := Result
					yy_last_accepting_cpos := yy_cp
				end
				yy_cp := yy_cp + 1
			end
		end

	yy_null_trans_state (yy_current_state: INTEGER): INTEGER is
			-- State reachable from `yy_current_state' through
			-- a transition on NULL character; 0 if jammed
		local
			yy_c: INTEGER
			yy_is_jam: BOOLEAN
		do
			Result := yy_nxt.item
				(yy_current_state * yyNb_rows + yyNull_equiv_class)
			yy_is_jam := (Result <= 0)
			if yy_is_jam then
				Result := 0
			elseif yyBacking_up and then yy_accept.item (Result) /= 0 then
				yy_last_accepting_state := Result
				yy_last_accepting_cpos := yy_end
			end
		end

feature {NONE} -- Constants

	yyNb_rows: INTEGER is deferred end
			-- Number of rows in `yy_nxt'

	yyNext_token: INTEGER is Unique
	yyMatch: INTEGER is Unique
	yyFind_action: INTEGER is Unique
	yyDo_action: INTEGER is Unique
	yyFind_rule: INTEGER is Unique

invariant

	yy_nxt_not_void: yy_nxt /= Void
	yy_accept_not_void: yy_accept /= Void

end -- class YY_FULL_SCANNER_SKELETON
