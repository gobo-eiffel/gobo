indexing

	description:

		"Grammar rules, also known as productions. For details %
		%about grammar rules, see $GOBO\doc\geyacc\rules.html"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_RULE

inherit

	COMPARABLE

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_lhs: like lhs; an_action: like action) is
			-- Create a new grammar rule with `a_lhs'
			-- as left-hand-side and `an_action' as
			-- semantic action.
		require
			valid_id: an_id >= 1
			a_lhs_not_void: a_lhs /= Void
			an_action_not_void: an_action /= Void
		do
			id := an_id
			lhs := a_lhs
			action := an_action
			!! rhs.make (Initial_max_nb_rhs)
		ensure
			id_set: id = an_id
			lhs_set: lhs = a_lhs
			action_set: action = an_action
		end

feature -- Access

	id: INTEGER
			-- Identification number
			-- (Rules are indexed from 1.)

	lhs: PR_VARIABLE
			-- Left-hand-side of current rule

	rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			-- Right-hand-side of current rule

	action: UT_COMMAND
			-- Associated semantic action

	precedence: INTEGER
			-- Precedence level
			-- (0 means that no `precedence' has been assigned.)

	line_nb: INTEGER
			-- Line number associated of current rule

feature -- Setting

	set_action (an_action: like action) is
			-- Set `action' to `an_action'.
		require
			an_action_not_void: an_action /= Void
		do
			action := an_action
		ensure
			action_set: action = an_action
		end

	set_precedence (p: INTEGER) is
			-- Set `precedence' to `p'.
		do
			precedence := p
		ensure
			precedence_set: precedence = p
		end

	set_line_nb (nb: like line_nb) is
			-- Set `line_nb' to `nb'.
		do
			line_nb := nb
		ensure
			line_nb_set: line_nb = nb
		end

	set_id (i: INTEGER) is
			-- Set `id' to i'.
		require
			valid_id: i >= 1
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Element change

	put_symbol (a_symbol: PR_SYMBOL) is
			-- Add `a_symbol' at the end of the
			-- right-hand-side list of symbols.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			if rhs.is_full then
				rhs.resize (rhs.count + Max_nb_rhs_increment)
			end
			rhs.put_last (a_symbol)
		ensure
			one_more: rhs.count = old (rhs.count) + 1
			inserted: rhs.last = a_symbol
		end

feature -- Status report

	is_left_associative: BOOLEAN is
			-- Is current rule left associative?
		do
			Result := associativity = Left_assoc
		ensure
			associativity: Result implies
				not (is_right_associative or is_non_associative)
		end

	is_right_associative: BOOLEAN is
			-- Is current rule right associative?
		do
			Result := associativity = Right_assoc
		ensure
			associativity: Result implies
				not (is_left_associative or is_non_associative)
		end

	is_non_associative: BOOLEAN is
			-- Is current rule non-associative?
		do
			Result := associativity = Non_assoc
		ensure
			associativity: Result implies
				not (is_left_associative or is_right_associative)
		end

	has_precedence: BOOLEAN is
			-- Has a precedence level been
			-- assigned to current rule?
		do
			Result := precedence /= 0
		end

	is_useful: BOOLEAN
			-- Is current symbol useful?

feature -- Status setting

	set_left_associative is
			-- Make current rule left associative.
		do
			associativity := Left_assoc
		ensure
			is_left_associative: is_left_associative
		end

	set_right_associative is
			-- Make current rule right associative.
		do
			associativity := Right_assoc
		ensure
			is_right_associative: is_right_associative
		end

	set_non_associative is
			-- Make current rule non-associative.
		do
			associativity := Non_assoc
		ensure
			is_non_associative: is_non_associative
		end

	set_useful (b: BOOLEAN) is
			-- Set `is_useful' to `b'.
		do
			is_useful := b
		ensure
			useful_set: is_useful = b
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current rule considered less than `other'?
		do
			Result := id < other.id
		ensure then
			definition: Result = (id < other.id)
		end

feature -- Output

	print_rule (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of
			-- current rule to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, nb: INTEGER
		do
			a_file.put_string ("rule ")
			a_file.put_integer (id)
			a_file.put_character (' ')
			a_file.put_string (lhs.name)
			a_file.put_string (" ->")
			if rhs.is_empty then
				a_file.put_string (" -- Empty")
			else
				nb := rhs.count
				from i := 1 until i > nb loop
					a_file.put_character (' ')
					a_file.put_string (rhs.item (i).name)
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	associativity: INTEGER
			-- Associativity of current rule

	Left_assoc, Right_assoc, Non_assoc: INTEGER is Unique
			-- Valid values for `associativity'

feature {NONE} -- Constants

	Initial_max_nb_rhs: INTEGER is 20
	Max_nb_rhs_increment: INTEGER is 20
			-- Maximum number of right-hand-side symbols

invariant

	valid_id: id >= 1
	lhs_not_void: lhs /= Void
	rhs_not_void: rhs /= Void
	no_void_rhs: not rhs.has (Void)
	action_not_void: action /= Void

end -- class PR_RULE
