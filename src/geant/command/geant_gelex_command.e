indexing

	description:

		"gelex command"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GELEX_COMMAND
	inherit
		GEANT_COMMAND
		end
		KL_IMPORTED_STRING_ROUTINES
		end

	
creation
	make


-- ?? how do I set options which are true by default to false ?
	
feature
	make is
		do
			size := ""
			outfile := ""
			gelex_input_filename := ""
		end

	execute is
		local
			cmd	: STRING
		do
			cmd := "gelex "

			-- -a
			if size /= void and then not size.is_empty then
				cmd.append_string("-a ")
				cmd.append_string(size.out)
			end

			-- -b
			if backup then
				cmd.append_string("-b ")
			end

			-- -e
			--!! ecs is the default. there seems no way to set it to false
			if ecs then
				cmd.append_string("-e ")
			end

			-- -f
			if full then
				cmd.append_string("-f ")
			end

			-- -i
			if case_insensitive then
				cmd.append_string("-i ")	--?? how do I set it to false ?
			end

			-- -m
			if meta_ecs then
				cmd.append_string("-m ")	--?? how do I set it to false ?
			end

			-- -s
			if no_default then
				cmd.append_string("-s ")
			end

			-- -w
			if no_warn then
				cmd.append_string("-w ")
			end

			-- -x
			if separate_actions then
				cmd.append_string("-x ")
			end

			-- -o
			if outfile /= void and then not outfile.is_empty then
				cmd.append_string("-o ")
				cmd.append_string(outfile)
				cmd.append_string(" ")
			end

			cmd.append_string(gelex_input_filename)

			log("  [gelex] " + cmd + "%N")
			execute_command(cmd)
		end

	is_executable : BOOLEAN is
		do
			Result := gelex_input_filename /= Void and then not gelex_input_filename.is_empty
						and ((meta_ecs and not full) or (full and not meta_ecs))
		ensure then
			gelex_input_filename_not_void : Result implies gelex_input_filename /= Void
			gelex_input_filename_not_empty : Result implies not gelex_input_filename.is_empty
			meta_ecs implies not full
			full implies not meta_ecs
		end

	feature -- gelex commandline options setters
	set_size(a_size : STRING) is
		-- -a option, default: 3000
		require
			STRING_.is_integer(a_size)
		do
			size := a_size
		end

	set_backup(a_backup : BOOLEAN) is
		-- -b option, default: false
		do
			backup := a_backup
		end

	set_ecs(a_ecs : BOOLEAN) is
		-- -e option, default: true
		--?? how can one set it to false ?
		do
			ecs := a_ecs
		end

	set_full(a_full : BOOLEAN) is
		-- -f option, default: false
		do
			full := a_full
		end

	set_case_insensitive(a_case_insensitive : BOOLEAN) is
		-- -i option, default: true
		do
			case_insensitive := a_case_insensitive
		end

	set_meta_ecs(a_meta_ecs : BOOLEAN) is
		-- -m option, default: true
		--!! check that full is false, since this option does not make sense together with full
		do
			meta_ecs := a_meta_ecs
		end

	set_no_default(a_no_default : BOOLEAN) is
		-- -s option, default: false
		do
			no_default := a_no_default
		end

	set_no_warn(a_no_warn : BOOLEAN) is
		-- -w option, default: false
		do
			no_warn := a_no_warn
		end

	set_separate_actions(a_separate_actions : BOOLEAN) is
		-- -x option, default: false
		do
			separate_actions := a_separate_actions
		end

	set_outfile(a_outfile : STRING) is
		-- -o option
		-- if omitted output goes to stdout
		require
			outfile_not_void : a_outfile /= Void
			outfile_not_empty : not a_outfile.is_empty
		do
			outfile := a_outfile
		end

	set_gelex_input_filename(a_gelex_input_filename : STRING) is
		-- required
		require
			gelex_input_filename_not_void : a_gelex_input_filename /= Void
			gelex_input_filename_not_empty : not a_gelex_input_filename.is_empty
		do
			gelex_input_filename := a_gelex_input_filename
		end

	feature -- gelex commandline options
	size : STRING
		-- -a option, default: 3000

	backup : BOOLEAN
		-- -b option, default: false

	ecs : BOOLEAN
		-- -e option, default: true
		--?? how can one set it to false ?

	full : BOOLEAN
		-- -f option, default: false

	case_insensitive : BOOLEAN
		-- -i option, default: true

	meta_ecs : BOOLEAN
		-- -m option, default: true
		--!! check that full is false, since this option does not make sense together with full

	no_default : BOOLEAN
		-- -s option, default: false

	no_warn : BOOLEAN
		-- -w option, default: false

	separate_actions : BOOLEAN
		-- -x option, default: false

	outfile : STRING
		-- -o option
		-- if omitted output goes to stdout


	gelex_input_filename : STRING
		-- required

end
