note

	description:
	"[
		"LSP marked strings.
		
		Used to render human readable text. It is either a
		markdown string or a code-block that provides a language and a code snippet.
		The language identifier is semantically equal to the optional language
		identifier in fenced code blocks in GitHub issues.

		Deprecated, use DS_MARKUP_CONTENT instead.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MARKED_STRING

inherit

	LS_STRING_CONTENTS

end
