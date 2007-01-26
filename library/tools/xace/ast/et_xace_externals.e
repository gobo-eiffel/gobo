indexing

	description:

		"Xace external clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_EXTERNALS

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new external clause.
		do
			create c_compiler_options.make
			create include_directories.make
			create link_libraries.make
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is current external clause empty?
		do
			Result := c_compiler_options.is_empty and include_directories.is_empty and link_libraries.is_empty
		end

	has_c_compiler_options: BOOLEAN is
			-- Are there some C compiler options?
		do
			Result := not c_compiler_options.is_empty
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

	c_compiler_options: DS_LINKED_LIST [STRING]
			-- C compiler options

	include_directories: DS_LINKED_LIST [STRING]
			-- Include directories

	link_libraries: DS_LINKED_LIST [STRING]
			-- Link libraries

feature -- Element change

	put_c_compiler_options (a_c_compiler_options: STRING) is
			-- Add a 'c_compiler_options' value to current external clause.
		require
			a_c_compiler_options_not_void: a_c_compiler_options /= Void
		do
			c_compiler_options.force_last (a_c_compiler_options)
		end

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

	c_compiler_options_not_void: c_compiler_options /= Void
	no_void_c_compiler_option: not c_compiler_options.has (Void)
	include_directories_not_void: include_directories /= Void
	no_void_include_directory: not include_directories.has (Void)
	link_libraries_not_void: link_libraries /= Void
	no_void_link_library: not link_libraries.has (Void)

end
