indexing

	description:

		"Finite State Machine states"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_STATE

inherit

	HASHABLE

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_symbol: like accessing_symbol) is
			-- Create a new FSM state.
		require
			valid_id: an_id >= 0
			a_symbol_not_void: a_symbol /= Void
		do
			id := an_id
			accessing_symbol := a_symbol
			!! positions.make_equal (Initial_max_nb_positions)
			!! shifts.make (Initial_max_nb_shifts)
			!! reductions.make (Initial_max_nb_reductions)
			!! errors.make (Initial_max_nb_errors)
		ensure
			id_set: id = an_id
			accessing_symbol_set: accessing_symbol = a_symbol
		end

feature -- Access

	id: INTEGER
			-- Identification number
			-- (States are indexed from 0.)

	accessing_symbol: PR_SYMBOL
			-- Last symbol accepted before
			-- reaching current state

	positions: DS_ARRAYED_LIST [PR_POSITION]
			-- Positions in some rules where the
			-- parsing could continue when the
			-- machine is in current state
 
	shifts: DS_ARRAYED_LIST [PR_STATE]
			-- Shift transitions (push the lookahead
			-- token and read another); the symbol
			-- used for a transition is held in the
			-- target state (i.e. `accessing_symbol')

	reductions: DS_ARRAYED_LIST [PR_REDUCTION]
			-- Reduction transitions (combine the
			-- last n things on the stack via a
			-- rule, replace them with the symbol
			-- that the rule derives, and leave
			-- the lookahead token alone)

	errors: DS_ARRAYED_LIST [PR_TOKEN]
			-- Tokens that should explicitly be errors in
			-- current state (for implementing %nonassoc)
			-- (This list can be void if no error tokens
			-- have been recorded.)

	shift (a_symbol: PR_SYMBOL): PR_STATE is
			-- State reached from current state through
			-- the shift transition `a_symbol'
		require
			a_symbol_not_void: a_symbol /= Void
			has_shift: has_shift (a_symbol)
		local
			i: INTEGER
		do
			i := shifts.count
			from until i < 1 loop
				if shifts.item (i).accessing_symbol = a_symbol then
					Result := shifts.item (i)
					i := 0 -- Jump out of the loop.
				else
					i := i - 1
				end
			end
		ensure
			shift_not_void: Result /= Void
			has_shift: shifts.has (Result)
			accessing_symbol: Result.accessing_symbol = a_symbol
		end

	hash_code: INTEGER
			-- Hash value

feature -- Status report

	has_shift (a_symbol: PR_SYMBOL): BOOLEAN is
			-- Is there a shift transition `a_symbol'
			-- from current state?
		require
			a_symbol_not_void: a_symbol /= Void
		local
			i: INTEGER
		do
			i := shifts.count
			from until i < 1 loop
				if shifts.item (i).accessing_symbol = a_symbol then
					Result := True
					i := 0 -- Jump out of the loop.
				else
					i := i - 1
				end
			end
		end

	lookahead_needed: BOOLEAN
			-- Is a lookahead needed to decide what
			-- to do in current state?

	has_conflict: BOOLEAN
			-- Is there some shift/reduce conflict which
			-- couldn't be resolved by `resolve_conflicts'
			-- using precedence?

feature -- Comparison

	same_state (other: like Current): BOOLEAN is
			-- Are current state and `other' considered equal?
			-- (Do not redefine `is_equal' here because of the
			-- extra preconditions.)
		require
			other_not_void: other /= Void
			positions_sorted: positions_sorted
			other_positions_sorted: other.positions_sorted
		local
			i: INTEGER
			other_positions: like positions
		do
			if
				same_type (other) and then
				hash_code = other.hash_code and
				positions.count = other.positions.count
			then
				Result := True
				other_positions := other.positions
				i := positions.count
				from until i < 1 loop
					if not positions.item (i).same_position (other_positions.item (i)) then
						Result := False
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

feature -- Status setting

	set_lookahead_needed is
			-- Find out whether a lookahead token is needed
			-- and set `lookahead_needed' accordingly.
		local
			i: INTEGER
		do
			lookahead_needed := False
			if not reductions.is_empty then
				if reductions.count > 1 then
						-- There are at least two reductions.
					lookahead_needed := True
				elseif not shifts.is_empty then
						-- There is at least one reduction and
						-- one shift using a terminal symbol.
					i := shifts.count
					from until i < 1 loop
						if shifts.item (i).accessing_symbol.is_terminal then
							lookahead_needed := True
							i := 0 -- Jump out of the loop.
						else
							i := i - 1
						end
					end
				end
			end
			if not lookahead_needed then
					-- Try to find out if there is one shift
					-- transition using the "error" token.
					-- (The "error" token has symbol id 1.)
				i := shifts.count
				from until i < 1 loop
					if shifts.item (i).accessing_symbol.id = 1 then
						lookahead_needed := True
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

feature -- Element change

	put_position (a_position: PR_POSITION) is
			-- Add `a_position' to `positions'.
		require
			a_position_not_void: a_position /= Void
		do
			if not positions.has (a_position) then
				if positions.is_full then
					positions.resize (positions.count + Max_nb_positions_increment)
				end
				positions.put_last (a_position)
				hash_code := hash_code + a_position.index
			end
		ensure
			position_added: positions.has (a_position)
		end

	put_transition (a_transition: PR_TRANSITION; a_rule: PR_RULE) is
			-- Add `a_transition' to the list of transitions
			-- leading to reduction of `a_rule' in current
			-- state.
		require
			lookahead_needed: lookahead_needed
			a_transition_not_void: a_transition /= Void
			a_rule_not_void: a_rule /= Void
		local
			i: INTEGER
			a_reduction: PR_REDUCTION
		do
			i := reductions.count
			from until i < 1 loop
				a_reduction := reductions.item (i)
				if a_reduction.rule = a_rule then
					a_reduction.put_transition (a_transition)
					i := 0 -- Jump out of the loop.
				else
					i := i - 1
				end
			end
		end

feature -- Setting

	set_id (an_id: INTEGER) is
			-- Set `id' to `an_id'.
		require
			valid_id: an_id >= 0
		do
			id := an_id
		ensure
			id_set: id = an_id
		end

feature -- Conflicts

	resolve_conflicts (verbose: BOOLEAN; a_file: like OUTPUT_STREAM_TYPE) is
			-- Try to any resolve shift/reduce conflicts
			-- using precedence levels. Set `has_conflict'
			-- to true if a conflict could not be resolved.
			-- Report any conflicts to `a_file'.
		require
			lookahead_needed: lookahead_needed
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			lookaheads: DS_ARRAYED_LIST [PR_TOKEN]
			rule_prec, token_prec: INTEGER
			a_reduction: PR_REDUCTION
			a_token: PR_TOKEN
			i, j, nb: INTEGER
			a_rule: PR_RULE
		do
			i := shifts.count
			!! tokens.make (i)
			from until i < 1 loop
				a_token ?= shifts.item (i).accessing_symbol
				if a_token /= Void then
					tokens.put_last (a_token)
				end
				i := i - 1
			end
				-- Loop over all reductions which require lookahead
				-- in current state. First check for shift/reduce
				-- conflicts and try to resolve them using precedence.
			nb := reductions.count
			from i := 1 until i > nb loop
				a_reduction := reductions.item (i)
				a_rule := a_reduction.rule
				if a_rule.has_precedence then
					rule_prec := a_rule.precedence
					lookaheads := a_reduction.lookaheads
					j := tokens.count
					from until j < 1 loop
						a_token := tokens.item (j)
						if a_token.has_precedence then
							if lookaheads.has (a_token) then
									-- There is a shift/reduce conflict.
								token_prec := a_token.precedence
								if token_prec < rule_prec then
										-- Keep only the reduction.
									tokens.remove (j)
									report_resolution (verbose, a_rule, a_token, "reduce", a_file)
								elseif rule_prec < token_prec then
										-- Keep only the shift.
									lookaheads.delete (a_token)
									report_resolution (verbose, a_rule, a_token, "shift", a_file)
								elseif a_token.is_right_associative then
										-- Keep only the reduction.
									tokens.remove (j)
									report_resolution (verbose, a_rule, a_token, "reduce", a_file)
								elseif a_token.is_left_associative then
										-- Keep only the shift.
									lookaheads.delete (a_token)
									report_resolution (verbose, a_rule, a_token, "shift", a_file)
								elseif a_token.is_non_associative then
										-- Keep neither.
									lookaheads.delete (a_token)
									tokens.remove (j)
										-- Record an explicit error for this token.
									errors.force_last (a_token)
									report_resolution (verbose, a_rule, a_token, "an error", a_file)
								end
							end
						end
						j := j - 1
					end
				end
				i := i + 1
			end
				-- Loop over all reductions which require lookahead
				-- in current state. Check for conflicts which
				-- have not been resolved.
			has_conflict := False
			i := reductions.count
			from until i < 1 loop
				a_reduction := reductions.item (i)
				lookaheads := a_reduction.lookaheads
				j := lookaheads.count
				from until j < 1 loop
					a_token := lookaheads.item (j)
					if tokens.has (a_token) then
						has_conflict := True
					else
							-- This is a trick to find reduce/reduce
							-- conflicts.
						tokens.force_last (a_token)
					end
					j := j - 1
				end
				i := i - 1
			end
		end

	shift_reduce_count: INTEGER is
			-- Number of shift/reduce conflicts in current state
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			lookaheads: DS_ARRAYED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
			i, j: INTEGER
		do
			i := shifts.count
			!! tokens.make (i)
			from until i < 1 loop
				a_token ?= shifts.item (i).accessing_symbol
				if a_token /= Void then
					tokens.put_last (a_token)
				end
				i := i - 1
			end
				-- Loop over all reductions which require lookahead
				-- in current state to find any shift/reduce conflicts.
			i := reductions.count
			from until i < 1 loop
				lookaheads := reductions.item (i).lookaheads
				j := tokens.count
				from until j < 1 loop
					a_token := tokens.item (j)
					if lookaheads.has (a_token) then
							-- There is a shift/reduce conflict.
						Result := Result + 1
						tokens.remove (j)
					end
					j := j - 1
				end
				i := i - 1
			end
		end

	reduce_reduce_count: INTEGER is
			-- Number of reduce/reduce conflicts in current state
		local
			i, j: INTEGER
			lookaheads: DS_ARRAYED_LIST [PR_TOKEN]
			tokens, conflicts: DS_LINKED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
		do
			i := reductions.count
			if i > 1 then
				!! tokens.make
				!! conflicts.make
				from until i < 1 loop
					lookaheads := reductions.item (i).lookaheads
					j := lookaheads.count
					from until j < 1 loop
						a_token := lookaheads.item (j)
						if not tokens.has (a_token) then
							tokens.force_last (a_token)
						elseif not conflicts.has (a_token) then
							conflicts.force_last (a_token)
						end
						j := j - 1
					end
					i := i - 1
				end
				Result := conflicts.count
			end
		end

	report_resolution (verbose: BOOLEAN; a_rule: PR_RULE;
		a_token: PR_TOKEN; a_resolution: STRING;
		a_file: like OUTPUT_STREAM_TYPE) is
			-- Report to `a_file' in verbose mode that a
			-- shift/reduce conflict between `a_rule' and
			-- `a_token' has been resolved as `a_resolution'.
		require
			a_rule_not_void: a_rule /= Void
			a_token_not_void: a_token /= Void
			a_resolution_not_void: a_resolution /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			if verbose then
				a_file.put_string ("Conflict in state ")
				a_file.put_integer (id)
				a_file.put_string (" between rule ")
				a_file.put_integer (a_rule.id)
				a_file.put_string (" and token ")
				a_file.put_integer (a_token.id)
				a_file.put_string (" resolved as ")
				a_file.put_string (a_resolution)
				a_file.put_string (".%N")
			end
		end

feature -- Sorting

	sort_positions is
			-- Sort `positions' in increasing order.
		do
			positions.sort (Position_sorter)
		ensure
			positions_sorted: positions_sorted
		end

	positions_sorted: BOOLEAN is
			-- Are `positions' sorted?
		do
			Result := positions.sorted (Position_sorter)
		end

feature {NONE} -- Constants

	Initial_max_nb_positions: INTEGER is 50
	Max_nb_positions_increment: INTEGER is 50
			-- Maximum number of positions

	Initial_max_nb_shifts: INTEGER is 50
	Initial_max_nb_reductions: INTEGER is 50
			-- Maximum number of transitions

	Initial_max_nb_errors: INTEGER is 10
			-- Maximum number of errors

	Position_sorter: DS_BUBBLE_SORTER [PR_POSITION] is
			-- Position sorter
		once
			!! Result
		ensure
			position_sorter_not_void: Result /= Void
		end

invariant

	valid_id: id >= 0
	accessing_symbol_not_void: accessing_symbol /= Void
	positions_not_void: positions /= Void
	no_void_position: not positions.has (Void)
	shifts_not_void: shifts /= Void
	no_void_shift: not shifts.has (Void)
	reductions_not_void: reductions /= Void
	no_void_reduction: not reductions.has (Void)
	errors_not_void: errors /= Void
	no_void_error: not errors.has (Void)

end -- class PR_STATE
