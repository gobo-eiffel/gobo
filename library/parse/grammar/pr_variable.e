indexing

	description:

		"Non-terminal symbols. For details about %
		%symbols, see $GOBO\doc\geyacc\symbols.html"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_VARIABLE

inherit

	PR_SYMBOL
		rename
			print_symbol as print_variable
		redefine
			make
		end

	DS_NESTED_LIST [PR_RULE]
		rename
			local_items as derives,
			remote_items as firsts
		end

creation

	make

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_name: like name; a_type: like type) is
			-- Create a new variable named `a_name'.
			-- (Variables are indexed from 0.)
		do
			id := an_id
			name := a_name
			type := a_type
			!! rules.make (Initial_max_nb_rules)
			!! transitions.make
			!! derives.make
			!! firsts.make
		end

feature -- Status report

	is_terminal: BOOLEAN is False
			-- Is current symbol terminal?

	is_nullable: BOOLEAN
			-- Can current variable be expanded
			-- into an empty string?

	has_transition (a_state: PR_STATE): BOOLEAN is
			-- Is there a transition from `a_state'
			-- through current symbol?
		require
			a_state_not_void: a_state /= Void
		local
			cursor: DS_BILINEAR_CURSOR [PR_TRANSITION]
		do
			cursor := transitions.new_cursor
			from cursor.start until cursor.after loop
				if cursor.item.source = a_state then
					Result := True
					cursor.finish -- Jump out of the loop.
				end
				cursor.forth
			end
		end

feature -- Access

	rules: DS_ARRAYED_LIST [PR_RULE]
			-- Rules with current variable as left-hand-side

	firsts: DS_LINKED_LIST [PR_VARIABLE]
			-- Variables which can represent the beginning of
			-- the input corresponding to current variable
			-- (For example, if some rule expands symbol of
			-- id 5 into a sequence of symbols 8 3 20, the
			-- variable 8 can be the beginning of the data
			-- for symbol 5, and will appear in the `firsts'
			-- variable list of the variable of id 5.)

	derives: DS_LINKED_LIST [PR_RULE]
			-- Rules that can help derive the beginning of the
			-- data for current nonterminal variable (For example,
			-- if the symbol of id 5 is the left-hand-side of
			-- a sequence of symbols of ids 8 3 20, and one of
			-- the rules with variable 8 as left-hand-side is
			-- the rule of id 4, then that rule will appear in
			-- ithe `derives' rule list of the variable of id 5.)

	transitions: DS_LINKED_LIST [PR_TRANSITION]
			-- Transitions through current symbol

	transition (a_state: PR_STATE): PR_TRANSITION is
			-- Transition from `a_state' through current symbol
		require
			a_state_not_void: a_state /= Void
			has_transition: has_transition (a_state)
		local
			cursor: DS_BILINEAR_CURSOR [PR_TRANSITION]
		do
			cursor := transitions.new_cursor
			from cursor.start until cursor.after loop
				Result := cursor.item
				if Result.source = a_state then
					cursor.finish -- Jump out of the loop.
				end
				cursor.forth
			end
		ensure
			transition_not_void: Result /= Void
			valid_transition: transitions.has (Result)
			source_state: Result.source = a_state
		end

feature -- Status setting

	set_nullable is
			-- Set `is_nullable' to true.
		do
			is_nullable := True
		ensure
			is_nullable: is_nullable
		end

feature -- Element change

	put_rule (a_rule: PR_RULE) is
			-- Add `a_rule' to the list of rules with
			-- current variable as left-hand-side.
		require
			a_rule_not_void: a_rule /= Void
			derivable: a_rule.lhs = Current
		do
			if rules.is_full then
				rules.resize (rules.count + Max_nb_rules_increment)
			end
			rules.put_last (a_rule)
		ensure
			rule_added: rules.has (a_rule)
		end

	put_transition (a_transition: PR_TRANSITION) is
			-- Add `a_transition' to the list of
			-- transitions through current symbol.
		require
			a_transition_not_void: a_transition /= Void
			valid_transition: a_transition.symbol = Current
		do
			transitions.force_last (a_transition)
		ensure
			transition_added: transitions.has (a_transition)
		end

feature -- Output

	print_variable (a_grammar: PR_GRAMMAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of current
			-- variable to `a_file' with rules where it
			-- appears in `a_grammar'.
		local
			i, nb: INTEGER
			a_rule: PR_RULE
			r: DS_ARRAYED_LIST [PR_RULE]
			on_right: BOOLEAN
		do
			a_file.put_string (name)
			a_file.put_string (" (")
			a_file.put_integer (id)
			a_file.put_character (')')
			if not rules.is_empty then
				a_file.put_string (" on left:")
				nb := rules.count
				from i := 1 until i > nb loop
					a_file.put_character (' ')
					a_file.put_integer (rules.item (i).id)
					i := i + 1
				end
			end
			r := a_grammar.rules
			nb := r.count
			from i := 1 until i > nb loop
				a_rule := r.item (i)
				if a_rule.rhs.has (Current) then
					if not on_right then
						on_right := True
						if not rules.is_empty then
							a_file.put_character (',')
						end
						a_file.put_string (" on right:")
					end
					a_file.put_character (' ')
					a_file.put_integer (a_rule.id)
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_max_nb_rules: INTEGER is 5
	Max_nb_rules_increment: INTEGER is 5
			-- Maxium number of derive rules

invariant

	non_terminal: not is_terminal
	rules_not_void: rules /= Void
	no_void_rule: not rules.has (Void)
--	derivable_rules: forall rule in rules, rule.lhs = Current
	transitions_not_void: transitions /= Void
	no_void_transition: not transitions.has (Void)
--	valid_transitions: forall t in transitions, t.symbol = Current
	no_void_first: not firsts.has (Void)
	no_void_derive: not derives.has (Void)

end -- class PR_VARIABLE
