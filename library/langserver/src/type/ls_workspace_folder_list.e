note

	description:

		"LSP lists of workspace folders"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_FOLDER_LIST

inherit

	LS_OPTIONAL_WORKSPACE_FOLDER_LIST

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of workspace folders.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of workspace folders with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create workspace_folders.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := workspace_folders.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = workspace_folders.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := workspace_folders.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = workspace_folders.capacity
		end

feature -- Access

	workspace_folder (i: INTEGER): LS_WORKSPACE_FOLDER
			-- Workspace folder at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := workspace_folders.item (i)
		ensure
			workspace_folder_not_void: Result /= Void
			definition: Result = workspace_folders.item (i)
		end

	workspace_folders: DS_ARRAYED_LIST [LS_WORKSPACE_FOLDER]
			-- Workspace folders

feature -- Element change

	put_last (a_workspace_folder: LS_WORKSPACE_FOLDER)
			-- Put `a_workspace_folder` at the end of the list of workspace folders.
		require
			workspace_folders: a_workspace_folder /= Void
		do
			workspace_folders.force_last (a_workspace_folder)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_folder_list (Current)
		end

invariant

	workspace_folders_not_void: workspace_folders /= Void
	no_void_workspace_folder: not workspace_folders.has_void

end
