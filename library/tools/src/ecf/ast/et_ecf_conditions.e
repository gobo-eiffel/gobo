note

	description:

		"ECF condition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_CONDITIONS

inherit

	ET_ECF_CONDITION

feature {NONE} -- Initialization

	make (a_condition: like condition)
			-- Create a new condition list with initially one condition `a_condition'.
		require
			a_condition_not_void: a_condition /= Void
		do
			create conditions.make (Initial_conditions_capacity)
			conditions.put_last (a_condition)
		ensure
			one_condition: conditions.count = 1
			conditions_set: conditions.last = a_condition
		end

	make_empty
			-- Create a new empty condition list.
		do
			create conditions.make (Initial_conditions_capacity)
		ensure
			is_empty: is_empty
		end

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		local
			i, nb: INTEGER
		do
			Result := not is_ored
			nb := conditions.count
			from i := 1 until i > nb loop
				if conditions.item (i).is_enabled (a_state) = is_ored then
					Result := is_ored
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	is_ored: BOOLEAN
			-- Should the conditions be or-ed when calling `is_enabled'?
		deferred
		end

	is_empty: BOOLEAN
			-- Is the list of conditions empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	condition (i: INTEGER): ET_ECF_CONDITION
			-- `i'-th condition
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := conditions.item (i)
		ensure
			condition_not_void: Result /= Void
		end

	conditions: DS_ARRAYED_LIST [like condition]
			-- Conditions

feature -- Measurement

	count: INTEGER
			-- Number of conditions
		do
			Result := conditions.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = conditions.count
		end

feature -- Element change

	put_last (a_condition: like condition)
			-- Add `a_condition' to the list of conditions.
		require
			a_condition_not_void: a_condition /= Void
		do
			conditions.force_last (a_condition)
		ensure
			one_more: conditions.count = old conditions.count + 1
			condition_added: conditions.last = a_condition
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [like condition])
			-- Apply `an_action' to every condition, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		do
			conditions.do_all (an_action)
		end

feature {NONE} -- Constants

	Initial_conditions_capacity: INTEGER = 50
			-- Initial capacity for `conditions'

invariant

	conditions_not_void: conditions /= Void
	no_void_condition: not conditions.has_void

end
