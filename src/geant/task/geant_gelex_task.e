indexing

	description:

		"gelex task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GELEX_TASK
	inherit
		GEANT_GELEX_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element


	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		do
			-- size
			if has_attribute_uc(a_el, Attribute_name_size) then
				set_size(get_attribute_value(a_el, Attribute_name_size.out))
			end

			-- backup
			if has_attribute_uc(a_el, Attribute_name_backup) then
				set_backup(get_boolean_value(a_el, Attribute_name_backup.out))
			end

			-- ecs
			if has_attribute_uc(a_el, Attribute_name_ecs) then
				set_ecs(get_boolean_value(a_el, Attribute_name_ecs.out))
			end

			-- full
			if has_attribute_uc(a_el, Attribute_name_full) then
				set_full(get_boolean_value(a_el, Attribute_name_full.out))
			end

			-- case_insensitive
			if has_attribute_uc(a_el, Attribute_name_case_insensitive) then
				set_case_insensitive(get_boolean_value(a_el, Attribute_name_case_insensitive.out))
			end

			-- case_meta_ecs
			if has_attribute_uc(a_el, Attribute_name_meta_ecs) then
				set_meta_ecs(get_boolean_value(a_el, Attribute_name_meta_ecs.out))
			end

			-- no_default
			if has_attribute_uc(a_el, Attribute_name_no_default) then
				set_no_default(get_boolean_value(a_el, Attribute_name_no_default.out))
			end

			-- no_warn
			if has_attribute_uc(a_el, Attribute_name_no_warn) then
				set_no_warn(get_boolean_value(a_el, Attribute_name_no_warn.out))
			end

			-- separate_actions
			if has_attribute_uc(a_el, Attribute_name_separate_actions) then
				set_separate_actions(get_boolean_value(a_el, Attribute_name_separate_actions.out))
			end

			-- outfile
			if has_attribute_uc(a_el, Attribute_name_outfile) then
				set_outfile(get_attribute_value(a_el, Attribute_name_outfile.out))
			end

			-- input_filename
			set_gelex_input_filename(get_attribute_value(a_el, Attribute_name_input_filename.out))

		end

	Attribute_name_size : UC_STRING is
			-- Name of xml attribute for size
		once
			!!Result.make_from_string("size")
		end

	Attribute_name_backup : UC_STRING is
			-- Name of xml attribute for backup
		once
			!!Result.make_from_string("backup")
		end

	Attribute_name_ecs : UC_STRING is
			-- Name of xml attribute for ecs
		once
			!!Result.make_from_string("ecs")
		end

	Attribute_name_full : UC_STRING is
			-- Name of xml attribute for full
		once
			!!Result.make_from_string("full")
		end

	Attribute_name_case_insensitive : UC_STRING is
			-- Name of xml attribute for case_insensitive
		once
			!!Result.make_from_string("case_insensitive")
		end

	Attribute_name_meta_ecs : UC_STRING is
			-- Name of xml attribute for meta_ecs
		once
			!!Result.make_from_string("meta_ecs")
		end

	Attribute_name_no_default : UC_STRING is
			-- Name of xml attribute for no_default
		once
			!!Result.make_from_string("no_default")
		end

	Attribute_name_no_warn : UC_STRING is
			-- Name of xml attribute for no_warn
		once
			!!Result.make_from_string("no_warn")
		end

	Attribute_name_separate_actions : UC_STRING is
			-- Name of xml attribute for separate_actions
		once
			!!Result.make_from_string("separate_actions")
		end

	Attribute_name_outfile : UC_STRING is
			-- Name of xml attribute for outfile
		once
			!!Result.make_from_string("outfile")
		end

	Attribute_name_input_filename : UC_STRING is
			-- Name of xml attribute for input_filename
		once
			!!Result.make_from_string("input_filename")
		end


end
