note

	description:

		"Eiffel Storable file readers"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_READER

inherit

	ANY

	SB_CONSTANTS
		export {NONE} all end

	UT_IMPORTED_FORMATTERS
		export {NONE} all end

feature -- Schema input

	read_schema (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read schema from `a_file'.
			-- Set `error_handler.has_error' is an error occurred.
			-- Can also set `a_schema.has_attribute_type_error' (see header comment of this query).
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

feature -- Object input

	read_objects (a_objects: SB_OBJECTS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read objects from `a_file', using `a_schema'.
		require
			a_objects_not_void: a_objects /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

feature -- Error handler

	error_handler: SB_ERROR_HANDLER
			-- Error handler

	set_error_handler (a_error_handler: like error_handler)
			-- Set `error_handler' to `a_error_handler'.
		require
			a_error_handler_not_void: a_error_handler /= Void
		do
			error_handler := a_error_handler
		ensure
			error_handler_set: error_handler = a_error_handler
		end

invariant

	error_handler_not_void: error_handler /= Void

end
