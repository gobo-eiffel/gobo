note

	description:

		"ECF lists of values to be passed for external compilations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_VALUES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_external_value: like external_value)
			-- Create a new external value list with initially one value `a_external_value'.
		require
			a_external_value_not_void: a_external_value /= Void
		do
			create external_values.make (Initial_external_values_capacity)
			external_values.put_last (a_external_value)
		ensure
			one_external_value: external_values.count = 1
			external_value_set: external_values.last = a_external_value
		end

	make_empty
			-- Create a new empty external value list.
		do
			create external_values.make (Initial_external_values_capacity)
		ensure
			is_empty: external_values.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is the list of external values empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_VALUE
			-- `i'-th external value
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := external_values.item (i)
		ensure
			external_value_not_void: Result /= Void
		end

	external_values: DS_ARRAYED_LIST [like external_value]
			-- External values

feature -- Measurement

	count: INTEGER
			-- Number of external values
		do
			Result := external_values.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = external_values.count
		end

feature -- Element change

	put_last (a_external_value: like external_value)
			-- Add `a_external_value' to the list of external values.
		require
			a_external_value_not_void: a_external_value /= Void
		do
			external_values.force_last (a_external_value)
		ensure
			one_more: external_values.count = old external_values.count + 1
			external_value_added: external_values.last = a_external_value
		end

	fill_external_values (a_target: ET_ECF_TARGET; a_state: ET_ECF_STATE)
			-- Add to `a_target.system_config.universe.current_system' the current external values
			-- whose conditions satisfy `a_state'.
			-- `a_target' is the target where this external value has been declared.
		require
			a_target_not_void: a_target /= Void
			a_state_not_void: a_state /= Void
		do
			external_values.do_all (agent {like external_value}.fill_external_values (a_target, a_state))
		end

feature {NONE} -- Constants

	Initial_external_values_capacity: INTEGER = 50
			-- Initial capacity for `external_values'

invariant

	external_values_not_void: external_values /= Void
	no_void_external_value: not external_values.has_void

end
