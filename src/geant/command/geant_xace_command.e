indexing

  description:
        "xace command"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_XACE_COMMAND
	inherit
		GEANT_COMMAND

	
creation
	make

	
	
feature
	make is
		do
			options := ""
			compile := false
		end

	execute is
		local
			cmd	: STRING
		do
			cmd := "xace "
			cmd.append(options)
			cmd.append(" --" + command)
			cmd.append(" --" + command_options)
			cmd.append(" " + xace_filename)
			print("  [xace] " + cmd + "%N")
			system(cmd)

			if compile then
				cmd := "compile se.ace"
				log("  [xace] " + cmd + "%N")
				system(cmd)
			end
		end

	is_executable : BOOLEAN is
		do
			Result := command /= Void and then not command.is_empty and then
					command_options /= Void and then not command_options.is_empty
		ensure then
			command_not_void : Result implies command /= Void
			command_not_empty: Result implies not command.is_empty

			command_options_not_void : Result implies command_options /= Void
			command_options_not_empty: Result implies not command_options.is_empty
		end

	set_var(a_name, a_value : STRING) is
		require
			name_not_void : a_name /= Void
			name_not_empty: not a_name.is_empty
			value_not_void : a_value /= Void
		do
			vars.force(a_name, a_value)
		end

	set_options(a_options : STRING) is
		require
			options_not_void : a_options /= Void
		do
			options := a_options
		end

	set_command(a_command : STRING) is
		require
			command_not_void : a_command /= Void
			command_not_empty: not a_command.is_empty
		do
			command := a_command
		end

	set_command_options(a_command_options : STRING) is
		require
			command_options_not_void : a_command_options /= Void
		do
			command_options := a_command_options
		end

	set_xace_filename(a_xace_filename : STRING) is
		require
			xace_filename_not_void : a_xace_filename /= Void
			xace_filename_not_empty: not a_xace_filename.is_empty
		do
			xace_filename := a_xace_filename
		end

	set_compile(a_compile : BOOLEAN) is
		-- should compilation be started right after generation ?, default: false
		do
			compile := a_compile
--!!1 print("setting compile to " + compile.out)
		end


	vars : DS_HASH_TABLE [STRING, STRING] is
		once
			!!Result.make(1)
		end

	options : STRING

	command : STRING

	command_options : STRING

	xace_filename : STRING

	compile : BOOLEAN
		-- should compilation be started right after generation ?
		-- default: false
		-- implementation note: do not use compile as name here, causes conflicts

end
