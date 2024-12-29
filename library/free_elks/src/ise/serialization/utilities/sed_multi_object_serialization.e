note
	description: "Serialize and deserialize multiple objects into one file."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2022-09-29 09:42:30 +0000 (Thu, 29 Sep 2022) $"
	revision: "$Revision: 106354 $"

class
	SED_MULTI_OBJECT_SERIALIZATION

inherit
	ANY
		redefine
			default_create
		end

inherit {NONE}

	SED_STORABLE_FACILITIES
		export
			{NONE} all
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
		do
--			create error_message.make_empty
		end

feature -- Access

	deserialized_object: detachable ANY
			-- Last deserialized object

	last_file_position: INTEGER
			-- Position after last serialization

	error_message: detachable STRING_32
			-- Reason for failure

feature -- Status report

	successful: BOOLEAN
			-- Was last retrieval successful?

feature -- Basic Operations

	deserialize (path: READABLE_STRING_GENERAL; a_pos: INTEGER)
			-- Deserialize object previously serialized in `path' at position `a_pos'.
		require
			non_void_path: path /= Void
			valid_path: (create {RAW_FILE}.make_with_name (path)).exists
		local
			retried: BOOLEAN
			l_raw_file: detachable RAW_FILE
			l_reader: SED_MEDIUM_READER_WRITER
		do
			if not retried then
				create l_raw_file.make_with_name (path)
				if l_raw_file.exists then
					l_raw_file.open_read
					l_raw_file.go (a_pos)
					create l_reader.make (l_raw_file)
					l_reader.set_for_reading
					if l_reader.is_ready_for_reading then
						deserialized_object := retrieved (l_reader, True)
						successful := deserialized_object /= Void
					else
						successful := False
					end
				else
					successful := False
				end
			else
				successful := False
			end
			if l_raw_file /= Void and then not l_raw_file.is_closed then
				l_raw_file.close
			end
		ensure
			deserialized_object_set_if_no_error: successful implies deserialized_object /= Void
		rescue
			debug ("log_exceptions")
				log_last_exception
			end
			retried := True
			retry
		end

	serialize (a: ANY; path: READABLE_STRING_GENERAL; is_appending: BOOLEAN)
			-- Serialize object `a' at the end of file `path' if `is_appending', otherwise
			-- reset content of `path'.
			-- Set `last_file_position' after storing.
		require
			non_void_object: a /= Void
			non_void_path: path /= Void
		local
			l_raw_file: detachable RAW_FILE
			l_writer: SED_MEDIUM_READER_WRITER
			retried: BOOLEAN
			err: like error_message
		do
			if not retried then
				create l_raw_file.make_with_name (path)
				if is_appending then
					l_raw_file.open_append
				else
					l_raw_file.open_write
				end
				create l_writer.make (l_raw_file)
				l_writer.set_for_writing
				store (a, l_writer)
				last_file_position := l_raw_file.count
				successful := True
				error_message := Void
			else
				successful := False
				create err.make (100)
				err.append_string_general ("Cannot store into ")
				err.append_string_general (path)
				error_message := err
			end
			if l_raw_file /= Void and then not l_raw_file.is_closed then
				l_raw_file.close
			end
		rescue
			debug ("log_exceptions")
				log_last_exception
			end
			retried := True
			retry
		end

feature {NONE} -- Logging

	log_last_exception
			-- Log last exception.
		do
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2022, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
