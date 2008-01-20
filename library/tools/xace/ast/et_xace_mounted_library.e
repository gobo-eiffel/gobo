indexing

	description:

		"Xace mounted libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MOUNTED_LIBRARY

inherit

	ANY -- Needed by SE 2.1.

	KL_CLONABLE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_pathname: like pathname; a_library: like library; a_position: like position) is
			-- Create a new mounted library.
		require
			a_pathname_not_void: a_pathname /= Void
			a_library_not_void: a_library /= Void
			a_position_not_void: a_position /= Void
		do
			pathname := a_pathname
			library := a_library
			position := a_position
		ensure
			pathname_set: pathname = a_pathname
			library_set: library = a_library
			position_set: position = a_position
		end

feature -- Status report

	is_root: BOOLEAN
			-- Is current library mounted directly to the top level
			-- system or library?

	same_library_prefix (other: ET_XACE_MOUNTED_LIBRARY): BOOLEAN is
			-- Do `Current' and `other' have the same library prefix?
		require
			other_not_void: other /= Void
		do
			if other.library_prefix /= Void then
				if library_prefix /= Void then
					Result := STRING_.same_string (other.library_prefix, library_prefix)
				end
			else
				Result := (library_prefix = Void)
			end
		end

feature -- Status setting

	set_root (b: BOOLEAN) is
			-- Set `is_root' to `b'.
		do
			is_root := b
		ensure
			root_set: is_root = b
		end

feature -- Access

	pathname: STRING
			-- Name of Xace file containing
			-- the library to be mounted

	library: ET_XACE_LIBRARY
			-- Mounted library

	library_prefix: STRING
			-- Prefix to be applied to the names of the
			-- clusters of the current mounted library

	position: XM_POSITION
			-- Position in Xace file
			-- (needed to report errors)

feature -- Setting

	set_library_prefix (a_prefix: like library_prefix) is
			-- Set `library_prefix' to `a_prefix'.
		do
			library_prefix := a_prefix
		ensure
			library_prefix_set: library_prefix = a_prefix
		end

invariant

	pathname_not_void: pathname /= Void
	library_not_void: library /= Void
	position_not_void: position /= Void

end
