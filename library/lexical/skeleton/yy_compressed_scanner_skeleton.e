indexing

	description:

		"Skeletons of scanners implemented with compressed tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_COMPRESSED_SCANNER_SKELETON

inherit

	YY_SCANNER_SKELETON
		redefine
			yy_set_content, yy_initialize,
			yy_build_tables, reset
		end

feature {NONE} -- Initialization

	yy_initialize is
			-- Initialize lexical analyzer.
		do
			yy_build_tables
			yy_start_state := 1
			yy_line := 1
			yy_column := 1
			yy_position := 1
			line := 1
			column := 1
			position := 1
			if yyReject_or_variable_trail_context then
				yy_state_stack := FIXED_INTEGER_ARRAY_.make (input_buffer.content.count + 1)
			end
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input source.
			-- (This routine can be called in `wrap' before scanning
			-- another input buffer.)
		do
			yy_start_state := 1
			yy_line := 1
			yy_column := 1
			yy_position := 1
			line := 1
			column := 1
			position := 1
			yy_more_flag := False
			yy_more_len := 0
				-- Backing-up information.
			yy_last_accepting_state := 0
			yy_last_accepting_cpos := 0
				-- Reject information.
			yy_rejected := False
			yy_state_count := 0
			yy_full_match := 0
			yy_lp := 0
			yy_looking_for_trail_begin := 0
			yy_full_lp := 0
			yy_full_state := 0
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
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
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
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						yy_state_stack.put (yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					from
						if yy_ec /= Void then
							yy_c := yy_ec.item (yy_content.item (yy_cp).code)
						else
							yy_c := yy_content.item (yy_cp).code
						end
						if
							not yyReject_or_variable_trail_context and then
							yy_accept.item (yy_current_state) /= 0
						then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if
								yy_meta /= Void and then
								yy_current_state >= yyTemplate_mark
							then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_stack.put (yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
					until
						yy_current_state = yyJam_state
					loop
						if yy_ec /= Void then
							yy_c := yy_ec.item (yy_content.item (yy_cp).code)
						else
							yy_c := yy_content.item (yy_cp).code
						end
						if
							not yyReject_or_variable_trail_context and then
							yy_accept.item (yy_current_state) /= 0
						then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if
								yy_meta /= Void and then
								yy_current_state >= yyTemplate_mark
							then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_stack.put (yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
					end
					if not yyReject_or_variable_trail_context then
							-- Do the guaranteed-needed backing up
							-- to find out the match.
						yy_cp := yy_last_accepting_cpos
						yy_current_state := yy_last_accepting_state
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
						yy_goto := yyDo_action
					else
						yy_state_count := yy_state_count - 1
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_lp := yy_accept.item (yy_current_state)
						yy_goto := yyFind_rule
					end
				when yyFind_rule then
						-- We branch here when backing up.
					check reject_used: yyReject_or_variable_trail_context end
					from yy_found := False until yy_found loop
						if
							yy_lp /= 0 and
							yy_lp < yy_accept.item (yy_current_state + 1)
						then
							yy_act := yy_acclist.item (yy_lp)
							if yyVariable_trail_context then
								if
									yy_act < - yyNb_rules or
									yy_looking_for_trail_begin /= 0
								then
									if yy_act = yy_looking_for_trail_begin then
										yy_looking_for_trail_begin := 0
										yy_act := - yy_act - yyNb_rules
										yy_found := True
									else
										yy_lp := yy_lp + 1
									end
								elseif yy_act < 0 then
									yy_looking_for_trail_begin := yy_act - yyNb_rules
									if yyReject_used then
											-- Remember matched text in case
											-- we back up due to `reject'.
										yy_full_match := yy_cp
										yy_full_state := yy_state_count
										yy_full_lp := yy_lp
									end
									yy_lp := yy_lp + 1
								else
									yy_full_match := yy_cp
									yy_full_state := yy_state_count
									yy_full_lp := yy_lp
									yy_found := True
								end
							else
								yy_full_match := yy_cp
								yy_found := True
							end
						else
							yy_cp := yy_cp - 1
							yy_state_count := yy_state_count - 1
							yy_current_state := yy_state_stack.item (yy_state_count)
							yy_lp := yy_accept.item (yy_current_state)
						end
					end
					yy_rejected_line := yy_line
					yy_rejected_column := yy_column
					yy_rejected_position := yy_position
					yy_goto := yyDo_action
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
							-- Must back up.
						if not yyReject_or_variable_trail_context then
								-- Backing-up info for compressed tables is
								-- taken after `yy_cp' has been incremented
								-- for the next state.
							yy_cp := yy_last_accepting_cpos
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
							yy_next_state := yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								if yyReject_or_variable_trail_context then
										-- Still need to initialize `yy_cp',
										-- though `yy_current_state' was set
										-- up by `yy_previous_state'.
									yy_cp := yy_end
										-- Remove the state which was inserted
										-- in `yy_state_stack' by the call to
										-- `yy_null_trans_state'.
									yy_state_count := yy_state_count - 1
								else
										-- Do the guaranteed-needed backing up
										-- then figure out the match.
									yy_cp := yy_last_accepting_cpos
									yy_current_state := yy_last_accepting_state
								end
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
									yy_execute_eof_action ((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
							yy_line := yy_rejected_line
							yy_column := yy_rejected_column
							yy_position := yy_rejected_position
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state := yy_state_stack.item (yy_state_count - 1)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
		end

feature -- Element change

	reject is
			-- Direct scanner to proceed on the second best rule
			-- which matched the input (when '%option reject'
			-- has been specified).
		do
			if yyReject_used then
				yy_rejected := True
			else
				last_token := yyError_token
				fatal_error ("fatal scanner reject error")
			end
		end

feature {NONE} -- Tables

	yy_nxt: like FIXED_INTEGER_ARRAY_TYPE
			-- States to enter upon reading symbol

	yy_chk: like FIXED_INTEGER_ARRAY_TYPE
			-- Check value to see if `yy_nxt' applies

	yy_base: like FIXED_INTEGER_ARRAY_TYPE
			-- Offsets into `yy_nxt' for given states

	yy_def: like FIXED_INTEGER_ARRAY_TYPE
			-- Where to go if `yy_chk' disallow `yy_nxt' entry

	yy_ec: like FIXED_INTEGER_ARRAY_TYPE
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_meta: like FIXED_INTEGER_ARRAY_TYPE
			-- Meta equivalence classes which are sets of classes
			-- with identical transitions out of templates;
			-- Void if meta equivalence classes are not used

	yy_accept: like FIXED_INTEGER_ARRAY_TYPE
			-- Accepting ids indexed by state ids

	yy_acclist: like FIXED_INTEGER_ARRAY_TYPE
			-- Accepting id list, used when `reject' is called
			-- or when there is a variable length trailing context;
			-- Void otherwise

feature {NONE} -- Implementation

	yy_set_content (a_content: like yy_content) is
			-- Set `yy_content' to `a_content'.
		local
			nb: INTEGER
		do
			yy_content := a_content
			if yyReject_or_variable_trail_context then
				nb := a_content.count + 1
				if yy_state_stack.count < nb then
					yy_state_stack := FIXED_INTEGER_ARRAY_.resize (yy_state_stack, nb)
				end
			end
		end

	yy_build_tables is
			-- Build scanner tables.
		deferred
		ensure then
			yy_nxt_not_void: yy_nxt /= Void
			yy_chk_not_void: yy_chk /= Void
			yy_base_not_void: yy_base /= Void
			yy_def_not_void: yy_def /= Void
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
			if yyReject_or_variable_trail_context then
					-- Set up for storing up states.
				yy_state_stack.put (Result, 0)
				yy_state_count := 1
			end
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
				if not yyReject_or_variable_trail_context then
						-- Save the backing-up info before computing the 
						-- next state because we always compute one more
						-- state than needed - we always proceed until
						-- we reach a jam state.
					if yy_accept.item (Result) /= 0 then
						yy_last_accepting_state := Result
						yy_last_accepting_cpos := yy_cp
					end
				end
				from until
					yy_chk.item (yy_base.item (Result) + yy_c) = Result
				loop
					Result := yy_def.item (Result)
					if
						yy_meta /= Void and then
						Result >= yyTemplate_mark
					then
							-- We've arranged it so that templates are
							-- never chained to one another. This means
							-- we can afford to make a very simple test
							-- to see if we need to convert to `yy_c''s
							-- meta-equivalence class without worrying
							-- about erroneously looking up the meta
							-- equivalence class twice.
						yy_c := yy_meta.item (yy_c)
					end
				end
				Result := yy_nxt.item (yy_base.item (Result) + yy_c)
				if yyReject_or_variable_trail_context then
					yy_state_stack.put (Result, yy_state_count)
					yy_state_count := yy_state_count + 1
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
			if not yyReject_or_variable_trail_context then
					-- Save the backing-up info before computing the next
					-- state because we always compute one more state than
					-- needed - we always proceed until we reach
					-- a jam state.
				if yy_accept.item (yy_current_state) /= 0 then
					yy_last_accepting_state := yy_current_state
					yy_last_accepting_cpos := yy_end
				end
			end
			Result := yy_current_state
			yy_c := yyNull_equiv_class
			from until
				yy_chk.item (yy_base.item (Result) + yy_c) = Result
			loop
				Result := yy_def.item (Result)
				if
					yy_meta /= Void and then
					Result >= yyTemplate_mark
				then
						-- We've arranged it so that templates are never
						-- chained to one another. This means we can
						-- afford to make a very simple test to see if
						-- we need to convert to `yy_c''s meta-equivalence
						-- class without worrying about erroneously
						-- looking up the meta-equivalence class twice.
					yy_c := yy_meta.item (yy_c)
				end
			end
			Result := yy_nxt.item (yy_base.item (Result) + yy_c)
			if yyReject_or_variable_trail_context then
				yy_state_stack.put (Result, yy_state_count)
				yy_state_count := yy_state_count + 1
			end
			yy_is_jam := (Result = yyJam_state)
			if yy_is_jam then
				Result := 0
			end
		end

	yy_rejected: BOOLEAN
			-- Has current matched token been rejected?

	yy_state_stack: like FIXED_INTEGER_ARRAY_TYPE
	yy_state_count: INTEGER
	yy_full_match: INTEGER
	yy_lp: INTEGER
	yy_looking_for_trail_begin: INTEGER
	yy_full_lp: INTEGER
	yy_full_state: INTEGER
			-- State buffer variables

feature {NONE} -- Constants

	yyJam_base: INTEGER is deferred end
			-- Position in `yy_nxt'/`yy_chk' tables where
			-- default jam table starts

	yyJam_state: INTEGER is deferred end
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is deferred end
			-- Mark between normal state and templates

	yyReject_used: BOOLEAN is deferred end
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is deferred end
			-- Is there a regular expression with both leading
			-- and trailing parts having variable length?

	yyReject_or_variable_trail_context: BOOLEAN is
			-- Is `reject' called or is there a regular expression with
			-- both leading and trailing parts having variable length?
		deferred
		ensure
			definition: Result = (yyReject_used or yyVariable_trail_context)
		end

	yyBacking_up: BOOLEAN is True
			-- Compressed tables always back up

	yyNb_rules: INTEGER is deferred end
			-- Number of rules

	yyNext_token: INTEGER is Unique
	yyMatch: INTEGER is Unique
	yyFind_action: INTEGER is Unique
	yyDo_action: INTEGER is Unique
	yyFind_rule: INTEGER is Unique

invariant

	yy_nxt_not_void: yy_nxt /= Void
	yy_chk_not_void: yy_chk /= Void
	yy_base_not_void: yy_base /= Void
	yy_def_not_void: yy_def /= Void
	yy_accept_not_void: yy_accept /= Void
	yy_state_stack_not_void: yyReject_or_variable_trail_context implies yy_state_stack /= Void

end -- class YY_COMPRESSED_SCANNER_SKELETON
