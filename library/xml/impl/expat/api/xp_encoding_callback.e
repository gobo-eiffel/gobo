indexing

	description:

		"Class that makes the Expat 1.95 encoding callback available."

	status:  "See notice at end of class."
	author:  "Andreas Leitner, Berend de Boer"

deferred class XP_ENCODING_CALLBACK

feature {NONE}

	on_unknown_encoding_procedure (name_ptr, info_ptr: POINTER): BOOLEAN is
			-- This is called for an encoding that is unknown to the
			-- parser.  The encodingHandlerData argument is that which
			-- was passed as the second argument to
			-- XM_SetUnknownEncodingHandler.
			-- The name argument gives the name of the encoding as
			-- specified in the encoding declaration.
			-- If the callback can provide information about the
			-- encoding, it must fill in the XM_Encoding structure, and
			-- return 1.  Otherwise it must return 0.
			-- If info does not describe a suitable encoding, then the
			-- parser will return an XM_UNKNOWN_ENCODING error.
		deferred
		end

end -- class XP_ENCODING_CALLBACK

