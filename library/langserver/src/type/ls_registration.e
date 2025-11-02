note

	description:
	
		"LSP general parameters to register for a capability"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_REGISTRATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_method: like method; a_register_options: like register_options)
			-- Create a new registration.
		require
			a_id_not_void: a_id /= Void
			a_method_not_void: a_method /= Void
		do
			id := a_id
			method := a_method
			register_options := a_register_options
		ensure
			id_set: id = a_id
			method_set: method = a_method
			register_options_set: register_options = a_register_options
		end

feature -- Access

	id: LS_STRING
			-- The id used to register the request. The id can be used to deregister
			-- the request again.

	method: LS_STRING
			-- The method / capability to register for.

	register_options: detachable LS_ANY
			-- Options necessary for the registration.

feature -- Field names

	id_name: STRING_8 = "id"
	method_name: STRING_8 = "method"
	register_options_name: STRING_8 = "registerOptions"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_registration (Current)
		end

invariant

	id_not_void: id /= Void
	method_not_void: method /= Void

end
