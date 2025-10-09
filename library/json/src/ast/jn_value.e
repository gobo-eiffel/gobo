note

	description:

		"JSON values"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class JN_VALUE

feature -- Access

	nested_value (a_keys: TUPLE): detachable JN_VALUE
			-- Nested value, if any.
			-- Example:
			--  json: { "foo": [ true, {"bar": "eiffel" } ] }
			--  nested_value ("foo", 2, "bar") -> "eiffel"
			--  nested_value ("foo", 1) -> true
			--  nested_value ("unknown") -> Void
		require
			a_keys_not_void: a_keys /= Void
		local
			l_value: detachable JN_VALUE
			i, nb: INTEGER
		do
			from
				l_value := Current
				i := 1
				nb := a_keys.count
			until 
				l_value = Void or i > nb
			loop
				if attached {JN_OBJECT} l_value as l_object then
					if attached {READABLE_STRING_GENERAL} a_keys.item (i) as l_name then
						l_value := l_object.value (l_name)
					elseif attached {JN_STRING} a_keys.item (i) as l_name then
						l_value := l_object.value_with_json_name (l_name)
					else
						l_value := Void
					end
				elseif attached {JN_ARRAY} l_value as l_array then
					if attached {INTEGER} a_keys.item (i) as l_index and then (l_index >= 1 and l_index <= l_array.count) then
						l_value := l_array.value (l_index)
					else
						l_value := Void
					end
				else
					l_value := Void
				end
				i := i + 1
			end
			Result := l_value
		end

feature -- Output

	to_text: STRING_8
			-- Textual representation of current value
			-- (Create a new string at each call.)
		do
			create Result.make (15)
			append_to_string (Result)
		ensure
			to_text_not_void: Result /= Void
			to_text_is_string_8: Result.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string_8: a_string.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		deferred
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
