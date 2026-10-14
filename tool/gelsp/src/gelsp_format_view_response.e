note

	description:

		"LSP reponses for '$/goboEiffel/formatView' requests"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW_RESPONSE

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
			make_success (a_id, null)
		ensure
			id_set: id = a_id
			result_set: result_ /= Void
		end

feature -- Access

	result_: detachable GELSP_FORMAT_VIEW
			-- The result of a request.

feature -- Setting

	set_result (a_result: GELSP_FORMAT_VIEW)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

feature {NONE} -- Implementation

	null: GELSP_FORMAT_VIEW
			-- null
		local
			l_uri: LS_STRING
		once
			l_uri := ""
			create Result.make (l_uri, "")
		ensure
			null_not_void: Result /= Void
			instance_free: class
		end

end
