indexing

	description:

		"Skeletons of interactive scanners implemented with compressed tables";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class YY_INTERACTIVE_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		redefine
			read_token
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
		do
			from
				last_token := -1
				yy_goto := yyNext_token
			until
				last_token /= -1
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := text_count
						yy_more_flag := False
					else
						yy_more_len := 0
					end
					yy_cp := yy_position
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
					yy_current_state := yy_start_state + yy_at_beginning_of_line
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						yy_state_count := 1
						yy_state_stack.put (yy_current_state, 1)
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
							yy_chk.item (yy_base.item (yy_current_state) + yy_c)
								= yy_current_state
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
						yy_current_state :=
							yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_count := yy_state_count + 1
							yy_state_stack.put
								(yy_current_state, yy_state_count)
						end
						yy_cp := yy_cp + 1
					until
						yy_base.item (yy_current_state) = yyJam_base
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
							yy_chk.item (yy_base.item (yy_current_state) + yy_c)
								= yy_current_state
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
						yy_current_state :=
							yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_count := yy_state_count + 1
							yy_state_stack.put
								(yy_current_state, yy_state_count)
						end
						yy_cp := yy_cp + 1
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
							-- Do the garanteed-needed backing up
							-- to figure out the match.
						if yy_act = 0 then
								-- Have to back up.
							yy_cp := yy_last_accepting_cpos
							yy_current_state := yy_last_accepting_state
							yy_act := yy_accept.item (yy_current_state)
						end
						yy_goto := yyDo_action
					else
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_state_count := yy_state_count - 1
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
									yy_act > yyTrailing_head_mark or
									yy_looking_for_trail_begin /= 0
								then
									if yy_act = yy_looking_for_trail_begin then
										yy_looking_for_trail_begin := 0
										yy_act := yy_act - yyTrailing_head_mark
										yy_found := True
									else
										yy_lp := yy_lp + 1
									end
								elseif yy_act > yyTrailing_mark then
									yy_looking_for_trail_begin := yy_act -
										yyTrailing_mark + yyTrailing_head_mark
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
							yy_current_state :=
								yy_state_stack.item (yy_state_count)
							yy_state_count := yy_state_count - 1
							yy_lp := yy_accept.item (yy_current_state)
						end
					end
					yy_goto := yyDo_action
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start_position := yy_bp
					yy_position := yy_cp
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
				fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_position' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_position' will already have been 
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the 
							-- end-of-buffer state). Contrast this with the
							-- test in `yyinput'.
						if yy_position <= input_buffer.count + 1 then
								-- This was really a NULL character.
							yy_position := yy_bp + yy_matched_count
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
								yy_cp := yy_position + 1
								yy_position := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
									-- Still need to initialize `yy_cp',
									-- though `yy_current_state' was set
									-- up by `yy_previous_state'.
								yy_cp := yy_position
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_position := yy_position - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_position
								yy_bp := yy_start_position + yy_more_len
								yy_goto := yyMatch
							elseif
								yy_position - yy_start_position
									- yy_more_len /= 0
							then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_position
								yy_bp := yy_start_position + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched, 
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start_position
									yy_cp := yy_position
									yy_execute_eof_action
										((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state :=
									yy_state_stack.item (yy_state_count)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
		rescue
			fatal_error ("fatal scanner internal error")
		end

end -- class YY_INTERACTIVE_SCANNER_SKELETON
