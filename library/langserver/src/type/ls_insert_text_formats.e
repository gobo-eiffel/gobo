note

	description:

		"Set of predefined values for LS_INSERT_TEXT_FORMAT"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_TEXT_FORMATS

feature -- Access

	plain_text: LS_INSERT_TEXT_FORMAT
			-- The primary text to be inserted is treated as a plain string.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			plain_text_not_void: Result /= Void
			instance_free: class
		end

	snippet: LS_INSERT_TEXT_FORMAT
			-- The primary text to be inserted is treated as a snippet.
			--
			-- A snippet can define tab stops and placeholders with `$1`, `$2`
			-- and `${3:foo}`. `$0` defines the final tab stop, it defaults to
			-- the end of the snippet. Placeholders with equal identifiers are linked,
			-- that is typing in one will update others too.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			snippet_not_void: Result /= Void
			instance_free: class
		end

end
