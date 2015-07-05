note

	description:

		"Test XML event filters"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_EVENTS

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_counter
			-- Test XM_EVENT_COUNT_FILTER
		local
			counter: XM_EVENT_COUNT_FILTER
		do
			create counter.make_null
			counter.on_start
			counter.on_processing_instruction ("nm", "val")
			counter.on_start_tag (Void, Void, "doc")
			counter.on_attribute (Void, Void, "attr1", "val1")
			counter.on_start_tag_finish
			counter.on_comment ("com1")
			counter.on_content ("foo")
			counter.on_content ("bar")
			counter.on_start_tag (Void, Void, "zoo")
			counter.on_start_tag_finish
			counter.on_content ("foobar")
			counter.on_end_tag (Void, Void, "zoo")
			counter.on_end_tag (Void, Void, "doc")
			counter.on_comment ("com2")
			counter.on_finish

			assert_integers_equal ("pi", counter.processing_instructions, 1)
			assert_integers_equal ("com", counter.comments, 2)
			assert_integers_equal ("tag", counter.start_tags, 2)
			assert_integers_equal ("content", counter.contents, 3)
			assert_integers_equal ("end tag", counter.start_tags, counter.end_tags)
			assert_integers_equal ("attr", counter.attributes, 1)
		end

	test_concatenator
			-- Test XM_CONTENT_CONCATENATOR
		local
			pretty: XM_PRETTY_PRINT_FILTER
			concat: XM_CONTENT_CONCATENATOR
			counter: XM_EVENT_COUNT_FILTER
		do
			create pretty.make_null
			create counter.make_next (pretty)
			create concat.make_next (counter)

			pretty.set_output_to_string

			concat.on_start
			concat.on_start_tag (Void, Void, "doc")
			concat.on_start_tag_finish
			concat.on_content ("doc1")
			concat.on_processing_instruction ("nm", "val")
			concat.on_content ("doc2.1")
			concat.on_comment ("com in content")
			concat.on_content ("doc2.2")
			concat.on_start_tag (Void, Void, "zoo")
			concat.on_attribute (Void, Void, "attr1", "val1")
			concat.on_start_tag_finish
			concat.on_content ("zoo.1")
			concat.on_content ("zoo.2")
			concat.on_end_tag (Void, Void, "zoo")
			concat.on_content ("doc3")
			concat.on_end_tag (Void, Void, "doc")
			concat.on_comment ("com2")
			concat.on_finish

			assert_integers_equal ("content concatenated", counter.contents, 5)
			assert_strings_equal ("pretty", pretty.last_output, "<doc>doc1<?nm val?>doc2.1<!--com in content-->doc2.2<zoo attr1=%"val1%">zoo.1zoo.2</zoo>doc3</doc><!--com2-->")
		end

	test_no_comment
			-- Test XM_NO_COMMENT_FILTER.
		local
			tested: XM_NO_COMMENT_FILTER
			counter: XM_EVENT_COUNT_FILTER
		do
			create counter.make_null
			create tested.make_next (counter)

			tested.on_start
			tested.on_comment ("c1")
			tested.on_start_tag (Void, Void, "doc")
			tested.on_start_tag_finish
			tested.on_content ("t1")
			tested.on_comment ("c2")
			tested.on_content ("t2")
			tested.on_end_tag (Void, Void, "doc")
			tested.on_comment ("c3")
			tested.on_finish

			assert_integers_equal ("no comment", counter.comments, 0)
		end
end
