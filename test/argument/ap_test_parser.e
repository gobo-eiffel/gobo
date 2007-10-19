indexing

	description:

		"Test argument parser"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class AP_TEST_PARSER

inherit

	TS_TEST_CASE

feature -- Tests

	test_make is
			-- Can we make a parser?
		local
			p: AP_PARSER
		do
			create p.make
			assert_integers_equal ("has_one_alternative_set", 1, p.alternative_options_lists.count)
			assert_integers_equal ("has_no_options_in_basic", 0, p.options.count)
			assert_integers_equal ("has_one_option", 1, p.all_options.count)
		end

	test_make_empty is
			-- Can we make an empty parser?
		local
			p: AP_PARSER
		do
			create p.make_empty
			assert_integers_equal ("has_no_alternative_set", 0, p.alternative_options_lists.count)
			assert_integers_equal ("has_no_options_in_basic", 0, p.options.count)
			assert_integers_equal ("has_no_options", 0, p.all_options.count)
		end

	test_parse_array is
			-- Can we parse a given array of arguments?
		local
			p: AP_PARSER
			o1: AP_FLAG
		do
			create p.make_empty
			create o1.make ('f', "foo")
			p.options.force_last (o1)
			p.parse_array (<< "--foo", "x" >>)
			assert ("foo_was_found", o1.was_found)
			assert_integers_equal ("one parameter", 1, p.parameters.count)
			assert_strings_equal ("x_is_parameter", "x", p.parameters.first)
		end

	test_parse_list is
			-- Can we parse a given list of arguments?
		local
			p: AP_PARSER
			o1: AP_FLAG
			ll: DS_LINKED_LIST [STRING]
		do
			create p.make_empty
			create o1.make ('f', "foo")
			create ll.make
			p.options.force_last (o1)
			ll.force_last ("--foo")
			ll.force_last ("x")
			p.parse_list (ll)
			assert ("foo_was_found", o1.was_found)
		end

	test_complex_parse is
			-- Can we parse more complex sets of argument?
		local
			p: AP_PARSER
			o1: AP_FLAG
			o2: AP_STRING_OPTION
			o3: AP_FLAG
		do
			create p.make_empty
			create o1.make ('f', "foo")
			create o2.make ('b', "bar")
			create o3.make ('x', "xxx")
			p.options.force_last (o1)
			p.options.force_last (o2)
			p.options.force_last (o3)
			p.parse_array (<< "--foo", "x", "-bXXX" >>)
			assert ("foo_was_found", o1.was_found)
			assert ("bar_was_found", o2.was_found)
			assert ("xxx_was_not_found", not o3.was_found)
			assert_strings_equal ("bar_has_XXX_as_option", "XXX", o2.parameter)
		end

	test_parse_flags is
			-- Can we parse flags?
		local
			p: AP_PARSER
			o1: AP_FLAG
		do
			create p.make_empty
			create o1.make ('f', "flag")
			p.options.force_last (o1)
			p.parse_array (<< "-f" >>)
			assert ("f_was_found", o1.was_found)
			p.parse_array (<< "xx" >>)
			assert ("f_was_not_found", not o1.was_found)
			p.parse_array (<< "--flag" >>)
			assert ("flag_was_found", o1.was_found)
		end
	
	test_parse_string_options is
			-- Can we parse string options?
		local
			p: AP_PARSER
			o1: AP_STRING_OPTION
		do
			create p.make_empty
			create o1.make ('o', "option")
			p.options.force_last (o1)
			p.parse_array (<< "-o", "aaa" >>)
			assert ("o_was_found", o1.was_found)
			assert_strings_equal ("aaa_was_passed", "aaa", o1.parameter)
			p.parse_array (<< "-obbb" >>)
			assert ("o_was_found", o1.was_found)
			assert_strings_equal ("bbb_was_passed", "bbb", o1.parameter)
			p.parse_array (<< "--option", "ccc" >>)
			assert ("option_was_found",o1.was_found)
			assert_strings_equal ("ccc_was_passed", "ccc", o1.parameter)
			p.parse_array (<< "--option=ddd" >>)
			assert ("option_was_found", o1.was_found)
			assert_strings_equal ("ddd_was_passed", "ddd", o1.parameter)
			p.parse_array (<< "xxx" >>)
			assert ("option_was_not_found", not o1.was_found)
		end

	test_parse_option_with_optional_parameter is
			-- Can we parse an option that has an optional parameter?
		local
			p: AP_PARSER
			o1: AP_STRING_OPTION
		do
			create p.make_empty
			create o1.make_with_long_form ("option")
			o1.set_parameter_as_optional
			p.options.force_last (o1)
			p.parse_array (<< "--option", "ccc" >>)
			assert ("option_was_found",o1.was_found)
			assert ("parameter_is_void",o1.parameter = Void)
			assert_strings_equal ("ccc_was_passed", "ccc", p.parameters.first)
			p.parse_array (<< "--option=ddd" >>)
			assert ("option_was_found", o1.was_found)
			assert_strings_equal ("ddd_was_passed", "ddd", o1.parameter)
			p.parse_array (<< "xxx" >>)
			assert ("option_was_not_found", not o1.was_found)
		end

	test_parse_integer_options is
			-- Can we parse integer options?
		local
			p: AP_PARSER
			o1: AP_INTEGER_OPTION
		do
			create p.make_empty
			create o1.make ('o', "option")
			p.options.force_last (o1)
			p.parse_array (<< "-o", "23" >>)
			assert ("o_was_found", o1.was_found)
			assert_integers_equal ("aaa_was_passed", 23, o1.parameter)
			p.parse_array (<< "-o24" >>)
			assert ("o_was_found", o1.was_found)
			assert_integers_equal ("bbb_was_passed", 24, o1.parameter)
			p.parse_array (<< "--option", "25" >>)
			assert ("option_was_found", o1.was_found)
			assert_integers_equal ("ccc_was_passed", 25, o1.parameter)
			p.parse_array (<< "--option=26" >>)
			assert ("option_was_found", o1.was_found)
			assert_integers_equal ("ddd_was_passed", 26, o1.parameter)
			p.parse_array (<< "xxx" >>)
			assert ("option_was_not_found", not o1.was_found)
		end

	test_parse_boolean_options is
			-- Can we parse boolean options?
		local
			p: AP_PARSER
			o1: AP_BOOLEAN_OPTION
		do
			create p.make_empty
			create o1.make ('o', "option")
			p.options.force_last (o1)
			p.parse_array (<< "-o", "true" >>)
			assert ("o_was_found", o1.was_found)
			assert_true ("true_was_passed", o1.parameter)
			p.parse_array (<< "-o", "t" >>)
			assert ("o_was_found", o1.was_found)
			assert_true ("t was passed", o1.parameter)
			p.parse_array (<< "-o", "1" >>)
			assert ("o_was_found", o1.was_found)
			assert_true ("1 was passed", o1.parameter)
			p.parse_array (<< "-o", "yes" >>)
			assert ("o_was_found", o1.was_found)
			assert_true ("yes was passed", o1.parameter)
			p.parse_array (<< "-o", "y" >>)
			assert ("o_was_found", o1.was_found)
			assert_true ("y was passed", o1.parameter)
			p.parse_array (<< "-o", "false" >>)
			assert ("o_was_found", o1.was_found)
			assert_false ("false was passed", o1.parameter)
			p.parse_array (<< "-o", "f" >>)
			assert ("o_was_found", o1.was_found)
			assert_false ("f was passed", o1.parameter)
			p.parse_array (<< "-o", "0" >>)
			assert ("o_was_found", o1.was_found)
			assert_false ("0 was passed", o1.parameter)
			p.parse_array (<< "-o", "no" >>)
			assert ("o_was_found", o1.was_found)
			assert_false ("no was passed", o1.parameter)
			p.parse_array (<< "-o", "n" >>)
			assert ("o_was_found", o1.was_found)
			assert_false ("n was passed", o1.parameter)
		end

	test_parse_enumeration_option is
			-- Can we parse enumeration options?
		local
			p: AP_PARSER
			o1: AP_ENUMERATION_OPTION
		do
			create p.make_empty
			create o1.make ('o', "option")
			p.options.force_last (o1)
			o1.extend ("one")
			o1.extend ("two")
			o1.extend ("three")
			p.parse_array (<< "-o", "one" >>)
			assert ("o_was_found", o1.was_found)
			assert_strings_equal ("one_was_passed", "one", o1.parameter)
		end

	test_parse_alternative_options_lists is
			-- Can we parse alternative options lists?
		local
			p: AP_PARSER
			o1: AP_FLAG
			o2: AP_FLAG
			o3: AP_FLAG
			aol1: AP_ALTERNATIVE_OPTIONS_LIST
			aol2: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create p.make
			create o1.make_with_short_form ('a')
			create o2.make_with_short_form ('b')
			create o3.make_with_short_form ('c')
			create aol1.make (o1)
			create aol2.make (o2)
			aol1.force_last (o3)
			p.alternative_options_lists.force_last (aol1)
			p.alternative_options_lists.force_last (aol2)
			p.parse_array (<< "-a", "-c" >>)
			assert ("a_was_found", o1.was_found)
			assert ("b_was_not_found", not o2.was_found)
			assert ("c_was_found", o3.was_found)
			p.parse_array (<< "-ac" >>)
			assert ("a_was_found", o1.was_found)
			assert ("b_was_not_found", not o2.was_found)
			assert ("c_was_found", o3.was_found)
			p.parse_array (<< "-b" >>)
			assert ("a_was_not_found", not o1.was_found)
			assert ("b_was_found", o2.was_found)
			assert ("c_was_not_found", not o3.was_found)
		end

	test_set_unset_mandatory is
			-- Can we setting and unsetting the mandatory flag?
		local
			a: AP_FLAG
		do
			create a.make_with_short_form ('m')
			assert ("a_is_not_mandatory", not a.is_mandatory)
			a.enable_mandatory
			assert ("a_is_mandatory", a.is_mandatory)
			a.disable_mandatory
			assert ("a_is_not_mandatory", not a.is_mandatory)
		end

end
