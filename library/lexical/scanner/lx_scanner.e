indexing

	description:

		"Scanners"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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
			{LX_TABLES} all
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
		do
			if yy_rules.valid_index (yy_act) then
				yy_rule := yy_rules.item (yy_act)
				if yy_rule.has_trail_context then
					if yy_rule.trail_count > 0 then
						yy_position := yy_position - yy_rule.trail_count
					elseif yy_rule.head_count > 0 then
						yy_position := yy_position + yy_rule.head_count
					else
							-- The rule has trailing context and both
							-- the head and trail have variable size.
							-- The work is done using another mechanism
							-- (varaible_trail_context) (implies
							-- performance degradation.)
					end
				end
				if yy_position > yy_start_position then
					input_buffer.set_beginning_of_line
						(yy_content.item (yy_position - 1) = '%N')
				end
				yy_rule.action.execute
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		local
			yy_rule: LX_RULE
		do
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
		end

end -- class LX_SCANNER
