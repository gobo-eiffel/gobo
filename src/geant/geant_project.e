indexing

	description:

		"Represents a geant project file"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_PROJECT
	inherit
		GEANT_ELEMENT_NAMES


creation
	make, make_with_filename
	
feature
	make_with_filename(a_filename : UC_STRING) is
		do
			build_filename := a_filename
		end


	make is
		-- create the project with the default filename `build.eant'
		do
			make_with_filename(ucs_default_build_filename)
		end

	load is
	    -- read the project configuration from `build_filename' and convert it into a 'GEANT_DOM'
	    require
			build_filename_not_void : build_filename /= Void
			build_filename_not_empty: not build_filename.is_empty
	    local
	        xml_parser  : GEANT_PROJECT_PARSER
	
	    do
			-- reset current state and create a parser
			reset
	        !! xml_parser.make_from_imp (factory.new_eiffel_event_parser_imp)
	        xml_parser.parse_from_file_name (build_filename)
	
			-- setup the prject element
	        project_element := xml_parser.root_element

			-- determine all the targets of the project
			targets := project_element.get_children_by_name(ucs_target)

			-- determine start target
			if argument_count /= 0 then
				!!start_target_name.make_from_string(argument(1))
			else
				start_target_name := project_element.get_attributevalue_by_name(ucs_default)
			end

			current_target_name := start_target_name

	    ensure
	        valid_project_element : project_element /= void
	        valid_start_target : start_target_name /= void and then start_target_name.count > 0
	    end


	reset is
		-- resets the current state of the project
		do
			project_element := void
			targets := void
		end

	project_element				: GEANT_ELEMENT
		-- the project element read

	targets				: DS_ARRAYED_LIST [GEANT_ELEMENT]
		-- contains all the target elements of a project file

	start_target_name	: UC_STRING
		-- the name of the target the build process starts with

	current_target_name	: UC_STRING
		-- while processing the targets this changes

	build_filename	: UC_STRING
		-- the name of the file containing the configuration information to build a eiffel project

	factory: expanded XM_PARSER_FACTORY
		-- the factory to create the parser


end
