note

	description:

		"LSP lists of unregistrations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNREGISTRATION_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of unregistrations.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of unregistrations with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create unregistrations.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := unregistrations.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = unregistrations.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := unregistrations.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = unregistrations.capacity
		end

feature -- Access

	unregistration (i: INTEGER): LS_UNREGISTRATION
			-- Unregistration at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := unregistrations.item (i)
		ensure
			unregistration_not_void: Result /= Void
			definition: Result = unregistrations.item (i)
		end

	unregistrations: DS_ARRAYED_LIST [LS_UNREGISTRATION]
			-- Unregistrations

feature -- Element change

	put_last (a_unregistration: LS_UNREGISTRATION)
			-- Put `a_unregistration` at the end of the list of unregistrations.
		require
			a_registration_not_void: a_unregistration /= Void
		do
			unregistrations.force_last (a_unregistration)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_unregistration_list (Current)
		end

invariant

	unregistrations_not_void: unregistrations /= Void
	no_void_unregistration: not unregistrations.has_void

end
