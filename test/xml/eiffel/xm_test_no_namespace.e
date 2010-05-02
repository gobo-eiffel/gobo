note

	description:

		"Test namespace resolution"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_NO_NAMESPACE

inherit

	TS_TEST_CASE

	XM_CALLBACKS_FILTER_FACTORY

	KL_SHARED_STANDARD_FILES

create

	make_default

feature -- Test

	test_regular
		do
			assert_name ("basic", "<a/>",<<"a">>)
			assert_name ("namspaced", "<a:bc d:ef='z'/>", <<"a:bc", "d:ef">>)
		end

	test_element_single
		do
			assert_name ("single colon", "<:/>", <<":">>)
			assert_name ("front", "<:ab></:ab>", <<":ab">>)
			assert_name ("back", "<c:></c:>", <<"c:">>)
			assert_name ("both", "<:abc:/>", <<":abc:">>)
		end

	test_element_multiple
		do
			assert_name ("front", "<:ab:c></:ab:c>", <<":ab:c">>)
			assert_name ("back", "<ee:c:></ee:c:>", <<"ee:c:">>)
			assert_name ("both", "<:abc:de:/>", <<":abc:de:">>)
			assert_name ("three out", "<:abc:de:fgh:/>", <<":abc:de:fgh:">>)
			assert_name ("three in", "<abc:de:fgh></abc:de:fgh>", <<"abc:de:fgh">>)
		end

	test_attribute
		do
			assert_name ("attr simple", "<: :='a'/>", <<":",":">>)
			assert_name ("attr middle", "<a:bcd e:fg='a'/>", <<"a:bcd","e:fg">>)
			assert_name ("attr front back", "<:a:bc ef:gh:='a'></:a:bc>", <<":a:bc","ef:gh:">>)
		end

feature {NONE} -- Implementation

	assert_name (a_name: STRING; a_in: STRING; a_ns: ARRAY[STRING])
			-- Test that an XML document sequence of local part
			-- events (excluding xmlns, flattened) is correct when
			-- namespace parsing is disabled.
		require
			a_name_not_void: a_name /= Void
			a_in_not_void: a_in /= Void
			a_ns_not_void: a_ns /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_checker: XM_NO_NAMESPACE_CHECKER
		do
			create a_parser.make
			a_parser.disable_namespaces -- this is what is being tested!

			create a_checker.make_null
			a_checker.set (a_ns)
			a_parser.set_callbacks (standard_callbacks_pipe (<<a_checker>>))
			a_parser.parse_from_string (a_in)

			assert ("parsing ok for "+a_name, a_parser.is_correct)
			assert (a_name, not a_checker.has_failed)
		end

end
