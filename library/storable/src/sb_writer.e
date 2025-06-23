note

	description:

		"Eiffel Storable file writers"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_WRITER

inherit

	ANY

	SB_CONSTANTS
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

feature -- Schema output

	write_schema (a_schema: SB_SCHEMA; a_file: SB_OUTPUT_FILE)
			-- Write `a_schema' to `a_file'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

feature -- Object output

	write_objects (a_objects: SB_OBJECTS; a_file: SB_OUTPUT_FILE)
			-- Write `a_objects' to `a_file'.
		require
			a_objects_not_void: a_objects /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

end
