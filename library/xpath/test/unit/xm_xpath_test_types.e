note

	description:

		"Test type functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_TYPES

inherit

	TS_TEST_CASE

	XM_XPATH_TYPE

	XM_XPATH_SHARED_CONFORMANCE

create

	make_default

feature -- Test

	-- Some tests commented out, as they don't apply to a basic xslt processor

	test_types
		do
			conformance.set_basic_xslt_processor
			assert ("super type", type_factory.decimal_type.super_type = type_factory.numeric_type)
			assert ("is sub-type", is_sub_type (type_factory.any_atomic_type, type_factory.decimal_type) = False)
			assert ("is sub-type 2", is_sub_type (type_factory.integer_type, type_factory.any_atomic_type) = True)
--			assert ("is type name valid", is_type_name_valid ("xs:double") = True)
--			assert ("is Qname valid type", is_qname_valid_type (Xml_schema_uri, "double") = True)
--			assert ("is Qname valid type 2", is_qname_valid_type (Xml_schema_uri, "flooat") = False)
--			assert ("is Qname valid type 3", is_qname_valid_type (Xml_uri, "double") = False)
--			assert ("is system type", is_system_type ("element") = True)
--			assert ("is system type 2", is_system_type ("xs:double") = False)
			assert ("is node type", is_node_type (Element_node) = True)
--			assert ("is node type 2", is_node_type (Empty_item) = False)
--			assert ("is valid type", is_valid_type (Untyped_atomic_type) = True)
--			assert ("is valid type 2", is_valid_type (17) = False)
--			assert ("is valid type 3", is_valid_type (Document_node) = True)
--			assert ("is promotable", is_promotable (Unsigned_short_type, Integer_type) = False)
--			assert ("is promotable 2", is_promotable (Float_type, Double_type) = True)
--			assert ("item type", type_code ("item") = Any_item)
--			assert ("type name", type_name (Qname_type).is_equal ("xs:QName"))
--			assert ("type name2", type_name (Document_node).is_equal ("document"))
--			assert ("primitive type", primitive_type (Nmtoken_type) = String_type)
--			assert ("common super-type", common_super_type (Unsigned_short_type, Byte_type) = Integer_type)
--			assert ("named type", named_type (Xml_schema_datatypes_uri, "QName") = Qname_type)
--			assert ("system type", system_type ("document") = Document_node)
		end
end
