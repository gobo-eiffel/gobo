
indexing

	description:
	
		"Do nothing callback event interface"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_CALLBACKS_NULL

inherit
	XM_CALLBACKS

creation
	make
	
feature {NONE} -- Creation

	make is
			-- Do nothing.
		do
		end
		
feature -- Document

	on_start is
			-- Called when parsing starts.
		do
		end
		
	on_finish is
			-- Called when parsing finished.
		do
		end
	
feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
		end

feature -- Meta

	on_processing_instruction (a_name: UC_STRING; a_content: UC_STRING) is
			-- Processing instruction.
		do
		end
		
	on_comment (a_content: UC_STRING) is
			-- Comment
			-- Atomic: single comment produces single event
		do
		end
		
feature -- Tag

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Start of start tag.
		do
		end
		
	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING; a_value: UC_STRING) is
			-- Start of start tag.
		do
		end
		
	on_start_tag_finish is
			-- End of start tag.
		do
		end
		
	on_end_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- End tag.
		do
		end
	
feature -- Content

	on_content (a_content: UC_STRING) is
			-- Text content.
		do
		end
		
end
