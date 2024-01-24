note

	description:

		"Test XPath lang() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TEST_LANG

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_SHARED_CONFORMANCE

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_lang_one
			-- Test fn:lang("en") returns true against <para xml:lang="en"/>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[1]/lang('en')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("True", a_boolean_value.value)
			end
		end

	test_lang_two
			-- Test fn:lang("en") returns true against <div xml:lang="en"><para>And now, and forever!</para></div>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/div/para[1]/lang('en')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("True", a_boolean_value.value)
			end
		end

	test_lang_three
			-- Test fn:lang("en") returns true against <para xml:lang="EN"/>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[2]/lang('en')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("True", a_boolean_value.value)
			end
		end

	test_lang_four
			-- Test fn:lang("en") returns true against <para xml:lang="en-us"/>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[3]/lang('en')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("True", a_boolean_value.value)
			end
		end

	test_lang_five
			-- Test fn:lang("fr") returns false against <para xml:lang="en-us"/>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[3]/lang('fr')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("False", not a_boolean_value.value)
			end
		end

	test_lang_six
			-- Test fn:lang("de") returns true against <para/>.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[4]/lang('de')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_BOOLEAN_VALUE} evaluated_items.item (1) as a_boolean_value then
				assert ("Boolean value", False)
			else
				assert ("True", a_boolean_value.value)
			end
		end

	set_up
		do
			conformance.set_basic_xslt_processor
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xpath", "test", "unit", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	languages_xml_uri: UT_URI
			-- URI of file 'languages.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "languages.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			languages_xml_uri_not_void: Result /= Void
		end

end


