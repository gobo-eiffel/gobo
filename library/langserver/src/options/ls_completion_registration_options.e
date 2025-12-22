note

	description:

		"LSP 'textDocument/completion' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS
		rename
			make as make_text_document_registration_options
		end

	LS_COMPLETION_OPTIONS
		rename
			make as make_completion_options
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_trigger_characters: like trigger_characters;
		a_all_commit_characters: like all_commit_characters;
		a_resolve_provider: like resolve_provider;
		a_completion_item: like completion_item;
		a_document_selector: like document_selector;
		a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		do
			trigger_characters := a_trigger_characters
			all_commit_characters := a_all_commit_characters
			resolve_provider := a_resolve_provider
			completion_item := a_completion_item
			document_selector := a_document_selector
			work_done_progress := a_work_done_progress
		ensure
			trigger_characters_set: trigger_characters = a_trigger_characters
			all_commit_characters_set: all_commit_characters = a_all_commit_characters
			resolve_provider_set: resolve_provider = a_resolve_provider
			completion_item_set: completion_item = a_completion_item
			document_selector_set: document_selector = a_document_selector
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_registration_options (Current)
		end

end
