indexing

	description:

		"Command lines for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_COMMAND_LINE

inherit

	ARGUMENTS

	KL_SHARED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new command line.
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Parsing

	read_options (options: LX_DESCRIPTION) is
			-- Read options from the command line
			-- and update `options' accordingly.
		require
			options_not_void: options /= Void
		local
			i, nb: INTEGER
			exit: BOOLEAN
			arg: STRING
			equiv_classes_used: BOOLEAN
			meta_equiv_classes_used: BOOLEAN
			j, arg_count: INTEGER
			str: STRING
			a_size: INTEGER
		do
				-- Read options.
			from
				i := 1
				nb := argument_count
			until
				exit or i > nb
			loop
				arg := argument (i)
				arg_count := arg.count
				if arg_count < 2 or arg.item (1) /= '-' then
					exit := True
				elseif arg.is_equal ("--") then
						-- End of options
					exit := True
					i := i + 1
				elseif arg.is_equal ("--version") then
					error_handler.version_message
					i := i + 1
				elseif arg.is_equal ("--help") then
					error_handler.usage_message
					i := i + 1
				else
					inspect arg.item (2)
					when 'o' then
						if arg_count > 2 then
							options.set_output_filename
								(arg.substring (3, arg_count))
						elseif i < nb then
							i := i + 1
							options.set_output_filename (argument (i))
						else
							options.set_output_filename (Void)
							error_handler.usage_message
						end
					when 'a' then
						str := Void
						if arg_count > 2 then
							str := arg.substring (3, arg_count)
						elseif i < nb then
							i := i + 1
							str := argument (i)
						end
						if str /= Void and then string_.is_integer (str) then
							a_size := str.to_integer
							if a_size >= 0 then
								options.set_array_size (a_size)
							else
								error_handler.usage_message
							end
						else
							error_handler.usage_message
						end
					else
						from j := 2 until j > arg_count loop
							inspect arg.item (j)
							when 'a' then
								error_handler.separated_a_flag
							when 'b' then
								options.set_backing_up_report (True)
							when 'c' then
								options.set_equiv_classes_used (False)
								options.set_meta_equiv_classes_used (False)
								options.set_full_table (False)
							when 'd' then
								options.set_debug_mode (True)
							when 'e' then
								equiv_classes_used := True
							when 'f' then
								options.set_equiv_classes_used (False)
								options.set_meta_equiv_classes_used (False)
								options.set_full_table (True)
							when '?', 'h' then
								error_handler.usage_message
							when 'i' then
								options.set_case_insensitive (True)
							when 'm' then
								meta_equiv_classes_used := True
							when 'o' then
								error_handler.separated_o_flag
							when 's' then
								options.set_no_default_rule (True)
							when 'V' then
								error_handler.version_message
							when 'w' then
								options.set_no_warning (True)
								error_handler.set_no_warning (True)
--							when 'F' then
--								options.set_equiv_classes_used (False)
--								options.set_meta_equiv_classes_used (False)
--								options.set_full_speed (True)
--							when 'p' then
--								-- TO DO (performance)
--							when 'T' then
--								options.set_trace_mode (True)
--							when 'v' then
--								options.set_print_stats (True)
							else
								error_handler.unknown_flag (arg.item (j))
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
			if equiv_classes_used then
				options.set_equiv_classes_used (True)
			end
			if meta_equiv_classes_used then
				options.set_meta_equiv_classes_used (True)
			end
				-- Read file names.
			if i = nb then
				options.set_input_filename (argument (i))
			else
				error_handler.usage_message
			end
		end

feature -- Access

	error_handler: LX_LEX_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_error_handler (handler: like error_handler) is
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class LX_LEX_COMMAND_LINE
