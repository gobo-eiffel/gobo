indexing

	description:

		"Transition tables, indexed by transition labels";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_TRANSITION_TABLE [G -> LX_STATE]

inherit

	DS_ARRAYED [G]
		rename
			item as target,
			count as capacity,
			valid_index as valid_label,
			clear_all as array_clear_all
		export
			{ANY}
				target, valid_label, lower, upper,
				copy, is_equal, capacity;
			{NONE} all
		end

creation

	make

feature -- Access

	difference (other: like Current; null: like target): like Current is
			-- Difference between current transitions and `other';
			-- Differences are either marked with current's target,
			-- if it exists, or `null' otherwise. Common targets are
			-- marked with a void target 
		require
			other_not_void: other /= Void
			same_lower: lower = other.lower
			same_upper: upper = other.upper
		local
			i, nb: INTEGER
			state: like target
		do
			!! Result.make (lower, upper)
			nb := upper
			from i := lower until i > nb loop
				state := target (i)
				if state /= other.target (i) then
					if state = Void or else state = state.default then
						Result.set_target (null, i)
					else
						Result.set_target (state, i)
					end
				end
				i := i + 1
			end
		ensure
			difference_not_void: Result /= Void
			difference_lower: Result.lower = lower
			difference_upper: Result.upper = upper
		end

	minimum_label: INTEGER is
			-- Smallest label with an out-transition
		require
			not_empty: count > 0
		local
			state: like target
		do
			from
				Result := lower
				state := target (Result)
			until
				state /= Void and then state /= state.default
			loop
				Result := Result + 1
				state := target (Result)
			end
		ensure
			valid_label: valid_label (Result)
			-- smallest: forall i in lower .. (Result - 1),
			--	target (i) = Void or else target (i) = target (i).default
		end

	maximum_label: INTEGER is
			-- Largest label with an out-transition
		require
			not_empty: count > 0
		local
			state: like target
		do
			from
				Result := upper
				state := target (Result)
			until
				state /= Void and then state /= state.default
			loop
				Result := Result - 1
				state := target (Result)
			end
		ensure
			valid_label: valid_label (Result)
			-- largest: forall i in (Result + 1) .. upper,
			--	target (i) = Void or else target (i) = target (i).default
		end

feature -- Measurement

	count: INTEGER
			-- Number of transitions in table

feature -- Element change

	set_target (state: like target; label: INTEGER) is
			-- Add a transition labeled `label' to `state'.
		require
			valid_label: valid_label (label)
			state_not_void: state /= Void and then state /= state.default
		local
			void_state: like target
		do
			if target (label) = void_state then
				count := count + 1
			end
			put (state, label)
		ensure
			one_more: count >= old count
			target_set: target (label) = state
		end

feature -- Removal

	remove (label: INTEGER) is
			-- Remove transition labeled `label'.
		require
			valid_label: valid_label (label)
		local
			void_state: like target
		do
			if target (label) /= void_state then
				put (void_state, label)
				count := count - 1
			end
		ensure
			one_less: count <= old count
			removed: target (label) = Void or else
				target (label) = target (label).default
		end

	clear_all is
			-- Remove all transitions.
		do
			count := 0
			array_clear_all
		ensure
			empty: count = 0
		end

invariant

	positive_count: count >= 0

end -- class LX_TRANSITION_TABLE
