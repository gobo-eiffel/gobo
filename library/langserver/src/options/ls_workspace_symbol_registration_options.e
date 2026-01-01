note

	description:

		"LSP 'workspace/symbol' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_REGISTRATION_OPTIONS

inherit

	LS_SERVER_REGISTRATION_OPTIONS
	
	LS_WORKSPACE_SYMBOL_OPTIONS
		redefine
			process
		end

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol_registration_options (Current)
		end

end
