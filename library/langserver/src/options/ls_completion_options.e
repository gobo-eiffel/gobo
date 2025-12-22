note

	description:

		"LSP 'textDocument/completion' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_OPTIONS

inherit

	LS_WORK_DONE_PROGRESS_OPTIONS
		rename
			make as make_work_done_progress_options
		end

create

	make

feature {NONE} -- Initialization

	make (a_trigger_characters: like trigger_characters;
		a_all_commit_characters: like all_commit_characters;
		a_resolve_provider: like resolve_provider;
		a_completion_item: like completion_item;
		a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		do
			trigger_characters := a_trigger_characters
			all_commit_characters := a_all_commit_characters
			resolve_provider := a_resolve_provider
			completion_item := a_completion_item
			work_done_progress := a_work_done_progress
		ensure
			trigger_characters_set: trigger_characters = a_trigger_characters
			all_commit_characters_set: all_commit_characters = a_all_commit_characters
			resolve_provider_set: resolve_provider = a_resolve_provider
			completion_item_set: completion_item = a_completion_item
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Access

	trigger_characters: detachable LS_STRING_LIST
			-- The additional characters, beyond the defaults provided by the client (typically
			-- [a-zA-Z]), that should automatically trigger a completion request. For example
			-- `.` in JavaScript represents the beginning of an object property or method and is
			-- thus a good candidate for triggering a completion request.
			--
			-- Most tools trigger a completion request automatically without explicitly
			-- requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they
			-- do so when the user starts to type an identifier. For example if the user
			-- types `c` in a JavaScript file code complete will automatically pop up
			-- present `console` besides others as a completion item. Characters that
			-- make up identifiers don't need to be listed here.

	all_commit_characters: detachable LS_STRING_LIST
			-- The list of all possible characters that commit a completion. This field
			-- can be used if clients don't support individual commit characters per
			-- completion item. See client capability
			-- `completion.completionItem.commitCharactersSupport`.
			--
			-- If a server provides both `allCommitCharacters` and commit characters on
			-- an individual completion item the ones on the completion item win.

	resolve_provider: detachable LS_BOOLEAN
			-- The server provides support to resolve additional
			-- information for a completion item.

	completion_item: detachable LS_COMPLETION_ITEM_OPTIONS
			-- The server supports the following `CompletionItem` specific
			-- capabilities.

feature -- Setting

	set_resolve_provider (a_resolve_provider: like resolve_provider)
			-- Set `resolve_provider` to `a_resolve_provider`.
		do
			resolve_provider := a_resolve_provider
		ensure
			resolve_provider_set: resolve_provider = a_resolve_provider
		end

feature -- Field names

	trigger_characters_name: STRING_8 = "triggerCharacters"
	all_commit_characters_name: STRING_8 = "allCommitCharacters"
	resolve_provider_name: STRING_8 = "resolveProvider"
	completion_item_name: STRING_8 = "completionItem"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_options (Current)
		end

end
