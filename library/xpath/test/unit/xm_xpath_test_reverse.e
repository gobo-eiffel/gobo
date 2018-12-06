note

	description:

		"Test XPath reverse() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_REVERSE

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

	test_reverse_one
			-- Test fn:reverse (('a', 'b', 'c')) returns ('c', 'b', 'a')
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("reverse (('a', 'b', 'c'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three values", evaluated_items /= Void and then evaluated_items.count = 3)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_STRING_VALUE} evaluated_items.item (1) as a_string_value then
				assert ("First value is string", False)
			else
				assert ("First value is c", STRING_.same_string (a_string_value.string_value, "c"))
			end
			if not attached {XM_XPATH_STRING_VALUE} evaluated_items.item (2) as a_string_value then
				assert ("Second value is string", False)
			else
				assert ("Second value is b", STRING_.same_string (a_string_value.string_value, "b"))
			end
			if not attached {XM_XPATH_STRING_VALUE} evaluated_items.item (3) as a_string_value then
				assert ("Third value is string", False)
			else
				assert ("Third value is a", STRING_.same_string (a_string_value.string_value, "a"))
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


