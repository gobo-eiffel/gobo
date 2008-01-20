indexing

	description:

		"Xace mounted library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MOUNTED_LIBRARIES

inherit

	ANY -- Needed by SE 2.1.

	KL_IMPORTED_STRING_ROUTINES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_library: ET_XACE_MOUNTED_LIBRARY) is
			-- Create a new mounted library list with initially
			-- one library `a_library'.
		require
			a_library_not_void: a_library /= Void
		do
			create libraries.make (Initial_libraries_capacity)
			libraries.put_last (a_library)
		ensure
			one_library: libraries.count = 1
			libraries_set: libraries.last = a_library
		end

	make_empty is
			-- Create a new empty mounted library list.
		do
			create libraries.make (Initial_libraries_capacity)
		ensure
			is_empty: libraries.is_empty
		end

feature -- Access

	item (a_pathname: STRING): ET_XACE_MOUNTED_LIBRARY is
			-- Mounted library in `libraries' with pathname
			-- `a_pathname'; Void if not found
		require
			a_pathname_not_void: a_pathname /= Void
		local
			i, nb: INTEGER
			a_library: ET_XACE_MOUNTED_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				a_library := libraries.item (i)
				if STRING_.same_string (a_library.pathname, a_pathname) then
					Result := a_library
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			same_pathname: Result /= Void implies STRING_.same_string (Result.pathname, a_pathname)
		end

	libraries: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
			-- Libraries

feature -- Status setting

	set_root (b: BOOLEAN) is
			-- For each library in `libraries', set `is_root' to `b'.
		local
			i, nb: INTEGER
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				libraries.item (i).set_root (b)
				i := i + 1
			end
		ensure
			-- root_set: forall item in libraries, item.is_root = b
		end

feature -- Element change

	put_last (a_library: ET_XACE_MOUNTED_LIBRARY) is
			-- Add `a_library' to the list of libraries.
		require
			a_library_not_void: a_library /= Void
		do
			libraries.force_last (a_library)
		ensure
			one_more: libraries.count = old libraries.count + 1
			library_added: libraries.last = a_library
		end

feature -- Basic operations

	mount_libraries (a_clusters: ET_XACE_CLUSTERS) is
			-- Add clusters of current libraries to `a_clusters'.
			-- Mark these clusters as mounted.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			i, nb: INTEGER
			a_mounted_library: ET_XACE_MOUNTED_LIBRARY
			a_mounted_clusters: ET_XACE_CLUSTERS
			a_library: ET_XACE_LIBRARY
			a_prefix: STRING
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				a_mounted_library := libraries.item (i)
				a_library := a_mounted_library.library
				a_mounted_clusters := a_library.clusters
				if a_mounted_clusters /= Void then
					a_prefix := a_mounted_library.library_prefix
					if a_prefix = Void then
						a_prefix := a_library.library_prefix
					end
					check a_prefix_not_void: a_prefix /= Void end
					a_mounted_clusters.mount_libraries (a_clusters, a_prefix)
				end
				i := i + 1
			end
		end

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER) is
			-- Add current libraries to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			i, nb: INTEGER
			a_library, other_library: ET_XACE_MOUNTED_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				a_library := libraries.item (i)
				other_library := a_libraries.item (a_library.pathname)
				if other_library /= Void then
					if not other_library.is_root then
						if not a_library.same_library_prefix (other_library) then
							an_error_handler.report_multiple_library_prefix_error (a_library, other_library)
						end
					end
				else
					if a_library.is_root then
						a_library := a_library.cloned_object
						a_library.set_root (False)
					end
					a_libraries.put_last (a_library)
				end
				i := i + 1
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS) is
			-- Merge libraries' externals to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		local
			i, nb: INTEGER
			a_cursor: DS_HASH_SET_CURSOR [STRING]
			a_link_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			an_options: ET_XACE_OPTIONS
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				an_options := libraries.item (i).library.options
				if an_options /= Void then
					a_cursor := an_options.c_compiler_options.new_cursor
					from a_cursor.start until a_cursor.after loop
						an_externals.put_c_compiler_options (a_cursor.item)
						a_cursor.forth
					end
					a_cursor := an_options.header.new_cursor
					from a_cursor.start until a_cursor.after loop
						an_externals.put_include_directory (a_cursor.item)
						a_cursor.forth
					end
					a_link_cursor := an_options.link.new_cursor
					from a_link_cursor.start until a_link_cursor.after loop
						an_externals.put_link_library (a_link_cursor.item)
						a_link_cursor.forth
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_libraries_capacity: INTEGER is 10
			-- Initial capacity for `libraries'

invariant

	libraries_not_void: libraries /= Void
	not_void_library: not libraries.has (Void)

end
