note

	description:

		"LSP lists of registrations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_REGISTRATION_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of registrations.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of registrations with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create registrations.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := registrations.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = registrations.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := registrations.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = registrations.capacity
		end

feature -- Access

	registration (i: INTEGER): LS_REGISTRATION
			-- Registration at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := registrations.item (i)
		ensure
			registration_not_void: Result /= Void
			definition: Result = registrations.item (i)
		end

	registrations: DS_ARRAYED_LIST [LS_REGISTRATION]
			-- Registrations

feature -- Element change

	put_last (a_registration: LS_REGISTRATION)
			-- Put `a_registration` at the end of the list of registrations.
		require
			a_registration_not_void: a_registration /= Void
		do
			registrations.force_last (a_registration)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_registration_list (Current)
		end

invariant

	registrations_not_void: registrations /= Void
	no_void_registration: not registrations.has_void

end
