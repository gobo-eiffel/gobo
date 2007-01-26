indexing

	description:

		"Singleton objects that match against particular types of node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_NODE_KIND_TESTS

feature -- Access

	document_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Document test
		once
			create Result.make_document_test
		end

	element_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Element test
		once
			create Result.make_element_test
		end

	attribute_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Attribute test
		once
			create Result.make_attribute_test
		end

	text_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Text test
		once
			create Result.make_text_test
		end

	processing_instruction_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Processing instruction test
		once
			create Result.make_processing_instruction_test
		end

	comment_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Comment test
		once
			create Result.make_comment_test
		end

	namespace_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- Namespace test
		once
			create Result.make_namespace_test
		end

end
