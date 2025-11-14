note

	description:

		"LSP lists of file system watchers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_SYSTEM_WATCHER_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of file system watchers.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of file system watchers with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create file_system_watchers.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := file_system_watchers.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = file_system_watchers.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := file_system_watchers.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = file_system_watchers.capacity
		end

feature -- Access

	file_system_watcher (i: INTEGER): LS_FILE_SYSTEM_WATCHER
			-- File system watcher at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := file_system_watchers.item (i)
		ensure
			file_system_watcher_not_void: Result /= Void
			definition: Result = file_system_watchers.item (i)
		end

	file_system_watchers: DS_ARRAYED_LIST [LS_FILE_SYSTEM_WATCHER]
			-- File system watchers

feature -- Element change

	put_last (a_file_system_watcher: LS_FILE_SYSTEM_WATCHER)
			-- Put `a_file_system_watcher` at the end of the list of file system watchers.
		require
			a_file_system_watcher_not_void: a_file_system_watcher /= Void
		do
			file_system_watchers.force_last (a_file_system_watcher)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_file_system_watcher_list (Current)
		end

invariant

	file_system_watchers_not_void: file_system_watchers /= Void
	no_void_file_system_watcher: not file_system_watchers.has_void

end
