indexing

	description:

		"Objects that supply context information for an XSLT key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_CONTEXT_INFORMATION

inherit

	ANY -- SE 2.1

creation

	make

feature {NONE} -- Initialization is

		make (a_document: XM_XPATH_DOCUMENT; a_context: XM_XSLT_EVALUATION_CONTEXT; a_fingerprint: INTEGER) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			context_not_void: a_context /= Void
			strictly_positive_fingerprint: a_fingerprint > 0
		do
			document := a_document
			context := a_context
			key_fingerprint := a_fingerprint
		ensure
			document_set: document = a_document
			context_set: context = a_context
			fingerprint_set: key_fingerprint = a_fingerprint
		end

feature -- Access

	document: XM_XPATH_DOCUMENT
			-- Context document

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Dynamic context

	key_fingerprint: INTEGER
			-- Fingerprint of key's name

invariant

	document_not_void: document /= Void
	context_not_void: context /= Void
	strictly_positive_fingerprint: key_fingerprint > 0

end
	
