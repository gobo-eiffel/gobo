note

	description:
	"[
		LSP positions.

		Position in a text document expressed as zero-based line
		and zero-based character offset. A position is between two
		characters like an 'insert' cursor in an editor. Special
		values like for example -1 to denote the end of a line
		are not supported.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_POSITION

inherit

	LS_ANY
		undefine
			is_equal
		end

	COMPARABLE

create

	make

feature {NONE} -- Initialization

	make (a_line: like line; a_character: like character)
			-- Create a new position.
		require
			a_line_not_void: a_line /= Void
			a_character_not_void: a_character /= Void
		do
			line := a_line
			character := a_character
		ensure
			line_set: line = a_line
			character_set: character = a_character
		end

feature -- Access

	line: LS_UINTEGER
			-- Line position in a document (zero-based).

	character: LS_UINTEGER
			-- Character offset on a line in a document (zero-based). The meaning of this
			-- offset is determined by the negotiated `PositionEncodingKind`.
			--
			-- If the character value is greater than the line length it defaults back
			-- to the line length.

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			if line.value < other.line.value then
				Result := True
			elseif line.value = other.line.value then
				Result := character.value < other.character.value
			end
		end

feature -- Field names

	line_name: STRING_8 = "line"
	character_name: STRING = "character"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_position (Current)
		end

invariant

	line_not_void: line /= Void
	character_not_void: character /= Void

end
