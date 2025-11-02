note

	description:

		"Set of predefined values for LS_DIAGNOSTIC_TAG"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_TAGS

feature -- Access

	unnecessary: LS_DIAGNOSTIC_TAG
			-- Unused or unnecessary code.
			--
			-- Clients are allowed to render diagnostics with this tag faded out
			-- instead of having an error squiggle.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			unnecessary_not_void: Result /= Void
			instance_free: class
		end

	deprecated: LS_DIAGNOSTIC_TAG
			-- Deprecated or obsolete code.
			--
			-- Clients are allowed to rendered diagnostics with this tag strike through.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			deprecated_not_void: Result /= Void
			instance_free: class
		end

end
