note

	description:

		"LSP reponses for 'textDocument/completion' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_RESPONSE

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

	result_: detachable LS_OPTIONAL_COMPLETION_RESULT
			-- The result of a request.

feature -- Setting

	set_null_result
			-- Set `result_` to 'null'.
		do
			error := Void
			result_ := {LS_NULL}.null
		end

	set_result (a_result: LS_OPTIONAL_COMPLETION_RESULT)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

	add_completion_item (a_completion_item: LS_COMPLETION_ITEM)
			-- Add `a_completion_item` to the result.
		require
			a_completion_item_not_void: a_completion_item /= Void
		local
			l_item_list: LS_COMPLETION_ITEM_LIST
		do
			error := Void
			if attached {LS_COMPLETION_ITEM_LIST} result_ as l_completion_item_list then
				l_completion_item_list.put_last (a_completion_item)
			elseif attached {LS_COMPLETION_LIST} result_ as l_completion_list then
				l_completion_list.items.put_last (a_completion_item)
			else
				create l_item_list.make_with_capacity (10)
				l_item_list.put_last (a_completion_item)
				result_ := l_item_list
			end
		end

end
