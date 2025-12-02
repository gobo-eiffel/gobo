note

	description:

		"LSP reponses for 'textDocument/definition' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DEFINITION_RESPONSE

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

	result_: detachable LS_OPTIONAL_DEFINITION_RESULT
			-- The result of a request.

feature -- Setting

	set_null_result
			-- Set `result_` to 'null'.
		do
			error := Void
			result_ := {LS_NULL}.null
		end

	set_result (a_result: LS_OPTIONAL_DEFINITION_RESULT)
			-- Set `result_` to `a_result`.
		require
			a_result_not_void: a_result /= Void
		do
			error := Void
			result_ := a_result
		ensure
			result_set: result_ = a_result
		end

	add_location (a_location: LS_LOCATION)
			-- Add `a_location` to the result.
			-- Discard any location link already added.
		require
			a_location_not_void: a_location /= Void
		local
			l_list: LS_LOCATION_LIST
		do
			error := Void
			if attached {LS_LOCATION_LIST} result_ as l_location_list then
				l_location_list.put_last (a_location)
			elseif attached {LS_LOCATION} result_ as l_location then
				create l_list.make_with_capacity (10)
				l_list.put_last (l_location)
				l_list.put_last (a_location)
				result_ := l_list
			else
				result_ := a_location
			end
		end

	add_location_link (a_location_link: LS_LOCATION_LINK; a_manager: LS_MESSAGE_MANAGER)
			-- Add `a_location_link` to the result.
			-- Discard any location already added.
		require
			a_location_link_not_void: a_location_link /= Void
			a_manager_not_void: a_manager /= Void
			location_link_supported: a_manager.definition_request_handler.is_location_link_supported
		local
			l_list: LS_LOCATION_LINK_LIST
		do
			error := Void
			if attached {LS_LOCATION_LINK_LIST} result_ as l_location_link_list then
				l_location_link_list.put_last (a_location_link)
			else
				create l_list.make_with_capacity (10)
				l_list.put_last (a_location_link)
				result_ := l_list
			end
		end

end
