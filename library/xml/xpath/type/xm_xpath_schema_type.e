indexing

	description:

		"Objects that represent an XML Schema style data type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SCHEMA_TYPE
	
inherit
	
	XM_XPATH_ITEM_TYPE

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_TYPE_FACTORY
	
	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

feature -- Access

	fingerprint: INTEGER
			-- Fingerprint from the name pool

	local_name: STRING
			-- Local name

	namespace_uri: STRING
			--Namespace uri

	base_type: XM_XPATH_SCHEMA_TYPE
			-- Base type

	standard_display_name: STRING is
			-- Display name for a standard type
		require
			standard_type: type_factory.is_built_in_fingerprint (fingerprint)
		do
			Result := STRING_.appended_string (type_factory.conventional_prefix (fingerprint), local_name)
		ensure
			printable_result: Result /= Void and then Result.count > 0
		end

	description: STRING is
			-- Description of type
		do
			if type_factory.is_built_in_fingerprint (fingerprint) then
				Result := standard_display_name
			else
				-- TODO
			end
		ensure
			description_not_void: Result /= Void
		end

	is_simple_type: BOOLEAN is
			-- Is `Current' a simple type?
		do
			Result := False
		end

	as_simple_type: XM_XPATH_SIMPLE_TYPE is
			-- `Current' seen as a simple type
		require
			simple_type: is_simple_type
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_complex_type: BOOLEAN is
			-- Is `Current' a complex type?
		do
			Result := False
		end

	as_complex_type: XM_XPATH_COMPLEX_TYPE is
			-- `Current' seen as a complex type
		require
			complex_type: is_complex_type
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

invariant

	base_type_may_be_void: True
	local_name_not_void: local_name /= Void and then local_name.count > 0
	namespace_uri_not_void: namespace_uri /= Void
	simple_or_complex: is_simple_type xor is_complex_type

end
