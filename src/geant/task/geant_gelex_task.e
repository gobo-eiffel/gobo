indexing

  description:
        "gelex task"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  "Sven Ehrke and others"
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
			if has_attribute(a_el, attr_size) then
				set_size(get_attribute_value(a_el, attr_size))
			end

			-- backup
			if has_attribute(a_el, attr_backup) then
				set_backup(get_boolean_value(a_el, attr_backup))
			end

			-- ecs
			if has_attribute(a_el, attr_ecs) then
				set_ecs(get_boolean_value(a_el, attr_ecs))
			end

			-- full
			if has_attribute(a_el, attr_full) then
				set_full(get_boolean_value(a_el, attr_full))
			end

			-- case_insensitive
			if has_attribute(a_el, attr_case_insensitive) then
				set_case_insensitive(get_boolean_value(a_el, attr_case_insensitive))
			end

			-- case_meta_ecs
			if has_attribute(a_el, attr_meta_ecs) then
				set_meta_ecs(get_boolean_value(a_el, attr_meta_ecs))
			end

			-- no_default
			if has_attribute(a_el, attr_no_default) then
				set_no_default(get_boolean_value(a_el, attr_no_default))
			end

			-- no_warn
			if has_attribute(a_el, attr_no_warn) then
				set_no_warn(get_boolean_value(a_el, attr_no_warn))
			end

			-- separate_actions
			if has_attribute(a_el, attr_separate_actions) then
				set_separate_actions(get_boolean_value(a_el, attr_separate_actions))
			end

			-- outfile
			if has_attribute(a_el, attr_outfile) then
				set_outfile(get_attribute_value(a_el, attr_outfile))
			end

			-- input_filename
			set_gelex_input_filename(get_attribute_value(a_el, attr_input_filename))

		end

attr_size				: STRING is "size"
attr_backup				: STRING is "backup"
attr_ecs				: STRING is "ecs"
attr_full				: STRING is "full"
attr_case_insensitive	: STRING is "case_insensitive"
attr_meta_ecs			: STRING is "meta_ecs"
attr_no_default			: STRING is "no_default"
attr_no_warn			: STRING is "no_warn"
attr_separate_actions	: STRING is "separate_actions"
attr_outfile			: STRING is "outfile"
attr_input_filename		: STRING is "input_filename"



end
