note

	description:
	"[
		JSON arrays.
		An array is an ordered list of values.
	]"
	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_ARRAY

inherit

	JN_VALUE

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty array.
		do
			make_with_capacity (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty array with capacity `nb'.
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
			-- Number of values in the current array
		do
			Result := values.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = values.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current array
		do
			Result := values.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = values.capacity
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no values in the current array?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	value (i: INTEGER): JN_VALUE
			-- Value at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := values.item (i)
		ensure
			definition: Result = values.item (i)
		end

	values: DS_ARRAYED_LIST [JN_VALUE]
			-- Values

feature -- Element change

	put_last (a_value: JN_VALUE)
			-- Put `a_value` at the end of the current array.
		require
			a_value_not_void: a_value /= Void
		do
			values.force_last (a_value)
		end

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		local
			i, nb: INTEGER
		do
			a_string.append_character ('[')
			nb := count
			from i := 1 until i > nb loop
				if i /= 1 then
					a_string.append_character (',')
				end
				values.item (i).append_to_string (a_string)
				i := i + 1
			end
			a_string.append_character (']')
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_array (Current)
		end

invariant

	values_not_void: values /= Void
	no_void_values: not values.has_void

end
