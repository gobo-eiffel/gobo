indexing

	description:

		"Filters that validate unicode character classes"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
		export {NONE} all end

creation

	make_null,
	set_next

feature -- Actions (redirected)

	on_comment (a_content: STRING) is
			-- Comment.
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

feature {NONE} -- Validation

	validate (a_string: STRING) is
			-- Validate `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if not valid_string (a_string) then
				on_error (Error_unicode_invalid_character)
			end
		end

	validate_name (a_name: STRING) is
			-- Validate `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			if not valid_name (a_name) then
				on_error (Error_unicode_invalid_character)
			end
		end

feature {NONE} -- Status report

	valid_string (a_string: STRING): BOOLEAN is
			-- Is `a_string' a UTF8 string with no invalid character?
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			Result := True
			nb := a_string.count
			from i := 1 until i > nb loop
				if not is_char (a_string.item_code (i)) then
					Result := False
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			empty: (a_string.count = 0) implies Result
		end

	valid_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' a UTF8 string with a valid name?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := a_name.count
				-- First.
			if nb = 0 or else is_name_first (a_name.item_code (1)) then
				Result := True
					-- Tail.
				from i := 2 until i > nb loop
					if not is_name_char (a_name.item_code (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Constants

	Error_unicode_invalid_character: STRING is "Invalid unicode character"
			-- Error message

end
