note

	description:
	"[
		LSP ranges.

		A range in a text document expressed as (zero-based) start
		and end positions. A range is comparable to a selection in
		an editor. Therefore, the end position is exclusive. If you
		want to specify a range that contains a line including the
		line ending character(s) then use an end position denoting
		the start of the next line. For example:

			{
				start: { line: 5, character: 23 },
				end : { line: 6, character: 0 }
			}
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class LS_RANGE

inherit

	LS_EDIT_RANGE
		redefine
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (a_start: like start; a_end: like end_)
			-- Create a new range.
		require
			a_start_not_void: a_start /= Void
			a_end_not_void: a_end /= Void
		do
			start := a_start
			end_ := a_end
		ensure
			start_set: start = a_start
			end_set: end_ = a_end
		end

feature -- Status report

	contains (a_position: LS_POSITION): BOOLEAN
			-- Does current range contain `a_position`?
		require
			a_position_not_void: a_position /= Void
		do
			Result := start <= a_position and a_position < end_
		ensure
			definition: Result = (start <= a_position and a_position < end_)
		end

feature -- Access

	start: LS_POSITION
			-- The range's start position.

	end_: LS_POSITION
			-- The range's end position.

	hash_code: INTEGER
			-- Hash code value
		do
			Result := start.hash_code
		end

feature -- Setting

	set_start (a_start: like start)
			-- Set `start` to `a_start`.
		require
			a_start_not_void: a_start /= Void
		do
			start := a_start
		ensure
			start_set: start = a_start
		end

	set_end (a_end: like end_)
			-- Set `end_` to `a_end`.
		require
			a_end_not_void: a_end /= Void
		do
			end_ := a_end
		ensure
			end_set: end_ = a_end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other` equal to `Current`?
		do
			Result := other.start.is_equal (start) and other.end_.is_equal (end_)
		end

feature -- Field names

	start_name: STRING_8 = "start"
	end_name: STRING_8 = "end"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_range (Current)
		end

invariant

	start_not_void: start /= Void
	end_not_void: end_ /= Void

end
