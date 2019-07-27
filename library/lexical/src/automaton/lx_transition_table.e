note

	description:

		"Transition tables, indexed by transition labels"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TRANSITION_TABLE [reference G -> detachable LX_STATE]

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

	KL_IMPORTED_ANY_ROUTINES
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
			create storage.make_filled (Void, min, max)
			create array_routines
		ensure
			lower_set: lower = min
			upper_set: upper = max
		end

feature -- Status report

	valid_label (a_label: INTEGER): BOOLEAN
			-- Is `a_label' a valid label?
		do
			Result := storage.valid_index (a_label)
		ensure
			definition: Result = (a_label >= lower and a_label <= upper)
		end

feature -- Access

	target (a_label: INTEGER): detachable G
			-- Target reached through transition `a_label';
			-- Void if no such transition exists
		require
			valid_label: valid_label (a_label)
		do
			Result := storage.item (a_label)
		end

	difference (other: like Current; null: like target): like Current
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
			create Result.make (lower, upper)
			nb := upper
			from
				i := lower
			until
				i > nb
			loop
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

	minimum_label: INTEGER
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
--			smallest: forall i in lower .. (Result - 1),
--				target (i) = Void or else target (i) = target (i).default
		end

	second_minimum_label: INTEGER
			-- Second smallest label with an out-transition
		require
			at_least_two: count >= 2
		local
			state: like target
		do
			from
				Result := minimum_label + 1
				state := target (Result)
			until
				state /= Void and then state /= state.default
			loop
				Result := Result + 1
				state := target (Result)
			end
		ensure
			valid_label: valid_label (Result)
--			second_smallest: forall i in (minimum_label + 1) .. (Result - 1),
--				target (i) = Void or else target (i) = target (i).default
		end

	maximum_label: INTEGER
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
--			largest: forall i in (Result + 1) .. upper,
--				target (i) = Void or else target (i) = target (i).default
		end

	lower: INTEGER
			-- Smallest label allowed
		do
			Result := storage.lower
		ensure
			lower_large_enough: Result >= 0
		end

	upper: INTEGER
			-- Largest label allowed
		do
			Result := storage.upper
		ensure
			upper_large_enough: Result >= lower
		end

feature -- Measurement

	count: INTEGER
			-- Number of transitions in table

	capacity: INTEGER
			-- Maximum number of transitions
		do
			Result := storage.count
		end

feature -- Element change

	set_target (state: like target; label: INTEGER)
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
			storage.put (state, label)
		ensure
			one_more: count >= old count
			target_set: target (label) = state
		end

feature -- Removal

	remove (label: INTEGER)
			-- Remove transition labeled `label'.
		require
			valid_label: valid_label (label)
		local
			void_state: like target
		do
			if target (label) /= void_state then
				storage.put (void_state, label)
				count := count - 1
			end
		ensure
			one_less: count <= old count
			removed: not attached target (label) as l_target or else l_target = l_target.default
		end

	clear_all
			-- Remove all transitions.
		do
			count := 0
			storage.clear_all
		ensure
			empty: count = 0
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current transition table.
		do
			standard_copy (other)
			storage := array_routines.cloned_array (storage)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current transition table equal to `other'?
		local
			old_storage: like storage
		do
			if ANY_.same_types (Current, other) then
				old_storage := storage
				storage := other.storage
				if standard_is_equal (other) then
					Result := old_storage.is_equal (storage)
				end
				storage := old_storage
			end
		end

feature {LX_TRANSITION_TABLE} -- Implementation

	storage: ARRAY [detachable G]
			-- Transitions indexed by labels

feature {NONE} -- Implementation

	array_routines: KL_ARRAY_ROUTINES [detachable G]
			-- Routines that ought to be in class ARRAY

invariant

	storage_not_void: storage /= Void
	positive_count: count >= 0
	array_routines_not_void: array_routines /= Void

end
