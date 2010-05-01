note

	description:

		"Expat encoding callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EXPAT_ENCODING_CALLBACK

feature -- Callbacks

	on_unknown_encoding_procedure (name_ptr, info_ptr: POINTER): BOOLEAN is
			-- This is called for an encoding that is unknown to the
			-- parser. The encodingHandlerData argument is that which
			-- was passed as the second argument to
			-- XML_SetUnknownEncodingHandler.
			-- The `name_ptr' argument gives the name of the encoding as
			-- specified in the encoding declaration.
			-- If the callback can provide information about the
			-- encoding, it must fill in the XM_Encoding structure, and
			-- return 1.  Otherwise it must return 0.
			-- If `info_ptr' does not describe a suitable encoding, then the
			-- parser will return an XM_UNKNOWN_ENCODING error.
		deferred
		end

end
