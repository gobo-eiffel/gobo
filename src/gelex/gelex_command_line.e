indexing

	description:

		"Gobo Eiffel Lex command lines"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GELEX_COMMAND_LINE

inherit

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_ARGUMENTS

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
				nb := Arguments.argument_count
			until
				exit or i > nb
			loop
				arg := Arguments.argument (i)
				arg_count := arg.count
				if arg_count < 2 or arg.item (1) /= '-' then
					exit := True
				elseif arg.is_equal ("--") then
						-- End of options
					exit := True
					i := i + 1
				elseif arg.is_equal ("--version") then
					report_version_number
					i := i + 1
				elseif arg.is_equal ("--help") then
					report_usage_message
					i := i + 1
				else
					inspect arg.item (2)
					when 'o' then
						if arg_count > 2 then
							options.set_output_filename
								(arg.substring (3, arg_count))
						elseif i < nb then
							i := i + 1
							options.set_output_filename (Arguments.argument (i))
						else
							options.set_output_filename (Void)
							report_usage_error
						end
					when 'a' then
						str := Void
						if arg_count > 2 then
							str := arg.substring (3, arg_count)
						elseif i < nb then
							i := i + 1
							str := Arguments.argument (i)
						end
						if str /= Void and then STRING_.is_integer (str) then
							a_size := str.to_integer
							if a_size >= 0 then
								options.set_array_size (a_size)
							else
								report_usage_error
							end
						else
							report_usage_error
						end
					else
						from j := 2 until j > arg_count loop
							inspect arg.item (j)
							when 'a' then
								report_separated_flag_error ("-a")
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
								report_usage_message
							when 'i' then
								options.set_case_insensitive (True)
							when 'm' then
								meta_equiv_classes_used := True
							when 'o' then
								report_separated_flag_error ("-o")
							when 's' then
								options.set_no_default_rule (True)
							when 'V' then
								report_version_number
							when 'w' then
								options.set_no_warning (True)
							when 'x' then
								options.set_actions_separated (True)
							when 'z' then
								options.set_inspect_used (True)
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
								report_unknown_flag_error (arg.item (j).out)
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
				options.set_input_filename (Arguments.argument (i))
			else
				report_usage_error
			end
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
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

feature {NONE} -- Error handling

	report_separated_flag_error (a_flag: STRING) is
			-- Report that flag `a_flag' must be given separately
			-- and then terminate with exit status 1.
		require
			a_flag_not_void: a_flag /= Void
		local
			an_error: UT_SEPARATED_FLAG_ERROR
		do
			!! an_error.make (a_flag)
			error_handler.report_error (an_error)
			Exceptions.die (1)
		end

	report_unknown_flag_error (a_flag: STRING) is
			-- Report that `a_flag' in an unknown flag
			-- and then terminate with exit status 1.
		require
			a_flag_not_void: a_flag /= Void
		local
			an_error: UT_UNKNOWN_FLAG_ERROR
		do
			!! an_error.make (a_flag)
			error_handler.report_error (an_error)
			Exceptions.die (1)
		end

	report_usage_error is
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	report_usage_message is
			-- Report usage message and exit.
		do
			error_handler.report_message (Usage_message)
			Exceptions.die (0)
		end

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			!! a_message.make ("1.4")
			error_handler.report_message (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gelex usage message
		once
			!! Result.make
				("[--version] [--help] [-bcefhimsVwxz?]%N%
				%%T[-a size] [-o filename] [--] filename")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class GELEX_COMMAND_LINE
