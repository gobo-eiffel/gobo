indexing

	description:

		"geyacc task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
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
			if has_attribute_uc(a_el, Attribute_name_separate_actions) then
				set_separate_actions(get_boolean_value(a_el, Attribute_name_separate_actions.out))
			end

			-- verbose_filename
			if has_attribute_uc(a_el, Attribute_name_verbose_filename) then
				set_verbose_filename(get_attribute_value(a_el, Attribute_name_verbose_filename.out))
			end

			-- eiffel_tokens_classname
			if has_attribute_uc(a_el, Attribute_name_eiffel_tokens_classname) then
				set_eiffel_tokens_classname(get_attribute_value(a_el, Attribute_name_eiffel_tokens_classname.out))
			end

			-- eiffel_parser_filename
			if has_attribute_uc(a_el, Attribute_name_eiffel_parser_filename) then
				set_eiffel_parser_filename(get_attribute_value(a_el, Attribute_name_eiffel_parser_filename.out))
			end

			-- grammar_filename
			set_grammar_filename(get_attribute_value(a_el, Attribute_name_grammar_filename.out))

		end

feature -- Xml attributes
	Attribute_name_separate_actions : UC_STRING is
			-- Name of xml attribute for separate_actions
		once
			!!Result.make_from_string("separate_actions")
		end

	Attribute_name_verbose_filename : UC_STRING is
			-- Name of xml attribute for verbose_filename
		once
			!!Result.make_from_string("verbose_filename")
		end

	Attribute_name_eiffel_tokens_classname : UC_STRING is
			-- Name of xml attribute for eiffel_tokens_classname
		once
			!!Result.make_from_string("eiffel_tokens_classname")
		end

	Attribute_name_eiffel_parser_filename : UC_STRING is
			-- Name of xml attribute for eiffel_parser_filename
		once
			!!Result.make_from_string("eiffel_parser_filename")
		end

	Attribute_name_grammar_filename : UC_STRING is
			-- Name of xml attribute for grammar_filename
		once
			!!Result.make_from_string("eiffel_grammar_filename")
		end

end
