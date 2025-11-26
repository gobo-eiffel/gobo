note

	description:

		"LSP reponses for 'textDocument/documentSymbol' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_RESPONSE

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

	result_: detachable LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT
			-- The result of a request.

feature -- Setting

	set_null_result
			-- Set `result_` to 'null'.
		do
			error := Void
			result_ := {LS_NULL}.null
		end

	set_result (a_result: LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

	add_document_symbol (a_document_symbol: LS_DOCUMENT_SYMBOL)
			-- Add `a_document_symbol` to the result.
			-- Discard any symbol information already added.
		require
			a_document_symbol_not_void: a_document_symbol /= Void
		local
			l_list: LS_DOCUMENT_SYMBOL_LIST
		do
			error := Void
			if attached {LS_DOCUMENT_SYMBOL_LIST} result_ as l_document_symbol_list then
				l_document_symbol_list.put_last (a_document_symbol)
			else
				create l_list.make_with_capacity (50)
				l_list.put_last (a_document_symbol)
				result_ := l_list
			end
		end

end
