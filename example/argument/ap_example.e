indexing

	description:

		"Ficticious application to demonstrate the use of the command line parsing library"

	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_EXAMPLE

inherit

	KL_SHARED_STANDARD_FILES

create

	make

feature {NONE} -- Initialization 

	make is
			-- Run the application with options.
		local
			alternative_options_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
				-- Create the parser.
			create parser.make
				-- Describe the application.
			parser.set_application_description ("This is an example application to demonstrate the GOBO argument parsing library.")
				-- What kind of parameters does this program require?
			parser.set_parameters_description ("parameters ...")
				-- We create a flag and add it to the parser. It has the
				-- short form 'f' and the long form 'flag'.
			create example_flag.make ('f', "flag")
			example_flag.set_description ("An example flag.")
			parser.options.force_last (example_flag)
				-- We create an option that takes a string as argument. It
				-- only has a long form 'string' and its argument is
				-- described by 'arg'.
			create example_string_option.make_with_long_form ("string")
			example_string_option.set_description ("An option that takes a string as argument.")
			parser.options.force_last (example_string_option)
				-- We create another string option, this time making the 
				-- parameter optional.			
			create example_ostring_option.make_with_long_form ("ostring")
			example_ostring_option.set_description ("An option that might take a string as argument.")
			example_ostring_option.set_parameter_as_optional
			parser.options.force_last (example_ostring_option)
				-- We create an option that takes an integer as argument.
				-- This option only has a short form, 'i'.
			create example_integer_option.make_with_short_form ('i')
			example_integer_option.set_description ("An option that takes an integer as argument.")
			parser.options.force_last (example_integer_option)
				-- We create a boolean option. Boolean options take either
				-- true or false, but they understand a larger set of similar
				-- specifications (like yes,no,1,0, ...).
				-- It is mandatory to supply this option.
			create example_boolean_option.make ('b', "boolean")
			example_boolean_option.set_description ("A boolean option that can take yes and no. (mandatory)")
			example_boolean_option.enable_mandatory
			parser.options.force_last (example_boolean_option)
				-- We create an enumeration option that can alternate between
				-- three different options: one, two and three.
			create example_enumeration_option.make ('e', "enumeration")
			example_enumeration_option.extend ("one")
			example_enumeration_option.extend ("two")
			example_enumeration_option.extend ("three")
			example_enumeration_option.set_description ("An enumeration option to choose between a set of possible values.")
			parser.options.force_last (example_enumeration_option)
				-- An alternative options list is a list that will offer an
				-- alternative set of options, introduced by a special
				-- option, the introducing option. One example of such an
				-- option is the automatically included help option. The
				-- option we introduce here is called 'alt'.
				-- It is possible to include existing or new options into the
				-- alternative options list.
			create alt_flag.make ('a', "alt")
			alt_flag.set_description ("Switch to an alternative set of options.")
			create alternative_options_list.make (alt_flag)
			create alt_string_option.make_with_long_form ("alt-string")
			alt_string_option.set_description ("This option will only work in the alternative mode.")
			alternative_options_list.force_last (alt_string_option)
			alternative_options_list.force_last (example_integer_option)
			parser.alternative_options_lists.force_first (alternative_options_list)
				-- Do actual argument parsing.
			parser.parse_arguments
			display_results
		end

	display_results is
			-- Display the results of the command line parsing.
		do
			if alt_flag.was_found then
				std.output.put_line ("The command line was used with the alternative set of options.")
			end
				-- It is possible to ask, how often an option was found.
			if example_flag.was_found then
				std.output.put_line ("The example flag was found" + example_flag.occurrences.out + " time(s).")
			end
			if example_string_option.was_found then
				std.output.put_line ("The example string option was passed the parameter %"" + example_string_option.parameter + "%"")
			end
			if example_ostring_option.was_found then
				if example_ostring_option.parameter = Void then
					std.output.put_line ("The example ostring option was passed, but without parameter.")
				else
					std.output.put_line ("The example string option was passed the parameter %"" + example_ostring_option.parameter + "%"")
				end
			end
			if example_integer_option.was_found then
				std.output.put_line ("The example integer option was passed the parameter " + example_integer_option.parameter.out)
			end
			if example_enumeration_option.was_found then
				std.output.put_line ("The example enumeration option was passed the parameter " + example_enumeration_option.parameter)
			end
			if example_boolean_option.was_found then
				if example_boolean_option.is_true then
					std.output.put_line ("The boolean option was set to true.")
				else
					std.output.put_line ("The boolean option was set to false.")
				end
			end
			if alt_string_option.was_found then
				std.output.put_line ("The alternative string option was passed the parameter %"" + alt_string_option.parameter + "%"")
			end
		end

feature -- Command Line Options

	example_flag: AP_FLAG
	example_string_option: AP_STRING_OPTION
	example_ostring_option: AP_STRING_OPTION
	example_integer_option: AP_INTEGER_OPTION
	example_enumeration_option: AP_ENUMERATION_OPTION
	example_boolean_option: AP_BOOLEAN_OPTION
			-- Options

	alt_flag: AP_FLAG
	alt_string_option: AP_STRING_OPTION
			-- Alternative options

feature {NONE} -- Implementation

	parser: AP_PARSER
			-- Argument parser

invariant

	example_flag_not_void: example_flag /= Void
	example_string_option_not_void: example_string_option /= Void
	example_integer_option_not_void: example_integer_option /= Void
	example_enumeration_option_not_void: example_enumeration_option /= Void
	example_boolean_option_not_void: example_boolean_option /= Void
	alt_flag_not_void: alt_flag /= Void
	alt_string_option_not_void: alt_string_option /= Void

end
