indexing

  description:
        "gelex command"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  "Sven Ehrke and others"
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
			a_size := ""
			outfile := ""
			gelex_input_filename := ""
		end

	execute is
		require
			gelex_input_filename_not_void : gelex_input_filename /= Void
			gelex_input_filename_not_empty : not gelex_input_filename.is_empty
			meta_ecs implies not full
			full implies not meta_ecs
		local
			cmd	: STRING
		do
			cmd := "gelex "

			-- -a
			if size /= void and then not size.is_empty then
				cmd.append("-a ")
				cmd.append(size.out)
			end

			-- -b
			if backup then
				cmd.append("-b ")
			end

			-- -e
			--!! ecs is the default. there seems no way to set it to false
			if ecs then
				cmd.append("-e ")
			end

			-- -f
			if full then
				cmd.append("-f ")
			end

			-- -i
			if case_insensitive then
				cmd.append("-i ")	--?? how do I set it to false ?
			end

			-- -m
			if meta_ecs then
				cmd.append("-m ")	--?? how do I set it to false ?
			end

			-- -s
			if no_default then
				cmd.append("-s ")
			end

			-- -w
			if no_warn then
				cmd.append("-w ")
			end

			-- -x
			if separate_actions then
				cmd.append("-x ")
			end

			-- -o
			if outfile /= void and then not outfile.is_empty then
				cmd.append("-o ")
				cmd.append(outfile)
				cmd.append(" ")
			end

			cmd.append(gelex_input_filename)

			log("  [gelex] " + cmd + "%N")
			system(cmd)
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
