note

	description:

		"Transition tables, indexed by transition labels"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TRANSITION_TABLE [G -> LX_STATE]

inherit

	ANY
		redefine
			copy,
			is_equal
		end

	KL_CLONABLE
		undefine
			copy,
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (min, max: INTEGER)
			-- Create a new transition table for labels
			-- between `min' and `max'.
		require
			min_large_enough: min >= 0
			max_large_enough: max >= min
		do
			lower := min
			upper := max
			minimum_label := max + 1
			second_minimum_label := max + 1
			maximum_label := min - 1
			create transitions.make_map ((max - min + 1).min (256))
		ensure
			lower_set: lower = min
			upper_set: upper = max
		end

feature -- Status report

	valid_label (a_label: INTEGER): BOOLEAN
			-- Is `a_label' a valid label?
		do
			Result := a_label >= lower and a_label <= upper
		ensure
			definition: Result = (a_label >= lower and a_label <= upper)
		end

feature -- Access

	transitions: DS_HASH_TABLE [G, INTEGER]
			-- Transitions indexed by labels

	target (a_label: INTEGER): detachable G
			-- Target reached through transition `a_label';
			-- Void if no such transition exists
		require
			valid_label: valid_label (a_label)
		do
			Result := transitions.value (a_label)
		end

	difference (other: like Current; null: G): like Current
			-- Difference between current transitions and `other';
			-- Differences are either marked with current's target,
			-- if it exists, or `null' otherwise. Common targets are
			-- marked with a void target
		require
			other_not_void: other /= Void
			null_not_void: null /= Void
			same_lower: lower = other.lower
			same_upper: upper = other.upper
		local
			l_state: G
			l_label: INTEGER
			l_cursor: DS_HASH_TABLE_CURSOR [G, INTEGER]
			l_transitions: like transitions
		do
			create Result.make (lower, upper)
			l_transitions := transitions
			l_cursor := l_transitions.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_state := l_cursor.item
				l_label := l_cursor.key
				if l_state /= other.target (l_label) then
					Result.set_target (l_state, l_label)
				end
				l_cursor.forth
			end
			l_cursor := other.transitions.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_state := l_cursor.item
				l_label := l_cursor.key
				if not l_transitions.has (l_label) then
					Result.set_target (null, l_label)
				end
				l_cursor.forth
			end
		ensure
			difference_not_void: Result /= Void
			difference_lower: Result.lower = lower
			difference_upper: Result.upper = upper
		end

	minimum_label: INTEGER
			-- Smallest label with an out-transition
--		require
--			not_empty: count > 0
--		ensure
--			valid_label: valid_label (Result)
--			smallest: forall i in lower .. (Result - 1),
--				target (i) = Void

	second_minimum_label: INTEGER
			-- Second smallest label with an out-transition
--		require
--			at_least_two: count >= 2
--		ensure
--			valid_label: valid_label (Result)
--			second_smallest: forall i in (minimum_label + 1) .. (Result - 1),
--				target (i) = Void

	maximum_label: INTEGER
			-- Largest label with an out-transition
--		require
--			not_empty: count > 0
--		ensure
--			valid_label: valid_label (Result)
--			largest: forall i in (Result + 1) .. upper,
--				target (i) = Void

	lower: INTEGER
			-- Smallest label allowed

	upper: INTEGER
			-- Largest label allowed

feature -- Measurement

	count: INTEGER
			-- Number of transitions in table
		do
			Result := transitions.count
		ensure
			positive_not_negative: Result >= 0
			count_small_enough: Result <= capacity
		end

	capacity: INTEGER
			-- Maximum number of transitions
		do
			Result := upper - lower + 1
		ensure
			capacity_not_negative: Result >= 0
		end

feature -- Element change

	set_target (state: G; label: INTEGER)
			-- Add a transition labeled `label' to `state'.
		require
			valid_label: valid_label (label)
			state_not_void: state /= Void
		local
			l_transitions: like transitions
		do
			l_transitions := transitions
			l_transitions.search (label)
			if l_transitions.found then
				l_transitions.replace_found_item (state)
			else
				l_transitions.force_new (state, label)
				if label < minimum_label then
					second_minimum_label := minimum_label
					minimum_label := label
				elseif label < second_minimum_label then
					second_minimum_label := label
				end
				maximum_label := maximum_label.max (label)
			end
		ensure
			one_more: count >= old count
			target_set: target (label) = state
		end

feature -- Removal

	clear_all
			-- Remove all transitions.
		do
			minimum_label := upper + 1
			second_minimum_label := upper + 1
			maximum_label := lower - 1
			transitions.wipe_out
		ensure
			empty: count = 0
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current transition table.
		do
			standard_copy (other)
			transitions := transitions.twin
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current transition table equal to `other'?
		local
			old_transitions: like transitions
		do
			if ANY_.same_types (Current, other) then
				old_transitions := transitions
				transitions := other.transitions
				if standard_is_equal (other) then
					Result := old_transitions.is_equal (transitions)
				end
				transitions := old_transitions
			end
		end

invariant

	transitions_not_void: transitions /= Void
	lower_large_enough: lower >= 0
	upper_large_enough: upper >= lower

end
