note

	description:
	"[
		JSON objects.
		An object is a collection of name/value pairs.
	]"
	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_OBJECT

inherit

	JN_VALUE

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
			-- Create a new empty object with capacity `nb'.
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

	value (a_name: READABLE_STRING_GENERAL): detachable JN_VALUE
			-- Value associated with name `a_name` if any,
			-- Void otherwise
		require
			a_name_not_void: a_name /= Void
		local
			l_string: JN_STRING
		do
			create l_string.make_from_string (a_name)
			Result := values.value (l_string)
		end

	value_with_utf8_name (a_name: STRING_8): detachable JN_VALUE
			-- Value associated with name `a_name` (with no escaped characters)
			-- if any, Void otherwise
		require
			a_name_not_void: a_name /= Void
			a_name_is_string_8: a_name.same_type ({STRING_8} "")
			valid_utf8_name: {UC_UTF8_ROUTINES}.valid_utf8 (a_name)
		local
			l_string: JN_STRING
		do
			create l_string.make_from_utf8 (a_name)
			Result := values.value (l_string)
		end

	value_with_json_name (a_name: JN_STRING): detachable JN_VALUE
			-- Value associated with name `a_name` if any,
			-- Void otherwise
		require
			a_name_not_void: a_name /= Void
		do
			Result := values.value (a_name)
		end

	values: DS_HASH_TABLE [JN_VALUE, JN_STRING]
			-- Values indexed by names

feature -- Element change

	put_value (a_value: JN_VALUE; a_name: READABLE_STRING_GENERAL)
			-- Associate `a_value' with `a_name'.
			-- Put `a_value' at the end of `values` if no value was already
			-- associated with `a_name', or replace existing value otherwise.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		local
			l_string: JN_STRING
		do
			create l_string.make_from_string (a_name)
			values.force_last (a_value, l_string)
		end

	put_value_with_utf8_name (a_value: JN_VALUE; a_name: STRING_8)
			-- Associate `a_value' with `a_name' (with no escaped characters).
			-- Put `a_value' at the end of `values` if no value was already
			-- associated with `a_name', or replace existing value otherwise.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
			a_name_is_string_8: a_name.same_type ({STRING_8} "")
			valid_utf8_name: {UC_UTF8_ROUTINES}.valid_utf8 (a_name)
		local
			l_string: JN_STRING
		do
			create l_string.make_from_utf8 (a_name)
			values.force_last (a_value, l_string)
		end

	put_value_with_json_name (a_value: JN_VALUE; a_name: JN_STRING)
			-- Associate `a_value' with `a_name'.
			-- Put `a_value' at the end of `values` if no value was already
			-- associated with `a_name', or replace existing value otherwise.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			values.force_last (a_value, a_name)
		end

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		local
			l_first: BOOLEAN
			l_cursor: DS_HASH_TABLE_CURSOR [JN_VALUE, JN_STRING]
		do
			a_string.append_character ('{')
			l_first := True
			l_cursor := values.new_cursor
			from l_cursor.start until l_cursor.after loop
				if l_first then
					a_string.append_character (',')
					l_first := False
				end
				l_cursor.item.append_to_string (a_string)
				l_cursor.forth
			end
			a_string.append_character ('}')
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_object (Current)
		end

invariant

	values_not_void: values /= Void
	no_void_values: not values.has_void_item
	no_void_names: not values.has_void

end
