indexing

	description:

		"Scanners"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_SCANNER

inherit

	YY_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton,
			make_with_file as make_scanner_with_file_skeleton,
			make_with_buffer as make_scanner_with_buffer_skeleton
		end

	LX_TABLES
		export
			{LX_TABLES} all;
			{ANY} to_tables, from_tables
		end

feature {NONE} -- Initialization

	make (tables: like to_tables) is
			-- Create a new scanner with standard input as input file.
			-- Build the scanner with information contained in `tables'.
		require
			tables_not_void: tables /= Void
		do
			make_from_tables (tables)
			make_scanner_skeleton
		end

	make_with_file (a_file: like INPUT_STREAM_TYPE; tables: like to_tables) is
			-- Create a new scanner with `a_file' as input file.
			-- Build the scanner with information contained in `tables'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
			tables_not_void: tables /= Void
		do
			make_from_tables (tables)
			make_scanner_with_file_skeleton (a_file)
		end

	make_with_buffer (a_buffer: like input_buffer; tables: like to_tables) is
			-- Create a new scanner with `a_buffer' as input buffer.
			-- Build the scanner with information contained in `tables'.
		require
			a_buffer_not_void: a_buffer /= Void
			tables_not_void: tables /= Void
		do
			make_from_tables (tables)
			make_scanner_with_buffer_skeleton (a_buffer)
		ensure
			input_buffer_set: input_buffer = a_buffer
		end

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (0 <= sc and sc <= (yy_start_conditions.count - 1))
		end

feature {NONE} -- Implementation

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		local
			yy_rule: LX_RULE
			line_count, column_count, head_count: INTEGER
		do
			if yy_rules.valid_index (yy_act) then
				yy_rule := yy_rules.item (yy_act)
				if yy_rule.has_trail_context then
						-- `yy_rule' has trailing context.
					if yy_rule.trail_count >= 0 then
							-- The trail has a fixed size.
						yy_end := yy_end - yy_rule.trail_count
					elseif yy_rule.head_count >= 0 then
							-- The head has a fixed size.
						yy_end := yy_start + yy_more_len + yy_rule.head_count
					else
							-- The rule has trailing context and both
							-- the head and trail have variable size.
							-- The work is done using another mechanism
							-- (varaible_trail_context) (implies
							-- performance degradation.)
					end
				end
				if yyLine_used then
					line_count := yy_rule.line_count
					column_count := yy_rule.column_count
					if line_count = 0 then
						if column_count > 0 then
							yy_column := yy_column + column_count
						elseif column_count /= 0 then
								-- yy_column := yy_column + text_count
							yy_column := yy_column + yy_end - yy_start - yy_more_len
						end
					elseif line_count > 0 then
						if column_count = 0 then
							yy_line := yy_line + line_count
						elseif column_count > 0 then
							yy_line := yy_line + line_count
							yy_column := column_count + 1
						else
							yy_set_column (line_count)
						end
					else
						if column_count >= 0 then
							yy_set_line (column_count)
						else
							yy_set_line_column
						end
					end
				end
				if yyPosition_used then
					head_count := yy_rule.head_count
					if head_count > 0 then
						yy_position := yy_position + head_count
					elseif head_count /= 0 then
							-- yy_position := yy_position + text_count
						yy_position := yy_position + yy_end - yy_start - yy_more_len
					end
				end
				pre_action
				yy_rule.action.execute
				post_action
				if yy_end > yy_start then
					input_buffer.set_beginning_of_line
						(yy_content.item (yy_end - 1) = yyNew_line_character)
				end
			else
				pre_action
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
				post_action
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		local
			yy_rule: LX_RULE
		do
			pre_eof_action
			if yy_eof_rules.valid_index (yy_sc) then
				yy_rule := yy_eof_rules.item (yy_sc)
				if yy_rule /= Void then
					yy_rule.action.execute
				else
					terminate
				end
			else
				terminate
			end
			post_eof_action
		end

end -- class LX_SCANNER
