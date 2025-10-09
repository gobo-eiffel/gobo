note

	description:

		"JSON number values"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_NUMBER

inherit

	JN_VALUE

create

	make

feature {NONE} -- Initialization

	make (a_literal: STRING_8)
			-- Create a new number value.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {JN_NUMBER}.valid_literal (a_literal)
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

feature -- Access

	literal: STRING_8
			-- Literal value

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		do
			a_string.append_string (literal)
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_number (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][-+]?[0-9]+)?"
			-- Regular expression for `literal`

invariant

	literal_not_void: literal /= Void
	valid_literal: valid_literal (literal)

end
