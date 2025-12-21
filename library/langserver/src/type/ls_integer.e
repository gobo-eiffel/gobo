note

	description:

		"LSP integer numbers in the range of -2^31 to 2^31 - 1"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INTEGER

inherit

	LS_REQUEST_ID
		redefine
			is_equal
		end

	LS_PROGRESS_TOKEN
		redefine
			is_equal
		end

	LS_OPTIONAL_VERSION
		redefine
			is_equal
		end

	LS_OPTIONAL_INTEGER
		redefine
			is_equal
		end

	LS_DIAGNOSTIC_SEVERITY
		undefine
			value
		redefine
			is_equal
		end

	LS_DIAGNOSTIC_TAG
		undefine
			value
		redefine
			is_equal
		end

	LS_DIAGNOSTIC_CODE
		redefine
			is_equal
		end

	LS_FILE_CHANGE_TYPE
		undefine
			value
		redefine
			is_equal
		end

	LS_SYMBOL_KIND
		undefine
			value
		redefine
			is_equal
		end

	LS_SYMBOL_TAG
		undefine
			value
		redefine
			is_equal
		end

	LS_TEXT_DOCUMENT_SYNC_KIND
		undefine
			value
		redefine
			is_equal
		end

	LS_TEXT_DOCUMENT_SAVE_REASON
		undefine
			value
		redefine
			is_equal
		end

	LS_COMPLETION_ITEM_KIND
		undefine
			value
		redefine
			is_equal
		end

	LS_COMPLETION_TRIGGER_KIND
		undefine
			value
		redefine
			is_equal
		end

	LS_COMPLETION_ITEM_TAG
		undefine
			value
		redefine
			is_equal
		end

	LS_INSERT_TEXT_MODE
		undefine
			value
		redefine
			is_equal
		end

	LS_INSERT_TEXT_FORMAT
		undefine
			value
		redefine
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

create

	make

convert

	make ({INTEGER_32}),
	value: {INTEGER_32}

feature {NONE} -- Initialization

	make (a_value: INTEGER_32)
			-- Create a new integer value from `a_value`.
		require
			valid_value: {LS_INTEGER}.valid_value (a_value)
		do
			value := a_value
		ensure
			value_set:value = a_value
		end

feature -- Status report

	valid_value (a_value: INTEGER_32): BOOLEAN
			-- Is `a_value` a valid value?
			-- (i.e. in the range of -2^31 to 2^31 - 1)
		do
			Result := True
		ensure
			definition: Result = (a_value >= -2_147_483_648 and a_value <= 2_147_483_647)
			instance_free: class
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other` considered equal to `Current`?
		do
			Result := other.value = value
		end

feature -- Access

	value: INTEGER_32
			-- Integer value

	to_integer: LS_INTEGER
			-- Integer representation
		do
			Result := Current
		end

	hash_code: INTEGER
			-- Hash value
		do
			Result := value.hash_code
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_integer (Current)
		end

invariant

	valid_value: {LS_INTEGER}.valid_value (value)

end
