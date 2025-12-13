note

	description:

		"LSP 'textDocument/typeDefinition' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TYPE_DEFINITION_OPTIONS

inherit

	LS_OPTIONAL_TYPE_DEFINITION_OPTIONS

	LS_WORK_DONE_PROGRESS_OPTIONS

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_type_definition_options (Current)
		end

end
