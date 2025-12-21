note

	description:
	"[
		LSP lists.
		A list is an ordered list of values of a given type.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_LIST [G -> LS_ANY]

inherit

	LS_ANY

feature {NONE} -- Initialization

	make
			-- Create a new empty list.
		do
			make_with_capacity (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty list with capacity `nb`.
		require
			nb_not_negative: nb >= 0
		do
			create values.make (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := values.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = values.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := values.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = values.capacity
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no values in the current list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	value (i: INTEGER): G
			-- Value at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := values.item (i)
		ensure
			value_not_void: Result /= Void
			definition: Result = values.item (i)
		end

	values: DS_ARRAYED_LIST [like value]
			-- Values

feature -- Element change

	put_last (a_value: like value)
			-- Put `a_value` at the end of the current array.
		require
			a_value_not_void: a_value /= Void
		do
			values.force_last (a_value)
		end

feature -- Removal

	wipe_out
			-- Delete all values in current list.
		do
			values.wipe_out
		ensure
			wiped_out: count = 0
		end

invariant

	values_not_void: values /= Void
	no_void_values: not values.has_void

end
