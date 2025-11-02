note

	description:
	
		"LSP general parameters to unregister a capability"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNREGISTRATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_method: like method)
			-- Create a new registration.
		require
			a_id_not_void: a_id /= Void
			a_method_not_void: a_method /= Void
		do
			id := a_id
			method := a_method
		ensure
			id_set: id = a_id
			method_set: method = a_method
		end

feature -- Access

	id: LS_STRING
			-- The id used to unregister the request or notification. Usually an id
			-- provided during the register request.

	method: LS_STRING
			-- The method / capability to unregister for.

feature -- Field names

	id_name: STRING_8 = "id"
	method_name: STRING_8 = "method"

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_unregistration (Current)
		end

invariant

	id_not_void: id /= Void
	method_not_void: method /= Void

end
