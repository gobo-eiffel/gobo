indexing

	description:

		"Gelex commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GELEX_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'gelex' command.
		do
			precursor (a_project)
			output_filename := ""
			input_filename := ""
				-- Set defaults:
			size := ""
			ecs := True
			meta_ecs := True
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := input_filename /= Void and then input_filename.count > 0 and
				(full implies not meta_ecs)
		ensure then
			input_filename_not_void: Result implies input_filename /= Void
			input_filename_not_empty: Result implies input_filename.count > 0
			not_meta_ecs_when_full: full implies not meta_ecs
		end

feature -- Access

	size: STRING
			-- -a option, default: 1000

	backup: BOOLEAN
			-- -b option, default: false

	ecs: BOOLEAN
			-- -e option, default: true

	full: BOOLEAN
			-- -f option, default: false

	case_insensitive: BOOLEAN
			-- -i option, default: false

	meta_ecs: BOOLEAN
			-- -m option, default: true
			-- (check that full is false, since this option does not make sense together with full)

	no_default: BOOLEAN
			-- -s option, default: false

	no_warn: BOOLEAN
			-- -w option, default: false

	separate_actions: BOOLEAN
			-- -x option, default: false

	output_filename: STRING
			-- -o option;
			-- if omitted output goes to stdout

	input_filename: STRING
			-- Input filename

feature -- Setting

	set_size (a_size: STRING) is
			-- Set `size' to `a_size'.
		require
			a_size_not_void: a_size /= Void
			a_size_is_integer: a_size.is_integer
		do
			size := a_size
		ensure
			size_set: size = a_size
		end

	set_backup (b: BOOLEAN) is
			-- Set `backup' to `b'.
		do
			backup := b
		ensure
			backup_set: backup = b
		end

	set_ecs (b : BOOLEAN) is
			-- Set `ecs' to `b'.
		do
			ecs := b
		ensure
			ecs_set: ecs = b
		end

	set_full (b: BOOLEAN) is
			-- Set `full' to `b'.
		do
			full := b
		ensure
			full_set: full = b
		end

	set_case_insensitive (b: BOOLEAN) is
			-- Set `case_insensitive' to `b'.
		do
			case_insensitive := b
		ensure
			case_insensitive_set: case_insensitive = b
		end

	set_meta_ecs (b: BOOLEAN) is
			-- Set `meta_ecs' to `b'.
		do
			meta_ecs := b
		ensure
			meta_ecs_set: meta_ecs = b
		end

	set_no_default (b: BOOLEAN) is
			-- Set `no_default' to `b'.
		do
			no_default := b
		ensure
			no_default_set: no_default = b
		end

	set_no_warn (b: BOOLEAN) is
			-- Set `no_warn' to `b'.
		do
			no_warn := b
		ensure
			no_warn_set: no_warn = b
		end

	set_separate_actions (b: BOOLEAN) is
			-- Set `separate_actions' to `b'.
		do
			separate_actions := b
		ensure
			separate_actions_set: separate_actions = b
		end

	set_output_filename (a_filename: like output_filename ) is
			-- Set `output_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

	set_input_filename (a_filename: like input_filename) is
			-- Set `input_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			input_filename := a_filename
		ensure
			input_filename_set: input_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_filename: STRING
		do
			create cmd.make (128)
			cmd.append_string ("gelex ")
				-- Option -a
			if size /= Void and then size.count > 0 then
				cmd.append_string ("-a ")
				cmd := STRING_.appended_string (cmd, size.out)
			end
				-- Option -b
			if backup then
				cmd.append_string ("-b ")
			end
				-- Option -f
			if full then
				cmd.append_string ("-f ")
			elseif not ecs or not meta_ecs then
				cmd.append_string ("-c ")
			end
				-- Option -e
			if ecs then
				cmd.append_string ("-e ")
			end
				-- Option -m
			if meta_ecs then
				cmd.append_string ("-m ")
			end
				-- Option -i
			if case_insensitive then
				cmd.append_string ("-i ")
			end
				-- Option -s
			if no_default then
				cmd.append_string ("-s ")
			end
				-- Option -w
			if no_warn then
				cmd.append_string ("-w ")
			end
				-- Option -x
			if separate_actions then
				cmd.append_string ("-x ")
			end
				-- Option -o
			if output_filename /= Void and then output_filename.count > 0 then
				cmd.append_string ("-o ")
				a_filename := file_system.pathname_from_file_system (output_filename, unix_file_system)
				cmd := STRING_.appended_string (cmd, a_filename)
				cmd.append_string (" ")
			end
			a_filename := file_system.pathname_from_file_system (input_filename, unix_file_system)
			cmd := STRING_.appended_string (cmd, a_filename)

			project.trace (<<"  [gelex] ", cmd>>)
			execute_shell (cmd)
		end

end
