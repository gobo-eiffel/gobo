indexing

	description: 

		"Filter that validates unicode character classes"
		
	library: "Gobo XML library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

	
class XM_UNICODE_VALIDATION_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_comment,
			on_processing_instruction,
			on_start_tag,
			on_attribute,
			on_content
		end
		
	XM_UNICODE_CHARACTER_CLASSES
		export
			{NONE} all
		end
	
	XF_UTF8_PRIVATE_ROUTINES
		
creation

	make_null,
	set_next
	
feature -- Actions (redirected)

	on_comment (a_content: STRING) is
			-- Comment
		do
			validate (a_content)
			Precursor (a_content)
		end
	
	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
			validate_name (a_name)
			validate (a_content)
			Precursor (a_name, a_content)
		end
	

	on_start_tag (a_namespace, a_prefix, a_local_part: STRING) is
			-- Start tag.
		do
			if has_prefix (a_prefix) then
				validate_name (a_prefix)
			end
			validate_name (a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end
		
	on_attribute (a_namespace, a_prefix, a_local_part: STRING; a_value: STRING) is
			-- Start of attribute.
		do
			if has_prefix (a_prefix) then
				validate_name (a_prefix)
			end
			validate_name (a_local_part)
			validate (a_value)
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end
		
	on_content (a_content: STRING) is
			-- Text content.
		do
			validate (a_content)
			Precursor (a_content)
		end


feature {NONE}

	validate (a:STRING) is
			-- Validate a string.
		do	
			if not valid_string (a) then	
				on_error (Error_unicode_invalid_character)
			end
		end
		
	validate_name (a:STRING) is
			-- Validate name in astring
		do
			if not valid_name (a) then	
				on_error (Error_unicode_invalid_character)
			end
		end

	Error_unicode_invalid_character: STRING is "Invalid unicode character"
		
feature {NONE} -- String

	valid_string (a: STRING): BOOLEAN is
			-- Is this a UTF8 string with no invalid character?
		require
			not_void: a /= Void
		local
			i: INTEGER
		do
			from
				Result := True
				i := 1
			until
				(i > a.count) or (not Result)
			loop
				Result := is_char (a.item_code (i))
				i := i + 1
			end
		ensure
			empty: (a.count = 0) implies Result
		end
		
	valid_name (a: STRING): BOOLEAN is
			-- Is this a UTF8 string with a valid name?
		require
			not_void: a /= Void
		local
			i: INTEGER
		do
			-- first
			Result := a.count = 0 or else is_name_first (a.item_code (1))

			-- tail
			from
				i := 2
			until
				(i > a.count) or (not Result)
			loop
				Result := is_name_char (a.item_code (i))
				i := i + 1
			end
		end
		
end
