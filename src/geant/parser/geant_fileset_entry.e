indexing

	description:

		"Fileset entries"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FILESET_ENTRY

inherit

	HASHABLE
		redefine
			is_equal
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		undefine
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (a_filename, a_mapped_filename: STRING) is
			-- Initialize fileset entry by setting `filename' to `a_filename'
			-- and `mapped_filename' to `a_mapped_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
			a_mapped_filename_not_void: a_mapped_filename /= Void
			a_mapped_filename_not_empty: a_mapped_filename.count > 0
		do
			filename := a_filename
			mapped_filename := a_mapped_filename
		ensure
			filename_set: filename = a_filename
			mapped_filename_set: mapped_filename = a_mapped_filename
		end

feature -- Access

	filename: STRING
			-- Name of file for current entry

	mapped_filename: STRING
			-- Mapped name for `filename'

	filename_converted: STRING is
			-- `filename' converted to current filesystem
		do
			Result := file_system.pathname_from_file_system (filename, unix_file_system)
		ensure
			filename_converted_not_void: Result /= Void
		end

	mapped_filename_converted: STRING is
			-- `mapped_filename' converted to current filesystem
		do
			Result := file_system.pathname_from_file_system (mapped_filename, unix_file_system)
		ensure
			mapped_filename_converted_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := filename.hash_code
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered equal
			-- to current object?
		do
			Result := STRING_.same_string (filename, other.filename)
		end

feature -- Setting

	set_filename (a_filename: like filename) is
			-- Set `filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			filename := a_filename
		ensure
			filename_set: filename = a_filename
		end

	set_mapped_filename (a_mapped_filename: like mapped_filename) is
			-- Set `mapped_filename' to `a_mapped_filename'.
		require
			a_mapped_filename_not_void: a_mapped_filename /= Void
			a_mapped_filename_not_empty: a_mapped_filename.count > 0
		do
			mapped_filename := a_mapped_filename
		ensure
			mapped_filename_set: mapped_filename = a_mapped_filename
		end

invariant

	filename_not_void: filename /= Void
	filename_not_empty: filename.count > 0
	mapped_filename_not_void: mapped_filename /= Void
	mapped_filename_not_empty: mapped_filename.count > 0

end
