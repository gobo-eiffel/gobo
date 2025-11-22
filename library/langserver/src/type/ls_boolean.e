note

	description:

		"LSP boolean values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_BOOLEAN

inherit

	LS_OPTIONAL_HOVER_OPTIONS
		redefine
			is_equal
		end

	LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
		redefine
			is_equal
		end

	LS_DID_OPEN_TEXT_DOCUMENT_OPTIONS
		redefine
			is_equal
		end

	LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS
		redefine
			is_equal
		end

	LS_WILL_SAVE_TEXT_DOCUMENT_OPTIONS
		redefine
			is_equal
		end

	LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_OPTIONS
		redefine
			is_equal
		end

create

	make,
	make_true,
	make_false

convert

	make ({BOOLEAN}),
	value: {BOOLEAN}

feature {NONE} -- Initialization

	make (a_value: BOOLEAN)
			-- Create a new boolean value from `a_value`.
		do
			value := a_value
		ensure
			value_set:value = a_value
		end

	make_true
			-- Create a new boolean value with value 'true'.
		do
			make (True)
		ensure
			is_true: value
		end

	make_false
			-- Create a new boolean value with value 'false'.
		do
			make (False)
		ensure
			is_false: not value
		end

feature -- Status report

	is_equal (other: like Current): BOOLEAN
			-- Is `other` considered equal to `Current`?
		do
			Result := other.value = value
		end

feature -- Access

	value: BOOLEAN
			-- Boolean value

	true_: LS_BOOLEAN
			-- true
		once
			create Result.make_true
		ensure
			true_not_void: Result /= Void
			is_true: Result.value
			instance_free: class
		end

	false_: LS_BOOLEAN
			-- false
		once
			create Result.make_false
		ensure
			false_not_void: Result /= Void
			is_false: not Result.value
			instance_free: class
		end

	to_boolean: LS_BOOLEAN
			-- Boolean representation
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_boolean (Current)
		end

feature -- Constants

	true_value: STRING_8 = "true"
	false_value: STRING_8 = "false"

end
