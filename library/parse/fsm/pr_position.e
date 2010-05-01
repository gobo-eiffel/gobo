note

	description:

		"Positions in rules"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_POSITION

inherit

	KL_COMPARABLE

	HASHABLE
		undefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (a_rule: like rule; an_index: INTEGER) is
			-- Create a new position in `a_rule'
			-- at index `an_index'.
		require
			a_rule_not_void: a_rule /= Void
			an_index_large_enough: an_index >= 1
			an_index_small_enough: an_index <= a_rule.rhs.count + 1
		do
			rule := a_rule
			index := an_index
		ensure
			rule_set: rule = a_rule
			index_set: index = an_index
		end

feature -- Access

	rule: PR_RULE
			-- Associated rule

	index: INTEGER
			-- Index in `rule'

	symbol: PR_SYMBOL is
			-- Symbol at current position
		require
			not_after: not after
		do
			Result := rule.rhs.item (index)
		ensure
			symbol_not_void: Result /= Void
		end

	next: like Current is
			-- Next position in `rule'
		require
			not_after: not after
		do
			create Result.make (rule, index + 1)
		ensure
			next_not_void: Result /= Void
			same_rule: Result.rule = rule
			next_position: Result.index = index + 1
		end

	error_action: PR_ERROR_ACTION is
			-- Action to be executed when a syntax error
			-- occurs at current position; Void is none
		do
			if index <= rule.error_actions.count then
				Result := rule.error_actions.item (index)
			end
		end

	hash_code: INTEGER is
			-- Hash value
		do
			Result := index * rule.id
		end

feature -- Status report

	before: BOOLEAN is
			-- Is current position before the first
			-- symbol of the right-hand-side of `rule'?
		do
			Result := index = 1
		end

	after: BOOLEAN is
			-- Is current position after the last symbol
			-- of the right-hand-side of `rule'?
		do
			Result := index > rule.rhs.count
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN is
			-- Is current position considered
			-- less than `other'?
		do
			if other.rule = rule then
				Result := index < other.index
			else
				Result := rule.id < other.rule.id
			end
		ensure then
			rule_comparison: Result implies (rule <= other.rule)
		end

	same_position (other: like Current): BOOLEAN is
			-- Are current position and `other' considered the same?
			-- (Do not redefine `is_equal' here because it is
			-- incompatible with the semantic inherited from 
			-- COMPARABLE.)
		require
			other_not_void: other /= Void
		do
			Result := rule = other.rule and then index = other.index
		ensure
			same_rule: Result implies rule = other.rule
			same_index: Result implies index = other.index
		end

feature -- Output

	print_position (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print textual representation of
			-- current position to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			i, nb: INTEGER
		do
			a_file.put_string (rule.lhs.name)
			a_file.put_string ("  ->  ")
			rhs := rule.rhs
			nb := rhs.count
			from
				i := 1
			until
				i = index
			loop
				a_file.put_string (rhs.item (i).name)
				a_file.put_character (' ')
				i := i + 1
			end
			a_file.put_character ('.')
			from
			until
				i > nb
			loop
				a_file.put_character (' ')
				a_file.put_string (rhs.item (i).name)
				i := i + 1
			end
			a_file.put_string ("   (rule ")
			a_file.put_integer (rule.id)
			a_file.put_character (')')
		end

invariant

	rule_not_void: rule /= Void
	index_large_enough: index >= 1
	index_small_enough: index <= rule.rhs.count + 1

end
