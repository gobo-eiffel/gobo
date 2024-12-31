note
	description: "Serialize and deserialize objects to and from SED_READER_WRITER instances."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2017-09-25 15:53:33 +0000 (Mon, 25 Sep 2017) $"
	revision: "$Revision: 100789 $"

class
	SED_STORABLE_FACILITIES

feature -- Serialization routines

	session_store (an_object: ANY; a_writer: SED_READER_WRITER; a_optimized_for_retrieval: BOOLEAN)
			-- Serialization of `an_object' using `a_writer'.
			-- Object stored can only be retrieved during current program execution.
		require
			an_object_not_void: an_object /= Void
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		local
			l_serializer: SED_SESSION_SERIALIZER
		do
			l_serializer := session_serializer (a_writer)
			a_writer.write_header
			a_writer.write_natural_32 (eiffel_session_store)
			l_serializer.set_root_object (an_object)
			l_serializer.encode
			a_writer.write_footer
		end

	basic_store (an_object: ANY; a_writer: SED_READER_WRITER; a_optimized_for_retrieval: BOOLEAN)
			-- Serialization of `an_object' using `a_writer'.
			-- Object stored can only be retrieved by execution of same program executable.
		require
			an_object_not_void: an_object /= Void
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		local
			l_serializer: SED_BASIC_SERIALIZER
		do
			l_serializer := basic_serializer (a_writer)
			a_writer.write_header
			a_writer.write_natural_32 (eiffel_basic_store)
			l_serializer.set_root_object (an_object)
			l_serializer.encode
			a_writer.write_footer
		end

	independent_store (an_object: ANY; a_writer: SED_READER_WRITER; a_optimized_for_retrieval: BOOLEAN)
			-- Serialization of `an_object' using `a_writer'.
			-- Object stored can only be retrieved by programs having the same set of types.
		obsolete
			"Use `store' instead. [2017-05-31]"
		require
			an_object_not_void: an_object /= Void
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		local
			l_serializer: SED_RECOVERABLE_SERIALIZER
		do
			l_serializer := recoverable_serializer (a_writer)
			a_writer.write_header
			a_writer.write_natural_32 (eiffel_recoverable_store)
			l_serializer.set_root_object (an_object)
			l_serializer.encode
			a_writer.write_footer
		end

	store (an_object: ANY; a_writer: SED_READER_WRITER)
			-- Serialization of `an_object' using `a_writer'.
			-- Object stored can only be retrieved by programs having the same set of types.
		require
			an_object_not_void: an_object /= Void
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		local
			l_serializer: SED_RECOVERABLE_SERIALIZER
		do
			l_serializer := recoverable_serializer (a_writer)
			a_writer.write_header
			a_writer.write_natural_32 (eiffel_recoverable_store)
			l_serializer.set_root_object (an_object)
			l_serializer.encode
			a_writer.write_footer
		end

	store_in_medium (an_object: ANY; a_medium: IO_MEDIUM)
			-- Serialization of `an_object' in `a_medium'
			-- Object stored can only be retrieved by programs having the same set of types.
		require
			an_object_not_void: an_object /= Void
			a_medium_not_void: a_medium /= Void
			a_medium_writable: a_medium.is_open_write
			a_medium_support_storable: a_medium.support_storable
		do
			store (an_object, create {SED_MEDIUM_READER_WRITER}.make_for_writing (a_medium))
		end

	retrieved (a_reader: SED_READER_WRITER; a_is_gc_enabled: BOOLEAN): detachable ANY
			-- Deserialization of object from `a_reader'.
			-- Garbage collection will be enabled if `a_is_gc_enabled'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		local
			l_deserializer: detachable SED_SESSION_DESERIALIZER
			l_retrieved_errors: like retrieved_errors
		do
			a_reader.read_header
			inspect
				a_reader.read_natural_32
			when eiffel_session_store then l_deserializer := session_deserializer (a_reader)
			when eiffel_basic_store then l_deserializer := basic_deserializer (a_reader)
			when eiffel_recoverable_store then l_deserializer := recoverable_deserializer (a_reader)
			when eiffel_independent_store then
					-- Obsolete type.
				create l_retrieved_errors.make (1)
				l_retrieved_errors.extend ((create {SED_ERROR_FACTORY}).new_obsolete_storable_type)
				retrieved_errors := l_retrieved_errors
			else
					-- Unknown type.
				create l_retrieved_errors.make (1)
				l_retrieved_errors.extend ((create {SED_ERROR_FACTORY}).new_unknown_storable_type)
				retrieved_errors := l_retrieved_errors
			end

			if l_deserializer /= Void then
				l_deserializer.decode (a_is_gc_enabled)
				retrieved_errors := l_deserializer.errors
				if not l_deserializer.has_error then
					Result := l_deserializer.last_decoded_object
					a_reader.read_footer
				end
			end
		end

	retrieved_from_medium (a_medium: IO_MEDIUM): detachable ANY
			-- Deserialization of object from `a_reader'.
		require
			a_medium_not_void: a_medium /= Void
			a_medium_open_for_reading: a_medium.is_open_read
			a_medium_support_storable: a_medium.support_storable
		do
			Result := retrieved (create {SED_MEDIUM_READER_WRITER}.make_for_reading (a_medium), False)
		end

	retrieved_error: detachable SED_ERROR
			-- Error set from last call to `retrieved'.
		obsolete
			"Use `retrieved_errors' directly. [2017-05-31]"
		do
			if attached retrieved_errors as l_errors and then not l_errors.is_empty then
				Result := l_errors.last
			end
		end

	retrieved_errors: detachable ARRAYED_LIST [SED_ERROR]
			-- Errors set from last call to `retrieved'.		

feature -- Storable type

	eiffel_session_store: NATURAL_32 = 0x00000001
	eiffel_basic_store: NATURAL_32 = 0x00000002
	eiffel_independent_store: NATURAL_32 = 0x00000003
	eiffel_recoverable_store: NATURAL_32 = 0x00000004
			-- Various type of storable mechanism.

feature {NONE} -- Access

	session_deserializer (a_reader: SED_READER_WRITER): SED_SESSION_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		do
			Result := internal_session_deserializer (a_reader)
			Result.set_deserializer (a_reader)
		ensure
			session_deserializer_not_void: Result /= Void
		end

	basic_deserializer (a_reader: SED_READER_WRITER): SED_BASIC_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		do
			Result := internal_basic_deserializer (a_reader)
			Result.set_deserializer (a_reader)
		ensure
			basic_deserializer_not_void: Result /= Void
		end

	recoverable_deserializer (a_reader: SED_READER_WRITER): SED_RECOVERABLE_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		do
			Result := internal_recoverable_deserializer (a_reader)
			Result.set_deserializer (a_reader)
		ensure
			recoverable_deserializer_not_void: Result /= Void
		end

	session_serializer (a_writer: SED_READER_WRITER): SED_SESSION_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		do
			Result := internal_session_serializer (a_writer)
			Result.set_serializer (a_writer)
		ensure
			session_serializer_not_void: Result /= Void
		end

	basic_serializer (a_writer: SED_READER_WRITER): SED_BASIC_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		do
			Result := internal_basic_serializer (a_writer)
			Result.set_serializer (a_writer)
		ensure
			basic_serializer_not_void: Result /= Void
		end

	recoverable_serializer (a_writer: SED_READER_WRITER): SED_RECOVERABLE_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		do
			Result := internal_recoverable_serializer (a_writer)
			Result.set_serializer (a_writer)
		ensure
			independent_serializer_not_void: Result /= Void
		end

feature {NONE} -- Data

	internal_session_deserializer (a_reader: SED_READER_WRITER): SED_SESSION_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		once
			create Result.make (a_reader)
		ensure
			session_deserializer_not_void: Result /= Void
		end

	internal_basic_deserializer (a_reader: SED_READER_WRITER): SED_BASIC_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		once
			create Result.make (a_reader)
		ensure
			basic_deserializer_not_void: Result /= Void
		end

	internal_recoverable_deserializer (a_reader: SED_READER_WRITER): SED_RECOVERABLE_DESERIALIZER
			-- New instance of `session' based on `a_reader'.
		require
			a_reader_not_void: a_reader /= Void
			a_reader_ready: a_reader.is_ready_for_reading
		once
			create Result.make (a_reader)
		ensure
			recoverable_deserializer_not_void: Result /= Void
		end

	internal_session_serializer (a_writer: SED_READER_WRITER): SED_SESSION_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		once
			create Result.make (a_writer)
		ensure
			session_serializer_not_void: Result /= Void
		end

	internal_basic_serializer (a_writer: SED_READER_WRITER): SED_BASIC_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		once
			create Result.make (a_writer)
		ensure
			basic_serializer_not_void: Result /= Void
		end

	internal_recoverable_serializer (a_writer: SED_READER_WRITER): SED_RECOVERABLE_SERIALIZER
			-- New instance of `session' based on `a_writer'.
		require
			a_writer_not_void: a_writer /= Void
			a_writer_ready: a_writer.is_ready_for_writing
		once
			create Result.make (a_writer)
		ensure
			internal_recoverable_serializer_not_void: Result /= Void
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2017, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
