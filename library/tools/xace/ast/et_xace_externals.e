indexing

	description:

		"Xace external clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_EXTERNALS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new external clause.
		do
			!! exported_classes.make
			!! include_directories.make
			!! link_libraries.make
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is current external clause empty?
		do
			Result := exported_classes.is_empty and
				include_directories.is_empty and
				link_libraries.is_empty
		end

	has_exported_classes: BOOLEAN is
			-- Are there some exported classes?
		do
			Result := not exported_classes.is_empty
		end

	has_exported_features: BOOLEAN is
			-- Are there some exported features?
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_CLASS]
		do
			a_cursor := exported_classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not a_cursor.item.features.is_empty then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
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

	exported_classes: DS_LINKED_LIST [ET_XACE_EXPORTED_CLASS]
			-- Exported classes

	include_directories: DS_LINKED_LIST [STRING]
			-- Include directories

	link_libraries: DS_LINKED_LIST [STRING]
			-- Link libraries

feature -- Element change

	put_exported_class (a_class: ET_XACE_EXPORTED_CLASS) is
			-- Add an exported class to current external clause.
		require
			a_class_not_void: a_class /= Void
		do
			exported_classes.force_last (a_class)
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

	merge (other: like Current) is
			-- Added `other''s external clause to current externals.
		require
			other_not_void: other /= Void
		do
			exported_classes.append_last (other.exported_classes)
			include_directories.append_last (other.include_directories)
			link_libraries.append_last (other.link_libraries)
		end

feature -- Duplication

	cloned_externals: like Current is
			-- Clone version of current external clause
		do
			!! Result.make
			Result.merge (Current)
		ensure
			cloned_externals_not_void: Result /= Void
			same_exported_classes: Result.exported_classes.is_equal (exported_classes)
			same_include_directories: Result.include_directories.is_equal (include_directories)
			same_link_libraries: Result.link_libraries.is_equal (link_libraries)
		end

invariant

	exported_classes_not_void: exported_classes /= Void
	no_void_exported_class: not exported_classes.has (Void)
	include_directories_not_void: include_directories /= Void
	no_void_include_directory: not include_directories.has (Void)
	link_libraries_not_void: link_libraries /= Void
	no_void_link_library: not link_libraries.has (Void)

end -- class ET_XACE_EXTERNALS
