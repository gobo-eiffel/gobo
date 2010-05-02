note

	description:

	"Top-level elements in a user-defined namespace, in an XSLT stylesheet.%
	%Also, children of such an element. These elements are ignored"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DATA_ELEMENT

inherit

	XM_XPATH_TREE_ELEMENT

		-- This class is used for User-defined Data Elements whose namespace
		--  is not recognized by the implementation.

create {XM_XSLT_NODE_FACTORY}

	make

feature -- Status report

	is_parent_data_element: BOOLEAN
			-- Is `parent_node' a user-defined element?
		local
			a_user_defined_element: XM_XSLT_DATA_ELEMENT
		do
			a_user_defined_element ?= parent_node
			Result := a_user_defined_element  /= Void
		end

invariant

	namespace_uri_not_null: (parent_node /= Void and then not is_parent_data_element) implies shared_name_pool.namespace_uri_from_name_code (fingerprint).count > 0

end

