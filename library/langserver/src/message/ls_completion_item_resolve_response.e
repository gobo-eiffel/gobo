note

	description:

		"LSP reponses for 'completionItem/resolve' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_RESOLVE_RESPONSE

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

	make (a_id: LS_RESPONSE_ID; a_result: LS_COMPLETION_ITEM)
			-- Create a new response.
		require
			a_id_not_void: a_id /= Void
			a_result_not_void: a_result /= Void
		do
			make_success (a_id, a_result)
		ensure
			id_set: id = a_id
			result_set: result_ = a_result
		end

feature -- Access

	result_: detachable LS_COMPLETION_ITEM
			-- The result of a request.

feature -- Setting

	set_result (a_result: LS_COMPLETION_ITEM)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

end
