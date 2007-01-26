indexing
	
	description:
	
		"Event filter that concatenates successive on_content events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
		
class XM_CONTENT_CONCATENATOR

inherit
	
	XM_CALLBACKS_FILTER
		redefine
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_content,
			on_finish
		end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		

create
	
	make_null,
	set_next
	
feature {NONE} -- Content

	last_content: STRING
			-- Current content

	flush_content is
			-- Generate content event if there is pending content.
		do
			if last_content /= Void and then last_content.count > 0 then
				next.on_content (last_content)
			end
			last_content := Void
		end
		
feature -- Content
	
	on_content (a_content: STRING) is
			-- Aggregate content events so that two content events
			-- never follow each other.
		do
			if last_content = Void then
				last_content := STRING_.cloned_string (a_content)
			else
				last_content := STRING_.appended_string (last_content, a_content)
			end
		end
		
	on_comment (a_comment: STRING) is
			-- Eat comment when in content, otherwise the event would be
			-- out of order.
		do
			flush_content
			Precursor (a_comment)
		end

feature -- Events

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_name, a_content)
		end
				
	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part)
		end
		
	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is	
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end
		
	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part)
		end
		
	on_finish is
				-- Flush content and forward.
		do
			flush_content
			Precursor
		end

end
