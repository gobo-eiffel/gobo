indexing

	description:

		"Xace external clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_EXTERNALS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new external clause.
		do
			create include_directories.make
			create link_libraries.make
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is current external clause empty?
		do
			Result := include_directories.is_empty and link_libraries.is_empty
		end

	has_include_directories: BOOLEAN is
			-- Are there some include directories?
		do
			Result := not include_directories.is_empty
		end

	has_link_libraries: BOOLEAN is
			-- Are there some link libraries?
		do
			Result := not link_libraries.is_empty
		end

feature -- Access

	include_directories: DS_LINKED_LIST [STRING]
			-- Include directories

	link_libraries: DS_LINKED_LIST [STRING]
			-- Link libraries

feature -- Element change

	put_include_directory (a_directory: STRING) is
			-- Add an include directory to current external clause.
		require
			a_directory_not_void: a_directory /= Void
		do
			include_directories.force_last (a_directory)
		end

	put_link_library (a_link_library: STRING) is
			-- Add a link library to current external clause.
		require
			a_link_library_not_void: a_link_library /= Void
		do
			link_libraries.force_last (a_link_library)
		end

invariant

	include_directories_not_void: include_directories /= Void
	no_void_include_directory: not include_directories.has (Void)
	link_libraries_not_void: link_libraries /= Void
	no_void_link_library: not link_libraries.has (Void)

end
