indexing

	description:

		"Positions in rules"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_POSITION

inherit

	COMPARABLE

creation

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
			!! Result.make (rule, index + 1)
		ensure
			next_not_void: Result /= Void
			same_rule: Result.rule = rule
			next_position: Result.index = index + 1
		end

feature -- Status report

	after: BOOLEAN is
			-- Is current position after the last symbol
			-- of the right-hand-side of `rule'?
		do
			Result := index > rule.rhs.count
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
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

invariant

	rule_not_void: rule /= Void
	index_large_enough: index >= 1
	index_small_enough: index <= rule.rhs.count + 1

end -- class PR_POSITION
