indexing

	description:

		"Fileset Entry"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_FILESET_ENTRY

inherit

	DS_PAIR [STRING, STRING]
		rename
			first as filename,
			second as mapped_filename,
			put_first as set_filename,
			put_second as set_mapped_filename
		end

	HASHABLE

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

creation

	make

feature -- Access

	filename_converted: STRING is
			-- `filename' converted to current filesystem
		do
			Result := clone (filename)
			Result := file_system.pathname_from_file_system (Result, unix_file_system)
		end

	mapped_filename_converted: STRING is
			-- `mapped_filename' converted to current filesystem
		do
			Result := clone (mapped_filename)
			Result := file_system.pathname_from_file_system (Result, unix_file_system)
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := filename.hash_code
		end

end -- class GEANT_FILESET_ENTRY

