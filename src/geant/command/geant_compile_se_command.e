indexing

  description:
        "compilation command for SmallEiffel"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_COMPILE_SE_COMMAND
	inherit
		GEANT_COMMAND
		end

	
creation
	make

feature
	make is
		do
		end

	execute is
		require
			valid_configuration : valid_configuration

		local
			cmd	: STRING
		do
			if valid_ace_configuration then
				cmd := create_ace_cmdline
			else
				cmd := create_traditional_cmdline
			end

			log("  [compile_se] " + cmd + "%N")
			system(cmd)
		end

	valid_configuration : BOOLEAN is
		do
			Result := valid_ace_configuration or else valid_traditional_configuration
		end

	valid_ace_configuration : BOOLEAN is
		do
			Result := (ace_file /= void and then ace_file.count > 0) and not valid_traditional_configuration
		end

	valid_traditional_configuration : BOOLEAN is
		do
			Result :=
				(root_class /= void and then root_class.count > 0) and
				(executable /= void and then executable.count > 0) and not valid_ace_configuration
		end


	create_ace_cmdline : STRING is
		require
			valid_ace_configuration : valid_ace_configuration
		do
			!!Result.make_from_string("compile ")
			Result.append(ace_file)
		end

	create_traditional_cmdline : STRING is
		require
			valid_traditional_configuration : valid_traditional_configuration
		do
			!!Result.make_from_string("compile")

			Result.append(" -o "); Result.append(executable)


			if case_insensitive then
				Result.append(" -case_insensitive")
			end

			if no_style_warning then
				Result.append(" -no_style_warning")
			end

			Result.append(" "); Result.append(root_class)
			Result.append(" ")
			if creation_procedure /= void and then not creation_procedure.is_empty then
				Result.append(creation_procedure)
			else
				Result.append("make")
			end
		end

	set_case_insensitive(a_case_insensitive : BOOLEAN) is
		do
			case_insensitive := a_case_insensitive
		end

	set_no_style_warning(a_no_style_warning : BOOLEAN) is
		do
			no_style_warning := a_no_style_warning
		end

	set_executable(a_executable : STRING) is
		require
			executable_not_void : a_executable /= Void
			executable_not_empty : not a_executable.is_empty
			-- if platform = windows ends with ".exe"
		do
			executable := a_executable
		end

	set_root_class(a_root_class : STRING) is
		require
			root_class_not_void : a_root_class /= Void
			root_class_not_empty : not a_root_class.is_empty
		do
			root_class := a_root_class
		end

	set_creation_procedure(a_creation_procedure : STRING) is
		require
			creation_procedure_not_void : a_creation_procedure /= Void
			creation_procedure_not_empty : not a_creation_procedure.is_empty
		do
			creation_procedure := a_creation_procedure
		end

	set_ace_file(a_ace_file : STRING) is
		require
			ace_file_not_void : a_ace_file /= Void
			ace_file_not_empty : not a_ace_file.is_empty
		do
			ace_file := a_ace_file
		end

--feature {NONE}
case_insensitive	: BOOLEAN
no_style_warning	: BOOLEAN
executable			: STRING
root_class			: STRING
creation_procedure	: STRING

ace_file			: STRING

end
