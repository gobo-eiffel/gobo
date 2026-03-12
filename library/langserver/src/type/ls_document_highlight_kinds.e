note

	description:

		"Set of predefined values for LS_DOCUMENT_HIGHLIGHT"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_HIGHLIGHT_KINDS

feature -- Access

	text: LS_DOCUMENT_HIGHLIGHT_KIND
			-- A textual occurrence.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			text_not_void: Result /= Void
			instance_free: class
		end

	read: LS_DOCUMENT_HIGHLIGHT_KIND
			-- Read-access of a symbol, like reading a variable.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			read_not_void: Result /= Void
			instance_free: class
		end

	write: LS_DOCUMENT_HIGHLIGHT_KIND
			-- Write-access of a symbol, like writing to a variable.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			write_not_void: Result /= Void
			instance_free: class
		end

end
