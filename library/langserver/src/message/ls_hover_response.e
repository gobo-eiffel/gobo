note

	description:

		"LSP reponses for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HOVER_RESPONSE

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

	result_: detachable LS_OPTIONAL_HOVER_RESULT
			-- The result of a request.

feature -- Setting

	set_null_result
			-- Set `result_` to 'null'.
		do
			error := Void
			result_ := {LS_NULL}.null
		end

	set_result (a_result: LS_HOVER_RESULT)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

	set_markup_content (a_markup_content: LS_MARKUP_CONTENT)
			-- Set markup content.
		require
			a_markup_content_not_void: a_markup_content /= Void
		do
			error := Void
			create {LS_HOVER_RESULT} result_.make (a_markup_content)
		end

	set_string (a_text: READABLE_STRING_GENERAL)
			-- Set string.
		require
			a_text_not_void: a_text /= Void
		local
			l_contents: LS_STRING
		do
			error := Void
			create l_contents.make_from_string (a_text)
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

	set_string_utf8 (a_text: STRING_8)
			-- Set string UTF-8 text.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string_8: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
		local
			l_contents: LS_STRING
		do
			error := Void
			create l_contents.make_from_utf8 (a_text)
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

	set_plaintext (a_text: READABLE_STRING_GENERAL; a_manager: LS_MESSAGE_MANAGER)
			-- Set plaintext text.
		require
			a_text_not_void: a_text /= Void
			a_manager_not_void: a_manager /= Void
			plaintext_supported: a_manager.hover_request_handler.is_plaintext_supported
		local
			l_contents: LS_MARKUP_CONTENT
		do
			error := Void
			create l_contents.make ({LS_MARKUP_KINDS}.plaintext, create {LS_STRING}.make_from_string (a_text))
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

	set_plaintext_utf8 (a_text: STRING_8; a_manager: LS_MESSAGE_MANAGER)
			-- Set plaintext UTF-8 text.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string_8: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
			a_manager_not_void: a_manager /= Void
			plaintext_supported: a_manager.hover_request_handler.is_plaintext_supported
		local
			l_contents: LS_MARKUP_CONTENT
		do
			error := Void
			create l_contents.make ({LS_MARKUP_KINDS}.plaintext, create {LS_STRING}.make_from_utf8 (a_text))
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

	set_markdown (a_text: READABLE_STRING_GENERAL; a_manager: LS_MESSAGE_MANAGER)
			-- Set markdown text.
		require
			a_text_not_void: a_text /= Void
			a_manager_not_void: a_manager /= Void
			markdown_supported: a_manager.hover_request_handler.is_markdown_supported
		local
			l_contents: LS_MARKUP_CONTENT
		do
			error := Void
			create l_contents.make ({LS_MARKUP_KINDS}.markdown, create {LS_STRING}.make_from_string (a_text))
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

	set_markdown_utf8 (a_text: STRING_8; a_manager: LS_MESSAGE_MANAGER)
			-- Set markdown UTF-8 text.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string_8: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
			a_manager_not_void: a_manager /= Void
			markdown_supported: a_manager.hover_request_handler.is_markdown_supported
		local
			l_contents: LS_MARKUP_CONTENT
		do
			error := Void
			create l_contents.make ({LS_MARKUP_KINDS}.markdown, create {LS_STRING}.make_from_utf8 (a_text))
			create {LS_HOVER_RESULT} result_.make (l_contents)
		end

end
