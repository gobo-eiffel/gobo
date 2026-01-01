note

	description:

		"LSP 'workspace/symbol' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_OPTIONS

inherit

	LS_OPTIONAL_WORKSPACE_SYMBOL_OPTIONS

	LS_WORK_DONE_PROGRESS_OPTIONS
		rename
			make as make_work_done_progress_options
		end

create

	make

feature {NONE} -- Initialization

	make (a_resolve_provider: like resolve_provider; a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		do
			resolve_provider := a_resolve_provider
			work_done_progress := a_work_done_progress
		ensure
			resolve_provider_set: resolve_provider = a_resolve_provider
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Access

	resolve_provider: detachable LS_BOOLEAN
			-- The server provides support to resolve additional
			-- information for a workspace symbol.

feature -- Setting

	set_resolve_provider (a_resolve_provider: like resolve_provider)
			-- Set `resolve_provider` to `a_resolve_provider`.
		do
			resolve_provider := a_resolve_provider
		ensure
			resolve_provider_set: resolve_provider = a_resolve_provider
		end

feature -- Field names

	resolve_provider_name: STRING_8 = "resolveProvider"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol_options (Current)
		end

end
