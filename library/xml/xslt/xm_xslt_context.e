indexing

	description:

		"XSLT evaluation context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONTEXT

inherit

	XM_XPATH_CONTEXT

feature -- Access

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

invariant

	transformer_not_void: transformer /= Void

end
