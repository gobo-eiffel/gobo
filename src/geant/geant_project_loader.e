indexing

	description:

		"Geant project laoders"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_LOADER

inherit

	ANY
	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (a_build_filename: UC_STRING) is
			-- Initialize project loader.
		require
			a_build_filename_not_void: a_build_filename /= Void
			a_build_filename_not_empty: a_build_filename.count > 0
		local
			msg: STRING
		do
			build_filename := a_build_filename
			if not file_system.is_file_readable (build_filename.out) then
				msg := clone ("cannot read build file '")
				msg.append_string (build_filename.out)
				msg.append_string ("' (Current working directory: ")
				msg.append_string (file_system.current_working_directory)
				msg.append_string (")%N")
				exit_application (1,  msg)
			end

		ensure
			build_filename_set: build_filename = a_build_filename
		end

feature -- Access

	build_filename: UC_STRING
			-- Name of the file containing the configuration
			-- information to build a project

	project_element: GEANT_PROJECT_ELEMENT
			-- Project element of build script

feature -- Processing

	load (a_variables: GEANT_VARIABLES; a_options: GEANT_PROJECT_OPTIONS) is
			-- Read current project's configuration from `build_filename'
			-- and convert it into a 'GEANT_DOM'.
		require
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			a_project_parser: GEANT_PROJECT_PARSER
	    do
			create a_file.make (build_filename.out)
			a_file.open_read
			if a_file.is_open_read then
				create a_project_parser.make (a_variables, a_options, build_filename)
				a_project_parser.parse_file (a_file)
				a_file.close
				project_element := a_project_parser.last_project_element
			else
				std.error.put_string ("cannot read file '" + build_filename.out + "':")
			end

			if a_project_parser.last_project_element = Void then
				exit_application (1, "Parsing error in file %"" + build_filename.out + "%"%N")
			end

	    end

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: build_filename.count > 0

end
