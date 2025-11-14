note

	description:

		"LSP file system watchers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_SYSTEM_WATCHER

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_glob_pattern: like glob_pattern; a_kind: like kind)
			-- Create a new file system watcher.
		require
			a_glob_pattern_not_void: a_glob_pattern /= Void
		do
			glob_pattern := a_glob_pattern
			kind := a_kind
		ensure
			glob_pattern_set: glob_pattern = a_glob_pattern
			kind_set: kind = a_kind
		end

feature -- Access

	glob_pattern: LS_GLOB_PATTERN
			-- The glob pattern to watch.

	kind: detachable LS_WATCH_KIND
			-- The kind of events of interest. If omitted it defaults to
			-- `{LS_WATCH_KINDS}.create_ | {LS_WATCH_KINDS}.change | {LS_WATCH_KINDS}.delete``

feature -- Field names

	glob_pattern_name: STRING_8 = "globPattern"
	kind_name: STRING_8 = "kind"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_file_system_watcher (Current)
		end

invariant

	glob_pattern_not_void: glob_pattern /= Void

end
