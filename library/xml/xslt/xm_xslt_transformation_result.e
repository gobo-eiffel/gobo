indexing

	description:

		"Objects that receive the results of XSLT transformations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMATION_RESULT

creation

	make, make_emitter, make_receiver

feature {NONE} -- Initialization

	make (a_stream: XM_OUTPUT) is
			-- Create a stream result.
		require
			stream_not_void: a_stream /= Void
		do
			stream := a_stream
			is_stream := True
		ensure
			stream_set: stream = a_stream
		end

	make_emitter (an_emitter: XM_XSLT_EMITTER) is
			-- Create an emitter result.
		require
			emitter_not_void: an_emitter /= Void
		do
			emitter := an_emitter
			is_emitter := True
		ensure
			emitter_set: emitter = an_emitter
		end

	make_receiver (a_receiver: XM_XPATH_RECEIVER) is
			-- Create a receiver result.
		require
			receiver_not_void: a_receiver /= Void
		do
			receiver := a_receiver
			is_receiver := True
		ensure
			receiver_set: receiver = a_receiver
		end

feature -- Access

	emitter: XM_XSLT_EMITTER
			-- Wrapped emitter

	stream: XM_OUTPUT
			-- Wrapped stream

	receiver: XM_XPATH_RECEIVER
			-- Wrapped receivr.
	
feature -- Status report

	is_emitter: BOOLEAN
			-- Is this a wrapper for an `XM_XSLT_EMITTER'?

	is_stream: BOOLEAN
			-- Is this a wrapper for an `XM_OUTPUT'?

	is_receiver: BOOLEAN
			-- Is this a wrapper for an `XM_XPATH_RECEIVER'?

invariant

	exactly_one_type: is_emitter xor is_stream xor is_receiver
	emitter: is_emitter implies emitter /= Void
	stream: is_stream implies stream /= Void
	receiver: is_receiver implies receiver /= Void

end
	
