indexing

	description:

		"Terminal symbols. For details about symbols, %
		%see $GOBO\doc\geyacc\symbols.html"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TOKEN

inherit

	PR_SYMBOL
		rename
			print_symbol as print_token
		end

creation

	make

feature -- Status report

	is_terminal: BOOLEAN is True
			-- Is current symbol terminal?

	has_identifier: BOOLEAN is
			-- Is current token associated with an identifier?
		local
			c: CHARACTER
		do
			c := name.item (1)
			Result := c /= '%'' and c /= '%"'
		end

	is_left_associative: BOOLEAN is
			-- Is current token left associative?
		do
			Result := associativity = Left_assoc
		ensure
			associativity: Result implies
				not (is_right_associative or is_non_associative)
		end

	is_right_associative: BOOLEAN is
			-- Is current token right associative?
		do
			Result := associativity = Right_assoc
		ensure
			associativity: Result implies
				not (is_left_associative or is_non_associative)
		end

	is_non_associative: BOOLEAN is
			-- Is current token non-associative?
		do
			Result := associativity = Non_assoc
		ensure
			associativity: Result implies
				not (is_left_associative or is_right_associative)
		end

	has_precedence: BOOLEAN is
			-- Has a precedence level been
			-- assigned to current token?
		do
			Result := precedence /= 0
		end

	has_token_id: BOOLEAN is
			-- Has a `token_id' been assigned
			-- to current token?
		do
			Result := token_id /= 0
		end

feature -- Access

	token_id: INTEGER
			-- External id (possibly set by the user)
			-- known by any associated lexical analyzer
			-- (0 means that no `token_id' has been assigned.)

	precedence: INTEGER
			-- Precedence level
			-- (0 means that no `precedence' has been assigned.)

	literal_string: STRING
			-- Literal string that can be used instead
			-- of curren token's name in rules
			-- (Void if no sucg string.)

feature -- Setting

	set_token_id (i: INTEGER) is
			-- Set `token_id' to `i'.
		require
			i_positive: i >= 0
		do
			token_id := i
		ensure
			token_id_set: token_id = i
		end

	set_precedence (p: INTEGER) is
			-- Set `precedence' to `p'.
		do
			precedence := p
		ensure
			precedence_set: precedence = p
		end

	set_literal_string (a_string: STRING) is
			-- Set `literal_string' to `a_string'.
		do
			literal_string := a_string
		ensure
			literal_string_set: literal_string = a_string
		end

feature -- Status setting

	set_left_associative is
			-- Make current token left associative.
		do
			associativity := Left_assoc
		ensure
			is_left_associative: is_left_associative
		end

	set_right_associative is
			-- Make current token right associative.
		do
			associativity := Right_assoc
		ensure
			is_right_associative: is_right_associative
		end

	set_non_associative is
			-- Make current token non-associative.
		do
			associativity := Non_assoc
		ensure
			is_non_associative: is_non_associative
		end

feature -- Output

	print_token (a_grammar: PR_GRAMMAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of current
			-- token to `a_file' with rules where it
			-- appears in `a_grammar'.
		local
			i, nb: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			a_rule: PR_RULE
		do
			a_file.put_string (name)
			a_file.put_string (" (token ")
			a_file.put_integer (token_id)
			a_file.put_character (')')
			rules := a_grammar.rules
			nb := rules.count
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				if a_rule.rhs.has (Current) then
					a_file.put_character (' ')
					a_file.put_integer (a_rule.id)
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	associativity: INTEGER
			-- Associativity of current token

	Left_assoc, Right_assoc, Non_assoc: INTEGER is Unique
			-- Valid values for `associativity'

invariant

	terminal: is_terminal
	token_id_positive: token_id >= 0

end -- class PR_TOKEN
