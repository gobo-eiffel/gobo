note

	description:

		"Objects that need proviledged access to the document pool during transformations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_TRANSFORMER


feature -- Access

	document_pool: XM_XPATH_DOCUMENT_POOL
			-- Document pool
		deferred
		ensure
			result_not_void: Result /= Void
		end

feature -- Element change

	remove_document (a_uri: STRING)
			-- Remove `a_document' from `Current'.
			-- CAUTION: This breaks the guarentee of Unique URI to document mapping.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			mapped: document_pool.is_document_mapped (a_uri)
		do
			document_pool.remove (a_uri)
		ensure
			uri_not_mapped: not document_pool.is_document_mapped (a_uri)
		end

end
