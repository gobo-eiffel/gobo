note

	description:

		"Grammar rules, also known as productions. For details %
		%about grammar rules, see $GOBO\doc\geyacc\rules.html"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_RULE

inherit

	KL_COMPARABLE

create

	make

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_lhs: like lhs; an_action: like action)
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
			create rhs.make (Initial_max_nb_rhs)
			create error_actions.make (Initial_max_nb_rhs)
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

	error_actions: DS_ARRAYED_LIST [detachable PR_ERROR_ACTION]
			-- Action to be executed if a syntax error occurs
			-- before the i-th symbol of `rhs'

	action: DP_COMMAND
			-- Associated semantic action

	precedence: INTEGER
			-- Precedence level
			-- (0 means that no `precedence' has been assigned.)

	line_nb: INTEGER
			-- Line number associated of current rule

feature -- Setting

	set_action (an_action: like action)
			-- Set `action' to `an_action'.
		require
			an_action_not_void: an_action /= Void
		do
			action := an_action
		ensure
			action_set: action = an_action
		end

	set_error_action (an_action: PR_ERROR_ACTION; i: INTEGER)
			-- Set error action associated with `i'-th symbol to `an_action'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= error_actions.count
		do
			error_actions.replace (an_action, i)
		ensure
			error_action_set: error_actions.item (i) = an_action
		end

	set_precedence (p: INTEGER)
			-- Set `precedence' to `p'.
		do
			precedence := p
		ensure
			precedence_set: precedence = p
		end

	set_line_nb (nb: like line_nb)
			-- Set `line_nb' to `nb'.
		do
			line_nb := nb
		ensure
			line_nb_set: line_nb = nb
		end

	set_id (i: INTEGER)
			-- Set `id' to i'.
		require
			valid_id: i >= 1
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Element change

	put_symbol (a_symbol: PR_SYMBOL)
			-- Add `a_symbol' at the end of the
			-- right-hand-side list of symbols.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			if rhs.is_full then
				rhs.resize (rhs.count + Max_nb_rhs_increment)
			end
			rhs.put_last (a_symbol)
			if error_actions.is_full then
				error_actions.resize (error_actions.count + Max_nb_rhs_increment)
			end
			error_actions.put_last (Void)
		ensure
			one_more_symbol: rhs.count = old (rhs.count) + 1
			symbol_inserted: rhs.last = a_symbol
			one_more_error_action: error_actions.count = old (error_actions.count) + 1
			no_error_action: error_actions.last = Void
		end

feature -- Status report

	is_left_associative: BOOLEAN
			-- Is current rule left associative?
		do
			Result := associativity = Left_assoc
		ensure
			associativity: Result implies not (is_right_associative or is_non_associative)
		end

	is_right_associative: BOOLEAN
			-- Is current rule right associative?
		do
			Result := associativity = Right_assoc
		ensure
			associativity: Result implies not (is_left_associative or is_non_associative)
		end

	is_non_associative: BOOLEAN
			-- Is current rule non-associative?
		do
			Result := associativity = Non_assoc
		ensure
			associativity: Result implies not (is_left_associative or is_right_associative)
		end

	has_precedence: BOOLEAN
			-- Has a precedence level been
			-- assigned to current rule?
		do
			Result := precedence /= 0
		end

	is_useful: BOOLEAN
			-- Is current symbol useful?

feature -- Status setting

	set_left_associative
			-- Make current rule left associative.
		do
			associativity := Left_assoc
		ensure
			is_left_associative: is_left_associative
		end

	set_right_associative
			-- Make current rule right associative.
		do
			associativity := Right_assoc
		ensure
			is_right_associative: is_right_associative
		end

	set_non_associative
			-- Make current rule non-associative.
		do
			associativity := Non_assoc
		ensure
			is_non_associative: is_non_associative
		end

	set_useful (b: BOOLEAN)
			-- Set `is_useful' to `b'.
		do
			is_useful := b
		ensure
			useful_set: is_useful = b
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current rule considered less than `other'?
		do
			Result := id < other.id
		ensure then
			definition: Result = (id < other.id)
		end

feature -- Output

	print_rule (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print textual representation of
			-- current rule to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
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
				from
					i := 1
				until
					i > nb
				loop
					a_file.put_character (' ')
					a_file.put_string (rhs.item (i).name)
					i := i + 1
				end
			end
		end

	print_action (input_filename: STRING; a_line_pragma: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print semantic action to `a_file'.
			-- `input_filename' is the name of the file where
			-- the action text as been specified.
		require
			input_filename_not_void: input_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_type: PR_TYPE
			i, nb: INTEGER
			types: DS_HASH_TABLE [INTEGER, PR_TYPE]
			a_cursor: DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE]
		do
			a_file.put_string ("--|#line ")
			if a_line_pragma then
				a_file.put_integer (line_nb)
			else
				a_file.put_string ("<not available>")
			end
			a_file.put_string (" %"")
			a_file.put_string (input_filename)
			a_file.put_line ("%"")
			a_file.put_line ("debug (%"GEYACC%")")
			a_file.put_string ("%Tstd.error.put_line (%"Executing parser user-code from file '")
			a_file.put_string (input_filename)
			a_file.put_string ("' at line ")
			if a_line_pragma then
				a_file.put_integer (line_nb)
			else
				a_file.put_string ("<not available>")
			end
			a_file.put_line ("%")")
			a_file.put_line ("end")
			a_file.put_new_line
			a_file.put_string (action.out)
			a_file.put_new_line
			a_file.put_line ("if yy_parsing_status >= yyContinue then")
			a_file.put_string ("%Tyyssp := yyssp - ")
			nb := rhs.count
			a_file.put_integer (nb)
			a_file.put_new_line
			create types.make_map (nb + 1)
			a_type := lhs.type
			types.put_new (1, a_type)
			from
				i := 1
			until
				i > nb
			loop
				a_type := rhs.item (i).type
				types.search (a_type)
				if types.found then
					types.replace_found_item (types.found_item - 1)
				else
					types.put_new (-1, a_type)
				end
				i := i + 1
			end
			a_cursor := types.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				nb := a_cursor.item
				if nb /= 0 then
					a_cursor.key.print_increment_yyvsp (nb, 1, a_file)
				end
				a_cursor.forth
			end
			a_type := lhs.type
			if types.item (a_type) > 0 then
				a_type.print_resize_yyvs (1, a_file)
			end
			a_type.print_push_yyval (1, a_file)
			a_file.put_line ("end")
		end

feature {NONE} -- Implementation

	associativity: INTEGER
			-- Associativity of current rule

	Left_assoc: INTEGER = 1
			-- Code for left associativity

	Right_assoc: INTEGER = 2
			-- Code for right associativity

	Non_assoc: INTEGER = 3
			-- Code for no associativity

feature {NONE} -- Constants

	Initial_max_nb_rhs: INTEGER = 20
			-- Initial capacity for `rhs'

	Max_nb_rhs_increment: INTEGER = 20
			-- Increment when resizing `rhs'

invariant

	valid_id: id >= 1
	lhs_not_void: lhs /= Void
	rhs_not_void: rhs /= Void
	no_void_rhs: not rhs.has_void
	action_not_void: action /= Void
	error_actions_not_void: error_actions /= Void
	error_actions_count: error_actions.count = rhs.count

end
