indexing

  description:
        "geyacc task"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  "Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_GEYACC_TASK
	inherit
		GEANT_GEYACC_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element


	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		do
			-- separate_actions
			if has_attribute(a_el, attr_separate_actions) then
				set_separate_actions(get_boolean_value(a_el, attr_separate_actions))
			end

			-- verbose_filename
			if has_attribute(a_el, attr_verbose_filename) then
				set_verbose_filename(get_attribute_value(a_el, attr_verbose_filename))
			end

			-- eiffel_tokens_classname
			if has_attribute(a_el, attr_eiffel_tokens_classname) then
				set_eiffel_tokens_classname(get_attribute_value(a_el, attr_eiffel_tokens_classname))
			end

			-- eiffel_parser_filename
			if has_attribute(a_el, attr_eiffel_parser_filename) then
				set_eiffel_parser_filename(get_attribute_value(a_el, attr_eiffel_parser_filename))
			end

			-- grammar_filename
			set_grammar_filename(get_attribute_value(a_el, attr_grammar_filename))

		end

attr_separate_actions			: STRING is "separate_actions"
attr_verbose_filename			: STRING is "verbose_filename"
attr_eiffel_tokens_classname	: STRING is "eiffel_tokens_classname"
attr_eiffel_parser_filename		: STRING is "eiffel_parser_filename"
attr_grammar_filename			: STRING is "grammar_filename"

end
