note

	description:

		"Set of predefined values for LS_SYMBOL_TAG"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_TAGS

feature -- Access

	deprecated: LS_SYMBOL_TAG
			-- Render a symbol as obsolete, usually using a strike-out.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			deprecated_not_void: Result /= Void
			instance_free: class
		end

end
