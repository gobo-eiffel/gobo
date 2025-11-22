note

	description:

		"LSP file event types"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_FILE_CHANGE_TYPE

inherit

	LS_ANY

convert

	value: {INTEGER_32},
	to_integer: {LS_INTEGER}

feature -- Access

	value: INTEGER_32
			-- Integer value
		do
			Result := to_integer.value
		ensure
			definition: Result = to_integer.value
		end

	to_integer: LS_INTEGER
			-- Integer representation
		deferred
		ensure
			to_integer_not_void: Result /= Void
		end

end
