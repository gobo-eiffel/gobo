note

	description:

		"LSP reponses for 'textDocument/willSaveWaitUntil' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESPONSE

inherit

	LS_RESPONSE
		redefine
			result_
		end

create

	make,
	make_success,
	make_error

feature {NONE} -- Initialization

	make (a_id: LS_RESPONSE_ID)
			-- Create a new response.
		require
			a_id_not_void: a_id /= Void
		do
			make_success (a_id, {LS_NULL}.null)
		ensure
			id_set: id = a_id
			result_set: result_ = {LS_NULL}.null
		end

feature -- Access

	result_: detachable LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT
			-- The result of a request.

feature -- Setting

	set_null_result
			-- Set `result_` to 'null'.
		do
			error := Void
			result_ := {LS_NULL}.null
		end

	set_text_edit_list (a_text_edit_list: LS_TEXT_EDIT_LIST)
			-- Set `result_` to `a_text_edit_list`.
		require
			a_text_edit_list_not_void: a_text_edit_list /= Void
		do
			error := Void
			result_ := a_text_edit_list
		ensure
			result_set: result_ = a_text_edit_list
		end

	add_text_edit (a_text_edit: LS_TEXT_EDIT)
			-- Add a new text edit.
		require
			a_text_edit_not_void: a_text_edit /= Void
		local
			l_text_edits: LS_TEXT_EDIT_LIST
		do
			error := Void
			if attached {LS_TEXT_EDIT_LIST} result_ as l_text_edit_list then
				l_text_edits := l_text_edit_list
			else
				create l_text_edits.make_with_capacity (10)
				result_ := l_text_edits
			end
			l_text_edits.put_last (a_text_edit)
		end

	add_text_edit_general (a_range: LS_RANGE; a_new_text: READABLE_STRING_GENERAL)
			-- Add a new text edit from a string general.
		require
			a_range_not_void: a_range /= Void
			a_new_text_not_void: a_new_text /= Void
		local
			l_text: LS_STRING
			l_text_edit: LS_TEXT_EDIT
		do
			create l_text.make_from_string (a_new_text)
			create l_text_edit.make (a_range, l_text)
			add_text_edit (l_text_edit)
		end

	add_text_edit_utf8 (a_range: LS_RANGE; a_new_text: STRING_8)
			-- Add a new text edit from a UTF-8 string.
		require
			a_range_not_void: a_range /= Void
			a_new_text_not_void: a_new_text /= Void
			a_new_text_is_string_8: a_new_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_new_text)
		local
			l_text: LS_STRING
			l_text_edit: LS_TEXT_EDIT
		do
			create l_text.make_from_utf8 (a_new_text)
			create l_text_edit.make (a_range, l_text)
			add_text_edit (l_text_edit)
		end

end
