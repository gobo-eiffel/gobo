note

	description:

		"Objects that receive the results of XSLT transformations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TRANSFORMATION_RESULT

create

	make, make_emitter, make_receiver

create {XM_XSLT_OUTPUT_URI_RESOLVER, XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER}

	make_secondary_stream

feature {NONE} -- Initialization

	make (a_stream: XM_OUTPUT; a_system_id: STRING)
			-- Create a stream result.
		require
			stream_not_void: a_stream /= Void
			system_id_not_void: a_system_id /= Void
		do
			stream := a_stream
			is_stream := True
			system_id := a_system_id
		ensure
			stream_set: stream = a_stream
			system_id_set: system_id = a_system_id
		end

	make_secondary_stream (a_stream: XM_OUTPUT; an_output_stream: KI_CHARACTER_OUTPUT_STREAM; a_system_id:STRING)
			-- Create a stream result.
			-- This is used by XM_XSLT_OUTPUT_URI_FILE_SCHEME_RESOLVER
			--  so that the file can be closed correctly.
		require
			stream_not_void: a_stream /= Void
			system_id_not_void: a_system_id /= Void
			an_output_stream_not_void: an_output_stream /= Void
		do
			make (a_stream, a_system_id)
			output_stream := an_output_stream
		ensure
			stream_set: stream = a_stream
			system_id_set: system_id = a_system_id
			output_stream_set: output_stream = an_output_stream
		end

	make_emitter (an_emitter: XM_XSLT_EMITTER)
			-- Create an emitter result.
		require
			emitter_not_void: an_emitter /= Void
		do
			emitter := an_emitter
			principal_receiver := an_emitter
			is_emitter := True
			if attached an_emitter.document_uri as l_document_uri then
				system_id := l_document_uri.full_reference
			else
				system_id := an_emitter.base_uri
			end
		ensure
			emitter_set: emitter = an_emitter
		end

	make_receiver (a_receiver: XM_XPATH_RECEIVER)
			-- Create a receiver result.
		require
			receiver_not_void: a_receiver /= Void
		do
			receiver := a_receiver
			principal_receiver := a_receiver
			is_receiver := True
			if attached a_receiver.document_uri as l_document_uri then
				system_id := l_document_uri.full_reference
			else
				system_id := a_receiver.base_uri
			end
		ensure
			receiver_set: receiver = a_receiver
		end

feature -- Access

	emitter: detachable XM_XSLT_EMITTER
			-- Wrapped emitter

	stream: detachable XM_OUTPUT
			-- Wrapped stream

	receiver: detachable XM_XPATH_RECEIVER
			-- Wrapped receivr.

	principal_receiver: detachable XM_XPATH_RECEIVER
			-- Receiver for document node

	system_id: STRING
			-- System id

	response_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Body of response, if any;
			-- Principally expected from HTTP POST requests

feature -- Status report

	is_emitter: BOOLEAN
			-- Is this a wrapper for an `XM_XSLT_EMITTER'?

	is_stream: BOOLEAN
			-- Is this a wrapper for an `XM_OUTPUT'?

	is_receiver: BOOLEAN
			-- Is this a wrapper for an `XM_XPATH_RECEIVER'?

	error_message: detachable STRING
			-- Possible error message from output resolver

	is_document_started: BOOLEAN
			-- Has the result document been written to yet?
		do
			Result := attached principal_receiver as l_principal_receiver and then l_principal_receiver.is_written
		end

feature -- Element change

	set_principal_receiver (a_receiver: XM_XPATH_RECEIVER)
			-- Set `principal_receiver'.
		require
			new_receiver_not_void: a_receiver /= Void
		do
			principal_receiver := a_receiver
		ensure
			principal_receiver_set: principal_receiver = a_receiver
		end

	flush
			-- Flush `stream'.
		do
			if attached stream as l_stream then
				l_stream.flush
			end
		end

	close (some_properties: XM_XSLT_OUTPUT_PROPERTIES)
			-- Close output stream.
		require
			stream_result: is_stream
			output_properties_not_void: some_properties /= Void
		do
			if attached output_stream as l_output_stream then
				l_output_stream.close
			end
		end

feature {NONE} -- Implementation

	output_stream: detachable KI_CHARACTER_OUTPUT_STREAM
			-- Text stream for secondary output destination

invariant

	exactly_one_type: is_emitter xor is_stream xor is_receiver
	emitter: is_emitter implies emitter /= Void
	stream: is_stream implies stream /= Void
	receiver: is_receiver implies receiver /= Void
	system_id_not_void: system_id /= Void

end

