indexing

	description:

		"Rule reduction transitions"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_REDUCTION

inherit

	COMPARABLE

creation

	make

feature {NONE} -- Initialization

	make (a_rule: like rule) is
			-- Create a new reduction transition for `a_rule'.
		require
			a_rule_not_void: a_rule /= Void
		do
			rule := a_rule
			!! lookaheads.make (Initial_max_nb_lookaheads)
			!! transitions.make
		ensure
			rule_set: rule = a_rule
		end

feature -- Access

	rule: PR_RULE
			-- Rule being reduced

	lookaheads: DS_ARRAYED_LIST [PR_TOKEN]
			-- If lookahead is needed, then current reduction
			-- is applicable only when the next token is one
			-- of the tokens in `lookaheads'.

	transitions: DS_LINKED_LIST [PR_TRANSITION]
			-- Transitions leading to current reduction of `rule'

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current reduction considered less than `other'?
		do
			Result := rule < other.rule
		ensure then
			definition: Result = (rule < other.rule)
		end

feature -- Element change

	put_transition (a_transition: PR_TRANSITION) is
			-- Add `a_transition' to `transitions'.
		require
			a_transition_not_void: a_transition /= Void
		do
			transitions.force_last (a_transition)
		ensure
			transition_added: transitions.has (a_transition)
		end

	build_lookaheads is
			-- Find out the lookahead tokens `lookaheads'
			-- as being the possible following tokens of
			-- transitions leading to current reduction.
		local
			nb_token: INTEGER
			transitions_cursor: DS_LINEAR_CURSOR [PR_TRANSITION]
			follows_cursor: DS_LINEAR_CURSOR [PR_TOKEN]
			a_token: PR_TOKEN
		do
			transitions_cursor := transitions.new_cursor
			from transitions_cursor.start until transitions_cursor.after loop
				nb_token := nb_token + transitions_cursor.item.following_tokens.count
				transitions_cursor.forth
			end
			lookaheads.wipe_out
			if lookaheads.capacity < nb_token then
				lookaheads.resize (nb_token)
			end
			from transitions_cursor.start until transitions_cursor.after loop
				follows_cursor := transitions_cursor.item.following_tokens.new_cursor
				from follows_cursor.start until follows_cursor.after loop
					a_token := follows_cursor.item
					if not lookaheads.has (a_token) then
						lookaheads.put_last (a_token)
					end
					follows_cursor.forth
				end
				transitions_cursor.forth
			end
		end

feature {NONE} -- Constants

	Initial_max_nb_lookaheads: INTEGER is 10
			-- Initial maximum number of lookahead tokens

invariant

	rule_not_void: rule /= Void
	lookaheads_not_void: lookaheads /= Void
	no_void_lookahead_token: not lookaheads.has (Void)
	transitions_not_void: transitions /= Void
	no_void_transition: not transitions.has (Void)

end -- class PR_REDUCTION
