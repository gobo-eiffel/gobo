
indexing

	description:
	
		"Event filter to share identical strings (clients should not later change strings)"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_SHARED_STRINGS_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_content
		end
		
creation
	make_null,
	set_next
	
feature {NONE} -- Share

	strings: DS_HASH_SET [UC_STRING]
			-- Strings to be shared.
		
	shared_string (a: UC_STRING): UC_STRING is
			-- If string known return the previous occurence.
		require
			not_void: a /= Void
		do
			if strings.has (a) then
				Result := strings.item (a)
			else
				strings.force (a)
				Result := a
			end
		end
		
feature -- Document events

	on_start is
			-- Called when parsing starts.
		do
			!! strings.make_equal (0)
			Precursor
		end
		
feature -- Meta information

	on_processing_instruction (a_name: UC_STRING; a_content: UC_STRING) is
			-- Processing instruction.
		do
			next.on_processing_instruction (shared_string (a_name), shared_string (a_content))
		end
		
	on_comment (a_content: UC_STRING) is
			-- Comment
			-- Atomic: single comment produces single event
		do
			next.on_comment (shared_string (a_content))
		end
		
feature -- Tag

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Start of start tag.
		do
			next.on_start_tag (shared_string (a_namespace), 
					shared_string (a_prefix),
					shared_string (a_local_part))
		end
		
	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING; a_value: UC_STRING) is
			-- Start of start tag.
		do
			next.on_attribute (shared_string (a_namespace), 
					shared_string (a_prefix),
					shared_string (a_local_part),
					shared_string (a_value))
		end
				
	on_end_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- End tag.
		do
			next.on_end_tag (shared_string (a_namespace), 
					shared_string (a_prefix),
					shared_string (a_local_part))
		end
	
feature -- Content

	on_content (a_content: UC_STRING) is
			-- Text content.
			-- NOT atomic: successive content may be different.
			-- Default: forward event to 'next'.
		do
			next.on_content (shared_string (a_content))
		end
			
end
