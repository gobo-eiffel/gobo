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
			xml_parser: GEANT_PROJECT_PARSER
			xml_parser_impl: XI_EVENT_PARSER
	    do
				-- Create xml parser:
			if Parser_factory.is_expat_event_available then
				xml_parser_impl := Parser_factory.new_expat_event_parser_imp
			elseif Parser_factory.is_eiffel_event_available then
				xml_parser_impl := Parser_factory.new_eiffel_event_parser_imp
			else
				exit_application (1, "geant error: no XML parser available%N")
			end
			create xml_parser.make_from_implementation (xml_parser_impl)
			xml_parser.parse_from_file_name (build_filename)

				-- Setup project's root element:
			if xml_parser.root_element = Void then
				exit_application (1, "Parsing error in file %"" + build_filename.out + "%"%N")
			end

			create project_element.make (xml_parser.root_element, a_variables, a_options, build_filename)

	    end

feature {NONE} -- Implementation

	Parser_factory: XM_PARSER_FACTORY is
			-- Factory to create xml parsers
		once
			create Result.make
		ensure
			parser_factory_not_void: Result /= Void
		end

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: build_filename.count > 0

end
