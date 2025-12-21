note

	description:

		"Set of predefined values for LS_COMPLETION_TRIGGER_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_TRIGGER_KINDS

feature -- Access

	invoked: LS_COMPLETION_TRIGGER_KIND
			-- Completion was triggered by typing an identifier (24x7 code
			-- complete), manual invocation (e.g Ctrl+Space) or via API.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			invoked_not_void: Result /= Void
			instance_free: class
		end

	trigger_character: LS_COMPLETION_TRIGGER_KIND
			-- Completion was triggered by a trigger character specified by
			-- the `trigger_characters` properties of the
			-- `CompletionRegistrationOptions`.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			trigger_character_not_void: Result /= Void
			instance_free: class
		end

	trigger_for_incomplete_completions: LS_COMPLETION_TRIGGER_KIND
			-- Completion was re-triggered as the current completion list is incomplete.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			trigger_for_incomplete_completions_not_void: Result /= Void
			instance_free: class
		end

end
