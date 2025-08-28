note

	description:

		"Reference objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_REFERENCE_OBJECT

inherit

	SB_OBJECT
		undefine
			is_equal
		end

	HASHABLE
		undefine
			is_equal
		end

	COMPARABLE

feature -- Access

	type: SB_TYPE
			-- Type

	storable_class: SB_CLASS
			-- Base class of `type'
		deferred
		ensure
			storable_class_not_void: Result /= Void
		end

	flags: NATURAL_32
			-- Flags (unit32)

	address: NATURAL_64
			-- Address

	hash_code: INTEGER
			-- Hash value
		do
			Result := address.hash_code
		end

feature -- Status report

	has_reference (a_object: SB_REFERENCE_OBJECT): BOOLEAN
			-- Does current object have `a_object' in one of its attributes?
		require
			a_object_not_void: a_object /= Void
		do
			Result := False
		end

feature -- Measurement

	reference_count: INTEGER
			-- Number of objects having current object as attribute

feature -- Setting

	set_reference_count (i: INTEGER)
			-- Set `reference_count' to `i'.
		require
			i_non_negative: i >= 0
		do
			reference_count := i
		ensure
			reference_count_set: reference_count = i
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current reference considered less than `other'?
		do
			Result := address < other.address
		end

feature -- Output

	dump_object (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current object to `a_file' in
			-- a format close to what has been read
			-- from the Storable file.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("object ")
			type.print_type (a_file)
			a_file.put_new_line
			a_file.put_string ("    address: 0x")
			a_file.put_string (address.to_hex_string)
			a_file.put_new_line
			a_file.put_string ("    flags: 0x")
			a_file.put_string (flags.to_hex_string)
			a_file.put_new_line
		end

invariant

	reference_count_non_negative: reference_count >= 0

end
