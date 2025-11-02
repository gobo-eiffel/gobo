note

	description:
	"[
		LSP objects.
		An object is a collection of name/value pairs.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_OBJECT

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty object.
		do
			make_with_capacity (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty object with capacity `nb`.
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
			-- Number of values in the current object
		do
			Result := values.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = values.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current object
		do
			Result := values.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = values.capacity
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no values in the current object?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	value (a_name: LS_STRING): detachable LS_ANY
			-- Value associated with name `a_name` if any,
			-- Void otherwise
		require
			a_name_not_void: a_name /= Void
		do
			Result := values.value (a_name)
		end

	values: DS_HASH_TABLE [LS_ANY, LS_STRING]
			-- Values indexed by names

feature -- Element change

	put_value (a_value: LS_ANY; a_name: LS_STRING)
			-- Associate `a_value' with `a_name'.
			-- Put `a_value' at the end of `values` if no value was already
			-- associated with `a_name', or replace existing value otherwise.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			values.force_last (a_value, a_name)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_object (Current)
		end

invariant

	values_not_void: values /= Void
	no_void_values: not values.has_void_item
	no_void_names: not values.has_void

end
