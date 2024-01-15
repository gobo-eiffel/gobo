note

	description:

		"Skeletons of scanners implemented with compressed tables"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

deferred class YY_COMPRESSED_SCANNER_SKELETON

inherit

	YY_SCANNER_SKELETON
		redefine
			yy_set_content,
			yy_initialize,
			yy_build_tables,
			reset
		end

feature {NONE} -- Initialization

	yy_initialize
			-- Initialize lexical analyzer.
		do
			Precursor
			if yyReject_or_variable_trail_context then
				yy_state_stack := SPECIAL_INTEGER_.make (input_buffer.content.count + 1)
			else
				yy_state_stack := SPECIAL_INTEGER_.make (0)
			end
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input source.
			-- (This routine can be called in `wrap' before scanning
			-- another input buffer.)
		do
			Precursor
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

	read_token
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
			yy_code: NATURAL_32
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
			yy_done: BOOLEAN
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
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
						SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					l_content_area := yy_content_area
					l_unicode_content_area := yy_unicode_content_area
					from
						yy_done := False
					until
						yy_done
					loop
						if not yyReject_or_variable_trail_context and then yy_accept.item (yy_current_state) /= 0 then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						if l_content_area /= Void then
							yy_c := l_content_area.item (yy_cp).code
						else
							if l_unicode_content_area /= Void then
								yy_code := l_unicode_content_area.item (yy_cp).natural_32_code
							else
								yy_code := yy_content.item_code (yy_cp)
							end
							if yy_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code then
								yy_c := yy_code.to_integer_32
							elseif yy_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
									-- Surrogate.
								yy_c := -1
							elseif yy_code > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
									-- Invalid Unicode character.
								yy_c := -1
							else
								yy_c := yy_code.to_integer_32
								yy_c := yy_c - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
							end
							if yy_c > yyMax_symbol_equiv_class then
								yy_c := yyMax_symbol_equiv_class
							end
						end
						if yy_c >= 0 then
							if attached yy_ec as l_yy_ec then
								yy_c := l_yy_ec.item (yy_c)
							end
							from
							until
								yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
							loop
								yy_current_state := yy_def.item (yy_current_state)
								if attached yy_meta as l_yy_meta and then yy_current_state >= yyTemplate_mark then
										-- We've arranged it so that templates are
										-- never chained to one another. This means
										-- we can afford to make a very simple test
										-- to see if we need to convert to `yy_c''s
										-- meta-equivalence class without worrying
										-- about erroneously looking up the meta
										-- equivalence class twice.
									yy_c := l_yy_meta.item (yy_c)
								end
							end
							yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						else
							yy_current_state := yyJam_state
							report_invalid_unicode_character_error (yy_code)
							if last_token = yyUnknown_token then
								last_token := yyInvalid_character_token
							end
						end
						if yyReject_or_variable_trail_context then
							SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
						yy_done := (yy_current_state = yyJam_state)
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
					check
						reject_used: yyReject_or_variable_trail_context
						yy_acclist_not_void: attached yy_acclist as l_yy_acclist
					then
						from
							yy_found := False
						until
							yy_found
						loop
							if yy_lp /= 0 and yy_lp < yy_accept.item (yy_current_state + 1) then
								yy_act := l_yy_acclist.item (yy_lp)
								if yyVariable_trail_context then
									if yy_act < -yyNb_rules or yy_looking_for_trail_begin /= 0 then
										if yy_act = yy_looking_for_trail_begin then
											yy_looking_for_trail_begin := 0
											yy_act := -yy_act - yyNb_rules
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
					end
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
						if yy_end <= input_buffer.count + 1 then
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
							elseif yy_end - yy_start - yy_more_len /= 0 then
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
			debug ("GELEX")
				print_last_token
			end
		end

feature -- Element change

	reject
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

	yy_nxt: SPECIAL [INTEGER]
			-- States to enter upon reading symbol

	yy_chk: SPECIAL [INTEGER]
			-- Check value to see if `yy_nxt' applies

	yy_base: SPECIAL [INTEGER]
			-- Offsets into `yy_nxt' for given states

	yy_def: SPECIAL [INTEGER]
			-- Where to go if `yy_chk' disallow `yy_nxt' entry

	yy_ec: detachable SPECIAL [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_meta: detachable SPECIAL [INTEGER]
			-- Meta equivalence classes which are sets of classes
			-- with identical transitions out of templates;
			-- Void if meta equivalence classes are not used

	yy_accept: SPECIAL [INTEGER]
			-- Accepting ids indexed by state ids

	yy_acclist: detachable SPECIAL [INTEGER]
			-- Accepting id list, used when `reject' is called
			-- or when there is a variable length trailing context;
			-- Void otherwise

feature {NONE} -- Implementation

	yy_set_content (a_content: like yy_content)
			-- Set `yy_content' to `a_content'.
		local
			nb: INTEGER
		do
			yy_content := a_content
			yy_content_area := a_content.as_special
			yy_unicode_content_area := a_content.as_unicode_special
			if yyReject_or_variable_trail_context then
				nb := a_content.count + 1
				if yy_state_stack.capacity < nb then
					yy_state_stack := SPECIAL_INTEGER_.aliased_resized_area (yy_state_stack, nb)
				end
			end
		end

	yy_build_tables
			-- Build scanner tables.
		deferred
		ensure then
			yy_nxt_not_void: yy_nxt /= Void
			yy_chk_not_void: yy_chk /= Void
			yy_base_not_void: yy_base /= Void
			yy_def_not_void: yy_def /= Void
			yy_accept_not_void: yy_accept /= Void
		end

	yy_previous_state: INTEGER
			-- State just before EOB character was reached
		local
			yy_cp, yy_nb: INTEGER
			yy_c: INTEGER
			yy_code: NATURAL_32
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
		do
				-- Find the start state.
			Result := yy_start_state + yy_at_beginning_of_line
			if input_buffer.beginning_of_line then
				Result := yy_start_state + 1
			else
				Result := yy_start_state
			end
			if yyReject_or_variable_trail_context then
					-- Set up for storing up states.
				SPECIAL_INTEGER_.force (yy_state_stack, Result, 0)
				yy_state_count := 1
			end
			l_content_area := yy_content_area
			l_unicode_content_area := yy_unicode_content_area
			from
				yy_cp := yy_start + yy_more_len
				yy_nb := yy_end
			until
				yy_cp >= yy_nb
			loop
					-- Find the next state.
				if l_content_area /= Void then
					yy_c := l_content_area.item (yy_cp).code
				else
					if l_unicode_content_area /= Void then
						yy_code := l_unicode_content_area.item (yy_cp).natural_32_code
					else
						yy_code := yy_content.item_code (yy_cp)
					end
					if yy_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code then
						yy_c := yy_code.to_integer_32
					else
						yy_c := yy_code.to_integer_32
						yy_c := yy_c - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
					end
					if yy_c > yyMax_symbol_equiv_class then
						yy_c := yyMax_symbol_equiv_class
					end
				end
				if yy_c = 0 then
					yy_c := yyNull_equiv_class
				elseif attached yy_ec as l_yy_ec then
					yy_c := l_yy_ec.item (yy_c)
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
				from
				until
					yy_chk.item (yy_base.item (Result) + yy_c) = Result
				loop
					Result := yy_def.item (Result)
					if attached yy_meta as l_yy_meta and then Result >= yyTemplate_mark then
							-- We've arranged it so that templates are
							-- never chained to one another. This means
							-- we can afford to make a very simple test
							-- to see if we need to convert to `yy_c''s
							-- meta-equivalence class without worrying
							-- about erroneously looking up the meta
							-- equivalence class twice.
						yy_c := l_yy_meta.item (yy_c)
					end
				end
				Result := yy_nxt.item (yy_base.item (Result) + yy_c)
				if yyReject_or_variable_trail_context then
					SPECIAL_INTEGER_.force (yy_state_stack, Result, yy_state_count)
					yy_state_count := yy_state_count + 1
				end
				yy_cp := yy_cp + 1
			end
		end

	yy_null_trans_state (yy_current_state: INTEGER): INTEGER
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
			from
			until
				yy_chk.item (yy_base.item (Result) + yy_c) = Result
			loop
				Result := yy_def.item (Result)
				if attached yy_meta as l_yy_meta and then Result >= yyTemplate_mark then
						-- We've arranged it so that templates are never
						-- chained to one another. This means we can
						-- afford to make a very simple test to see if
						-- we need to convert to `yy_c''s meta-equivalence
						-- class without worrying about erroneously
						-- looking up the meta-equivalence class twice.
					yy_c := l_yy_meta.item (yy_c)
				end
			end
			Result := yy_nxt.item (yy_base.item (Result) + yy_c)
			if yyReject_or_variable_trail_context then
				SPECIAL_INTEGER_.force (yy_state_stack, Result, yy_state_count)
				yy_state_count := yy_state_count + 1
			end
			yy_is_jam := (Result = yyJam_state)
			if yy_is_jam then
				Result := 0
			end
		end

	yy_rejected: BOOLEAN
			-- Has current matched token been rejected?

	yy_state_stack: SPECIAL [INTEGER]
			-- State buffer variable

	yy_state_count: INTEGER
			-- State buffer variable

	yy_full_match: INTEGER
			-- State buffer variable

	yy_lp: INTEGER
			-- State buffer variable

	yy_looking_for_trail_begin: INTEGER
			-- State buffer variable

	yy_full_lp: INTEGER
			-- State buffer variable

	yy_full_state: INTEGER
			-- State buffer variable

feature {NONE} -- Constants

	yyJam_base: INTEGER
			-- Position in `yy_nxt'/`yy_chk' tables where
			-- default jam table starts
		deferred
		end

	yyJam_state: INTEGER
			-- State id corresponding to jam state
		deferred
		end

	yyTemplate_mark: INTEGER
			-- Mark between normal state and templates
		deferred
		end

	yyReject_used: BOOLEAN
			-- Is `reject' called?
		deferred
		end

	yyVariable_trail_context: BOOLEAN
			-- Is there a regular expression with both leading
			-- and trailing parts having variable length?
		deferred
		end

	yyReject_or_variable_trail_context: BOOLEAN
			-- Is `reject' called or is there a regular expression with
			-- both leading and trailing parts having variable length?
		deferred
		ensure
			definition: Result = (yyReject_used or yyVariable_trail_context)
		end

	yyBacking_up: BOOLEAN = True
			-- Compressed tables always back up

	yyNb_rules: INTEGER
			-- Number of rules
		deferred
		end

	yyNext_token: INTEGER = 1

	yyMatch: INTEGER = 2

	yyFind_action: INTEGER = 3

	yyDo_action: INTEGER = 4

	yyFind_rule: INTEGER = 5

invariant

	yy_nxt_not_void: yy_nxt /= Void
	yy_chk_not_void: yy_chk /= Void
	yy_base_not_void: yy_base /= Void
	yy_def_not_void: yy_def /= Void
	yy_accept_not_void: yy_accept /= Void
	yy_state_stack_not_void: yyReject_or_variable_trail_context implies yy_state_stack /= Void

end
