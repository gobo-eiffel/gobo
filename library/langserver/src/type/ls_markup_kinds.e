note

	description:

		"Set of predefined values for LS_MARKUP_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MARKUP_KINDS

feature -- Access

	plaintext: LS_MARKUP_KIND
			-- Plain text is supported as a content format
		local
			l_string: LS_STRING
		once
			l_string := "plaintext"
			Result := l_string
		ensure
			plaintext_not_void: Result /= Void
			instance_free: class
		end

	markdown: LS_MARKUP_KIND
			-- Markdown is supported as a content format
		local
			l_string: LS_STRING
		once
			l_string := "markdown"
			Result := l_string
		ensure
			markdown_not_void: Result /= Void
			instance_free: class
		end

end
