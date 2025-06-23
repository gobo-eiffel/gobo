note

	description:

		"Eiffel attributes used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_ATTRIBUTE

inherit

	COMPARABLE

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type)
			-- Create a new storable attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name := a_name
			type := a_type
		ensure
			name_set: name = a_name
			type_set: type = a_type
		end

feature -- Access

	name: STRING
			-- Name

	type: SB_TYPE
			-- Type

	index: INTEGER
			-- Index in attribute list

feature -- Status report

	is_added: BOOLEAN
			-- Has current attribute been added to schema class?

	is_removed: BOOLEAN
			-- Has current attribute been removed from schema class?

	has_type_error: BOOLEAN
			-- Has an error occurred when resolving `type'?

	has_name (a_name: like name): BOOLEAN
			-- Is the name of current attribute `a_name'?
			-- (Note: this is a case-insensitive comparison.)
		require
			a_name_not_void: a_name /= Void
		do
			Result := STRING_.same_case_insensitive (name, a_name)
		end

feature -- Setting

	set_index (i: INTEGER)
			-- Set `index' to `i'.
		do
			index := i
		ensure
			index_set: index = i
		end

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Status setting

	set_added (b: BOOLEAN)
			-- Set `is_added' to `b'.
		do
			is_added := b
		ensure
			is_added_set: is_added = b
		end

	set_removed (b: BOOLEAN)
			-- Set `is_removed' to `b'.
		do
			is_removed := b
		ensure
			is_removed_set: is_removed = b
		end

	set_type_error (b: BOOLEAN)
			-- Set `has_type_error' to `b'.
		do
			has_type_error := b
		ensure
			has_type_error_set: has_type_error = b
		end

feature -- Initialization

	reset
			-- Reset current attribute.
		do
			set_added (False)
			set_removed (False)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current attribute considered less than `other'?
		do
			if name.is_equal (other.name) then
				Result := is_removed
			else
				Result := name < other.name
			end
		end

feature -- Output

	print_attribute (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current attribute to `a_file' in
			-- a human readable format.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (name)
			a_file.put_string (": ")
			type.print_type (a_file)
		end

invariant

	name_not_void: name /= Void
	type_not_void: type /= Void

end
