note

	description:

		"LSP number values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_NUMBER

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_literal: STRING_8)
			-- Create a new number value.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {LS_NUMBER}.valid_literal (a_literal)
		do
			literal := a_literal
		ensure
			literal_set: literal = a_literal
		end

feature -- Status report

	valid_literal (a_literal: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_literal` a valid value for `literal`?
		require
			a_literal_not_void: a_literal /= Void
		do
			Result := {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		ensure
			instance_free: class
			definition: Result = {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		end

	is_integer: BOOLEAN
			-- Is current number an integer?
		do
			Result := literal.is_integer and then {LS_INTEGER}.valid_value (literal.to_integer)
		end

	is_uinteger: BOOLEAN
			-- Is current number a uinteger?
		do
			Result := literal.is_natural_32 and then {LS_UINTEGER}.valid_value (literal.to_natural_32)
		end

feature -- Access

	literal: STRING_8
			-- Literal value

feature -- Conversion

	to_integer: LS_INTEGER
			-- Converted to integer
		require
			is_integer: is_integer
		do
			Result := literal.to_integer
		ensure
			to_integer_not_void: Result /= Void
		end

	to_uinteger: LS_UINTEGER
			-- Converted to uinteger
		require
			is_uinteger: is_uinteger
		do
			Result := literal.to_natural_32
		ensure
			to_uinteger_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][-+]?[0-9]+)?"
			-- Regular expression for `literal`

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_number (Current)
		end

invariant

	literal_not_void: literal /= Void
	valid_literal: valid_literal (literal)

end
