note

	description:

		"LSP 'workspace/symbol' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WORKSPACE_SYMBOL_PARAMS

inherit

	LS_WORK_DONE_PROGRESS_PARAMS

	LS_PARTIAL_RESULT_PARAMS

feature -- Access

	query: LS_STRING
			-- A query string to filter symbols by. Clients may send an empty
			-- string here to request all symbols.

feature -- Field names

	query_name: STRING_8 = "query"
			-- Field names

invariant

	query_not_void: query /= Void

end
