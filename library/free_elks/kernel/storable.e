note
	description: "[
		Objects that may be stored and retrieved along with all their dependents.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	STORABLE

inherit
	EXCEPTIONS

feature -- Access

	retrieved (medium: IO_MEDIUM): ANY
			-- Retrieved object structure, from external
			-- representation previously stored in `medium'.
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if medium content is not a stored Eiffel structure.
		require
			medium_not_void: medium /= Void
			medium_exists: medium.exists
			medium_is_open_read: medium.is_open_read
			medium_supports_storable: medium.support_storable
		do
			Result := medium.retrieved
		ensure
			Result_exists: Result /= Void
		end

	retrieve_by_name (file_name: STRING): detachable ANY
			-- Retrieve object structure, from external
			-- representation previously stored in a file
			-- called `file_name'.
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if file content is not a stored Eiffel structure.
			-- Will return Void if the file does not exist or
			-- is not readable.
		require
			file_name_exists: file_name /= Void
			file_name_meaningful: not file_name.is_empty
		local
			file: RAW_FILE
		do
			create file.make (file_name)
			if file.exists and then file.is_readable then
				file.open_read
				Result := file.retrieved
				file.close
			end
		end

feature -- Setting

	set_discard_pointers (v: BOOLEAN)
			-- If `v' it will discard POINTER values and replace them by
			-- the `default_pointer' pointer. Otherwise it keeps the original value.
		external
			"C signature (EIF_BOOLEAN) use %"eif_retrieve.h%""
		alias
			"eif_set_discard_pointer_values"
		end

	set_new_independent_format (v: BOOLEAN)
			-- If `v' it will use ISE Eiffel 5.0 storable format for
			-- storing.
		obsolete
			"It is now the new format. Use former version of EiffelStudio to store in the old format."
		do
		end

	set_new_recoverable_format (v: BOOLEAN)
			-- If `v' it will use ISE Eiffel 5.3 storable format for
			-- storing with ability to recover when there is a type mismatch.
		obsolete
			"It is now the new format. Use former version of EiffelStudio to store in the old format."
		do
		end

feature -- Element change

	basic_store (medium: IO_MEDIUM)
			-- Produce on `medium' an external representation of the
			-- entire object structure reachable from current object.
			-- Retrievable within current system only.
		require
			medium_not_void: medium /= Void
			medium_exists: medium.exists
			medium_is_open_write: medium.is_open_write
			medium_supports_storable: medium.support_storable
		do
			medium.basic_store (Current)
		end

	general_store (medium: IO_MEDIUM)
			-- Produce on `medium' an external representation of the
			-- entire object structure reachable from current object.
			-- Retrievable from other systems for same platform
			-- (machine architecture).
			--| This feature may use a visible name of a class written
			--| in the `visible' clause of the Ace file. This makes it
			--| possible to overcome class name clashes.
		require
			medium_not_void: medium /= Void
			medium_exists: medium.exists
			medium_is_open_write: medium.is_open_write
			medium_supports_storable: medium.support_storable
		do
			medium.general_store (Current)
		end

	independent_store (medium: IO_MEDIUM)
			-- Produce on `medium' an external representation of the
			-- entire object structure reachable from current object.
			-- Retrievable from other systems for the same or other
			-- platform (machine architecture).
		require
			medium_not_void: medium /= Void
			medium_exists: medium.exists
			medium_is_open_write: medium.is_open_write
			medium_supports_storable: medium.support_storable
		do
			medium.independent_store (Current)
		end

	store_by_name (file_name: STRING)
			-- Produce on file called `file_name' an external
			-- representation of the entire object structure
			-- reachable from current object.
			-- Retrievable from other systems for same platform
			-- (machine architecture).
		require
			file_name_not_void: file_name /= Void
			file_name_meaningful: not file_name.is_empty
		local
			file: RAW_FILE
			l_io_exception: IO_FAILURE
		do
			create file.make (file_name)
			if (file.exists and then file.is_writable) or else
				(file.is_creatable) then
				file.open_write
				file.independent_store (Current)
				file.close
			else
				create l_io_exception
				l_io_exception.set_message ("write permission failure")
				l_io_exception.raise
			end
		end

end
