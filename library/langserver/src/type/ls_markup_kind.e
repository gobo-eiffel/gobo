note

	description:
	"[
		LSP markup kinds.

		Describes the content type that a client supports in various
		result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
		
		Please note that `MarkupKinds` must not start with a `$`. This kinds
		are reserved for internal usage.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MARKUP_KIND

inherit

	LS_ANY

end
