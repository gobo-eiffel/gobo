note

	description:

		"LSP identifiers referring to a change annotation managed by a workspace edit"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CHANGE_ANNOTATION_IDENTIFIER

inherit

	LS_ANY

convert

	value: {READABLE_STRING_GENERAL}

feature -- Access

	utf8_value: STRING_8
			-- String value
			-- (using UTF-8 encoding)
		do
			Result := to_string.utf8_value
		ensure
			utf8_value_not_void: Result /= Void
			utf8_value_is_string_8: Result.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	value: READABLE_STRING_GENERAL
			-- String value
		do
			Result := to_string.value
		ensure
			value_not_void: Result /= Void
			valid_unicode: across 1 |..| Result.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (Result.code (l_index.item)) end
			same_as_utf8_value_if_ascii: ({UC_UTF8_ROUTINES}.unicode_character_count (utf8_value) = utf8_value.count) implies Result = utf8_value
		end

	to_string: LS_STRING
			-- String representation
		deferred
		ensure
			to_string_not_void: Result /= Void
		end

end
