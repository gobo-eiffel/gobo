note

	description:

		"LSP suggestions for completion"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_CONTEXT

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_trigger_kind: like trigger_kind; a_trigger_character: like trigger_character)
			-- Create a new completion context.
		require
			a_trigger_kind_not_void: a_trigger_kind /= Void
		do
			trigger_kind := a_trigger_kind
			trigger_character := a_trigger_character
		ensure
			trigger_kind_set: trigger_kind = a_trigger_kind
			trigger_character_set: trigger_character = a_trigger_character
		end

feature -- Access

	trigger_kind: LS_COMPLETION_TRIGGER_KIND
			-- How the completion was triggered.

	trigger_character: detachable LS_STRING
			-- The trigger character (a single character) that has trigger code
			-- complete. Is undefined if
			-- `trigger_kind /= {LS_COMPLETION_TRIGGER_KINDS}.trigger_character`

feature -- Field names

	trigger_kind_name: STRING_8 = "triggerKind"
	trigger_character_name: STRING_8 = "triggerCharacter"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_context (Current)
		end

invariant

	trigger_kind_not_void: trigger_kind /= Void

end
