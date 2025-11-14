note

	description:

		"LSP unsigned integer numbers in the range of 0 to 2^31 - 1"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UINTEGER

inherit

	LS_WATCH_KIND
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

	make ({NATURAL_32})

feature {NONE} -- Initialization

	make (a_value: NATURAL_32)
			-- Create a new unsigned integer value from `a_value`.
		require
			valid_value: {LS_UINTEGER}.valid_value (a_value)
		do
			value := a_value
		ensure
			value_set:value = a_value
		end

feature -- Status report

	valid_value (a_value: NATURAL_32): BOOLEAN
			-- Is `a_value` a valid value?
			-- (i.e. in the range of 0 to 2^31 - 1)
		do
			Result := a_value <= 2_147_483_647
		ensure
			definition: Result = (a_value >= 0 and a_value <= 2_147_483_647)
			instance_free: class
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other` considered equal to `Current`?
		do
			Result := other.value = value
		end

feature -- Access

	value: NATURAL_32
			-- Unsigned integer value

	hash_code: INTEGER
			-- Hash value
		do
			Result := value.hash_code
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_uinteger (Current)
		end

invariant

	valid_value: {LS_UINTEGER}.valid_value (value)

end
