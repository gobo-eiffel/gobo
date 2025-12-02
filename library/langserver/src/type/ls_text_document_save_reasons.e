note

	description:

		"Set of predefined values for LS_TEXT_DOCUMENT_SAVE_REASON"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_SAVE_REASONS

feature -- Access

	manual: LS_TEXT_DOCUMENT_SAVE_REASON
			-- Manually triggered, e.g. by the user pressing save, by starting
			-- debugging, or by an API call.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			manual_not_void: Result /= Void
			instance_free: class
		end

	after_delay : LS_TEXT_DOCUMENT_SAVE_REASON
			-- Automatic after a delay.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			after_delay_not_void: Result /= Void
			instance_free: class
		end

	focus_out: LS_TEXT_DOCUMENT_SAVE_REASON
			-- When the editor lost focus.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			focus_out_not_void: Result /= Void
			instance_free: class
		end

end
