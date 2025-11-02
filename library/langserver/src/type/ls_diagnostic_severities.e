note

	description:

		"Set of predefined values for LS_DIAGNOSTIC_SEVERITY"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_SEVERITIES

feature -- Access

	error: LS_DIAGNOSTIC_SEVERITY
			-- Reports an error.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			error_not_void: Result /= Void
			instance_free: class
		end

	warning: LS_DIAGNOSTIC_SEVERITY
			-- Reports a warning.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			warning_not_void: Result /= Void
			instance_free: class
		end

	information: LS_DIAGNOSTIC_SEVERITY
			-- Reports an information.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			information_not_void: Result /= Void
			instance_free: class
		end

	hint: LS_DIAGNOSTIC_SEVERITY
			-- Reports a hint.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 4
			Result := l_integer
		ensure
			hint_not_void: Result /= Void
			instance_free: class
		end

end
