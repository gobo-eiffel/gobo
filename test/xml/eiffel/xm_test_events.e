indexing

	description:
	
		"Test XML event filters"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"		

deferred class XM_TEST_EVENTS

inherit

	TS_TEST_CASE
	
feature -- Test

	test_counter is
			-- Test XM_EVENT_COUNTER
		local
			counter: XM_EVENT_COUNTER
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
			
			assert_equal ("pi", counter.processing_instructions, 1)
			assert_equal ("com", counter.comments, 2)
			assert_equal ("tag", counter.start_tags, 2)
			assert_equal ("content", counter.contents, 3)
			assert_equal ("end tag", counter.start_tags, counter.end_tags)
			assert_equal ("attr", counter.attributes, 1)
		end
		
	test_concatenator is
			-- Test XM_CONTENT_CONCATENATOR
		local
			pretty: XM_PRETTY_PRINT_FILTER 
			concat: XM_CONTENT_CONCATENATOR
			counter: XM_EVENT_COUNTER
		do
			create pretty.make_null
			create counter.set_next (pretty)
			create concat.set_next (counter)
			
			pretty.set_output_to_string
			
			concat.on_start
			concat.on_start_tag (Void, Void, "doc")
			concat.on_start_tag_finish
			concat.on_content ("doc1")
			concat.on_processing_instruction ("nm", "val") -- do split content
			concat.on_content ("doc2.1")
			concat.on_comment ("com in content") -- do not split content, rm comment
			concat.on_content ("doc2.2")
			concat.on_start_tag (Void, Void, "zoo")
			concat.on_attribute (Void, Void, "attr1", "val1")
			concat.on_start_tag_finish
			concat.on_content ("zoo.1")
			concat.on_content ("zoo.2")
			concat.on_end_tag (Void, Void, "zoo")
			concat.on_content ("doc3")
			concat.on_end_tag (Void, Void, "doc")
			concat.on_comment ("com2") -- kept
			concat.on_finish
			
			assert_equal ("content concatenated", counter.contents, 4)
			assert_equal ("pretty", pretty.last_output, "<doc>doc1<?nm val?>doc2.1doc2.2<zoo attr1=%"val1%">zoo.1zoo.2</zoo>doc3</doc><!--com2-->")
		end
	
end
 
