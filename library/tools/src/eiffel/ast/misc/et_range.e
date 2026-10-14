note

	description:

		"Position ranges in Eiffel texts. The end position is exclusive."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_RANGE

inherit

	HASHABLE

create

	make,
	make_start_position

feature {NONE} -- Initialization

	make (a_start_line, a_start_column, a_end_line, a_end_column: INTEGER)
			-- Create a new range.
		require
			a_start_line_not_negative: a_start_line >= 0
			a_start_column_not_negative: a_start_column >= 0
			a_end_line_not_negative: a_end_line >= 0
			a_end_column_not_negative: a_end_column >= 0
		do
			start_line := a_start_line
			start_column := a_start_column
			end_line := a_end_line
			end_column := a_end_column
		ensure
			start_line_set: start_line = a_start_line
			start_column_set: start_column = a_start_column
			end_line_set: end_line = a_start_line
			end_column_set: end_column = a_start_column
		end

	make_start_position (a_line, a_column: INTEGER)
			-- Create a new range with its start position.
		require
			a_line_not_negative: a_line >= 0
			a_column_not_negative: a_column >= 0
		do
			make (a_line, a_column, a_line, a_column)
		ensure
			start_line_set: start_line = a_line
			start_column_set: start_column = a_column
			end_line_set: start_line = a_line
			end_column_set: start_column = a_column
		end

feature -- Access

	start_line: INTEGER
			-- Line number of start position
			-- (0 means unknow line number or overflow)

	start_column: INTEGER
			-- Column number of start position
			-- (0 means unknow column number or overflow)

	end_line: INTEGER
			-- Line number of end position
			-- (0 means unknow line number or overflow)

	end_column: INTEGER
			-- Column number of end position
			-- (0 means unknow column number or overflow)

	hash_code: INTEGER
			-- Hash code value
		do
			Result := start_line
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	null_range: ET_RANGE
			-- Null range
		once
			create Result.make_start_position (0, 0)
		ensure
			null_range_not_void: Result /= Void
			instance_free: class
		end

feature -- Setting

	set_start_position (a_line, a_column: INTEGER)
			-- Set `start_line` to `a_line` and `start_column` to `a_column`.
		require
			a_line_not_negative: a_line >= 0
			a_column_not_negative: a_column >= 0
		do
			start_line := a_line
			start_column := a_column
		ensure
			start_line_set: start_line = a_line
			start_column_set: start_column = a_column
		end

	set_end_position (a_line, a_column: INTEGER)
			-- Set `end_line` to `a_line` and `end_column` to `a_column`.
		require
			a_line_not_negative: a_line >= 0
			a_column_not_negative: a_column >= 0
		do
			end_line := a_line
			end_column := a_column
		ensure
			end_line_set: end_line = a_line
			end_column_set: end_column = a_column
		end

feature -- Status report

	contains (a_position: ET_POSITION): BOOLEAN
			-- Does current range contain `a_position`?
		require
			a_position_not_void: a_position /= Void
		local
			l_line: INTEGER
			l_column: INTEGER
		do
			l_line := a_position.line
			l_column := a_position.column
			if l_line > start_line and l_line < end_line then
				Result := True
			elseif l_line < start_line or l_line > end_line then
				Result := False
			elseif l_line = start_line and then l_column < start_column then
				Result := False
			elseif l_line = end_line and then l_column >= end_column then
				Result := False
			else
				Result := True
			end
		end

	is_before (a_position: ET_POSITION): BOOLEAN
			-- Is current range before `a_position`?
		require
			a_position_not_void: a_position /= Void
		local
			l_line: INTEGER
		do
			l_line := a_position.line
			if end_line < l_line then
				Result := True
			elseif end_line = l_line then
				Result := end_column <= a_position.column
			end
		end

	is_after (a_position: ET_POSITION): BOOLEAN
			-- Is current range after `a_position`?
		require
			a_position_not_void: a_position /= Void
		local
			l_line: INTEGER
		do
			l_line := a_position.line
			if l_line < start_line then
				Result := True
			elseif l_line = start_line then
				Result := a_position.column < start_column
			end
		end

invariant

	start_line_not_negative: start_line >= 0
	start_column_not_negative: start_column >= 0
	end_line_not_negative: end_line >= 0
	end_column_not_negative: end_column >= 0

end
