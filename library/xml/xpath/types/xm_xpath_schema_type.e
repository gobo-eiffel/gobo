indexing

	description:

		"Objects that represent an XML Schema style data type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SCHEMA_TYPE
	
inherit
	
	XM_XPATH_ITEM_TYPE

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SHARED_TYPE_FACTORY

feature -- Access

	fingerprint: INTEGER
			-- Fingerprint from the name pool

	local_name: STRING
			-- Local name

	namespace_uri: STRING
			--Namespace uri

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

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

invariant

	base_type_may_be_void: True
	well_known_type: fingerprint < 1024 implies name_pool = Void
	user_defined_type: fingerprint >= 1024 implies name_pool /= Void
	local_name_not_void: local_name /= Void and then local_name.count > 0
	namespace_uri_not_void: namespace_uri /= Void

end
