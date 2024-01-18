note

	description:

		"Filters that validate unicode character classes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

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

	XM_SHARED_UNICODE_CHARACTERS
		export {NONE} all end

create

	make_null,
	make_next

feature -- Actions (redirected)

	on_comment (a_content: STRING)
			-- Comment.
		do
			validate (a_content)
			Precursor (a_content)
		end

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Processing instruction.
		do
			validate_name (a_name)
			validate (a_content)
			Precursor (a_name, a_content)
		end

	on_start_tag (a_namespace, a_prefix: detachable STRING; a_local_part: STRING)
			-- Start tag.
		do
			if a_prefix /= Void and then has_prefix (a_prefix) then
				validate_name (a_prefix)
			end
			validate_name (a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace, a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Start of attribute.
		do
			if a_prefix /= Void and then has_prefix (a_prefix) then
				validate_name (a_prefix)
			end
			validate_name (a_local_part)
			validate (a_value)
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_content (a_content: STRING)
			-- Text content.
		do
			validate (a_content)
			Precursor (a_content)
		end

feature {NONE} -- Validation

	validate (a_string: STRING)
			-- Validate `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if not characters_1_0.is_string (a_string) then
				on_error (Error_unicode_invalid_character)
			end
		end

	validate_name (a_name: STRING)
			-- Validate `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			if not characters_1_0.is_name (a_name) then
				on_error (Error_unicode_invalid_character)
			end
		end

feature {NONE} -- Constants

	Error_unicode_invalid_character: STRING = "Invalid unicode character"
			-- Error message

end
