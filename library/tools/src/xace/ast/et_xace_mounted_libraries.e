note

	description:

		"Xace mounted library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MOUNTED_LIBRARIES

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_library: ET_XACE_MOUNTED_LIBRARY)
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

	make_empty
			-- Create a new empty mounted library list.
		do
			create libraries.make (Initial_libraries_capacity)
		ensure
			is_empty: libraries.is_empty
		end

feature -- Access

	item (a_pathname: STRING): detachable ET_XACE_MOUNTED_LIBRARY
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

	root_item (a_pathname: STRING): detachable ET_XACE_MOUNTED_LIBRARY
			-- Library in `libraries' with pathname `a_pathname' which is mounted
			-- directly to the top level system or library;
			-- Void if not found
		require
			a_pathname_not_void: a_pathname /= Void
		local
			i, nb: INTEGER
			a_library: ET_XACE_MOUNTED_LIBRARY
		do
			nb := root_count
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

feature -- Measurement

	count: INTEGER
			-- Number of mounted libraries
		do
			Result := libraries.count
		ensure
			definition: Result = libraries.count
		end

	root_count: INTEGER
			-- Number of libraries mounted directly to the top level system or library.
			-- They are listed first in `libraries'.

feature -- Setting

	set_root_count (a_root_count: INTEGER)
			-- Set `root_count' to `a_root_count'.
		require
			a_root_count_not_negative: a_root_count >= 0
			a_root_count_small_enough: a_root_count <= count
		do
			root_count := a_root_count
		ensure
			root_count_set: root_count = a_root_count
		end

feature -- Element change

	put_last (a_library: ET_XACE_MOUNTED_LIBRARY)
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

	mount_libraries (a_clusters: ET_XACE_CLUSTERS)
			-- Add clusters of current libraries to `a_clusters'.
			-- Mark these clusters as mounted.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			i, nb: INTEGER
			a_mounted_library: ET_XACE_MOUNTED_LIBRARY
			a_mounted_clusters: detachable ET_XACE_CLUSTERS
			a_library: ET_XACE_LIBRARY_CONFIG
			a_prefix: detachable STRING
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

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER)
			-- Add current libraries to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			i, nb: INTEGER
			a_library: ET_XACE_MOUNTED_LIBRARY
			other_library: detachable ET_XACE_MOUNTED_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				a_library := libraries.item (i)
				other_library := a_libraries.item (a_library.pathname)
				if other_library /= Void then
					if not a_library.same_library_prefix (other_library) then
						if a_libraries.root_item (a_library.pathname) = Void then
							an_error_handler.report_multiple_library_prefix_error (a_library, other_library)
						end
					end
				else
					a_libraries.put_last (a_library)
				end
				i := i + 1
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS)
			-- Merge libraries' externals to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		local
			i, nb: INTEGER
			an_options: detachable ET_XACE_OPTIONS
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				an_options := libraries.item (i).library.options
				if an_options /= Void then
					if attached an_options.multivalue ({ET_XACE_OPTION_NAMES}.c_compiler_options_option_name) as l_multivalue then
						across l_multivalue as i_c_compiler_option loop
							an_externals.put_c_compiler_options (i_c_compiler_option)
						end
					end
					if attached an_options.multivalue ({ET_XACE_OPTION_NAMES}.header_option_name) as l_multivalue then
						across l_multivalue as i_include loop
							an_externals.put_include_directory (i_include)
						end
					end
					if attached an_options.multivalue ({ET_XACE_OPTION_NAMES}.link_option_name) as l_multivalue then
						across l_multivalue as i_link loop
							an_externals.put_link_library (i_link)
						end
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_libraries_capacity: INTEGER = 10
			-- Initial capacity for `libraries'

invariant

	libraries_not_void: libraries /= Void
	not_void_library: not libraries.has_void
	root_count_not_negative: root_count >= 0
	root_count_small_enough: root_count <= count

end
