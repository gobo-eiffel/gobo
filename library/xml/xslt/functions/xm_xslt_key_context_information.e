indexing

	description:

		"Objects that supply context information for an XSLT key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_CONTEXT_INFORMATION

creation

	make

feature {NONE} -- Initialization is

		make (a_document: XM_XPATH_DOCUMENT; a_transformer: XM_XSLT_TRANSFORMER; a_fingerprint: INTEGER) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			transformer_not_void: a_transformer /= Void
			strictly_positive_fingerprint: a_fingerprint > 0
		do
			document := a_document
			transformer := a_transformer
			key_fingerprint := a_fingerprint
		ensure
			document_set: document = a_document
			transformer_set: transformer = a_transformer
			fingerprint_set: key_fingerprint = a_fingerprint
		end

feature -- Access

	document: XM_XPATH_DOCUMENT
			-- Context document

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	key_fingerprint: INTEGER
			-- Fingerprint of key's name

invariant

	document_not_void: document /= Void
	transformer_not_void: transformer /= Void
	strictly_positive_fingerprint: key_fingerprint > 0

end
	
