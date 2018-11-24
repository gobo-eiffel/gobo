note
	description: "External iteration cursor for a file."

class
	FILE_ITERATION_CURSOR

inherit
	DISPOSABLE
		rename
			dispose as close
		end

	ITERATION_CURSOR [CHARACTER_8]
		rename
			item as character
		end

create {FILE}
	make_empty,
	make_open_read,
	make_open_stdin

feature {NONE} -- Creation

	make_empty
			-- Create an iterator without any items.
		do
				-- file_pointer := default_pointer
		ensure
			after
		end

	make_open_read (name: MANAGED_POINTER)
			-- Open a file of name `name` to iterate over.
		do
				-- Initialize file handle.
			file_pointer := {FILE}.file_open (name.item, 0)
				-- Read first byte if possible.
			forth
		end

	make_open_stdin
			-- Open standard input.
		do
				-- Initialize file handle.
			file_pointer := {CONSOLE}.console_def (0)
				-- Read first byte if possible.
			forth
		end

feature -- Access

	character: CHARACTER_8
			-- <Precursor>
			-- See also `byte`.
		do
			Result := byte.to_character_8
		end

	byte: NATURAL_8
			-- <Precursor>
			-- See also `character`.

feature -- Status report	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		do
			Result := file_pointer = default_pointer
		end

feature -- Cursor movement

	forth
			-- <Precursor>
			-- Attempt to read a byte from the file and make it available in `byte` and `character`.
		do
			if {RAW_FILE}.file_fread ($byte, 1, 1, file_pointer) /= 1 then
					-- There is an error or EOF, stop reading.
				close
			end
		end

feature -- Disposal

	close
			-- <Precursor>
			-- Release resources associated with the file.
		do
			if file_pointer /= default_pointer then
				{FILE}.file_close (file_pointer)
				file_pointer := default_pointer
			end
		end

feature {NONE} -- Access

	file_pointer: POINTER
			-- File pointer used by low-level C operations.

invariant

	consistent_item: byte.to_character_8 = character

note
	date: "$Date$"
	revision: "$Revision$"
	author: "Alexander Kogtenkov"
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
