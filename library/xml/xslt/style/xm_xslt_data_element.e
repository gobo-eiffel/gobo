indexing

	description:

	"Top-level elements in a user-defined namespace, in an XSLT stylesheet.%
	%Also, children of such an element. These elements are ignored"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DATA_ELEMENT

inherit

	XM_XPATH_TREE_ELEMENT

creation {XM_XSLT_NODE_FACTORY}

	make

invariant

	namespace_uri_not_null: document.name_pool.namespace_uri_from_name_code (fingerprint).count > 0

end
	
