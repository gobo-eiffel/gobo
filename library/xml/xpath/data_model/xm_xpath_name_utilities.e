indexing

	description:

		"Routines for operating on XML names"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAME_UTILITIES

inherit

	XM_UNICODE_CHARACTERS_1_1

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	bits_11: INTEGER is 2048 -- 2^11
			-- For extracting depth and hash code from name code

	bits_16: INTEGER is 65536 -- 2^16
			-- For extracting uri code and prefix code from namespace code

	bits_20: INTEGER is 1048576 -- 2^20
			-- For extracting prefix index from name code

	bits_28:INTEGER is 268435455 -- 2^28 -1
			-- Maximum limit of fingerprint value

feature -- Status report
	
	is_valid_expanded_name (an_expanded_name: STRING): BOOLEAN is
			-- Is `an_expanded_name' a valid expanded name?
		require
			expanded_name_not_void: an_expanded_name /= Void
		local
			a_hash, an_index: INTEGER
			a_local_part, a_namespace_uri: STRING
		do
			a_hash := an_expanded_name.index_of ('#', 1)
			if a_hash > 0 then
				an_index := an_expanded_name.index_of ('#', a_hash + 1)
				if an_index > 0 then a_hash := an_index end -- (namespace-uri may include a #
				a_local_part := an_expanded_name.substring (a_hash + 1, an_expanded_name.count)
				a_namespace_uri := an_expanded_name.substring (1, a_hash - 1)
				Result := is_ncname (a_local_part)
			else
				Result := is_ncname (an_expanded_name)
			end
		end

feature -- Conversion

	fingerprint_from_name_code (a_name_code: INTEGER): INTEGER is
			-- Fingerprint of a name, given its name code
		do
			Result := a_name_code - ((a_name_code // bits_20) * bits_20)
		end

	expanded_name_from_components (a_namespace_uri, a_local_name: STRING): STRING is
			-- Expanded name from `a_namespace_uri' + `a_local_name'
		require
			local_name_is_NCName: a_local_name /= Void and then is_ncname (a_local_name)
		do
			if a_namespace_uri = Void or else a_namespace_uri.is_empty then
				Result := a_local_name
			else
				Result := STRING_.concat (a_namespace_uri, "#")
				Result := STRING_.appended_string (Result, a_local_name)
			end
		ensure
			result_not_void: Result /= Void
			no_shorter: Result.count >= a_local_name.count
		end

	local_name_from_expanded_name (an_expanded_name: STRING): STRING is
			-- Local name from `an_expanded_name'
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
		local
			a_hash, an_index: INTEGER
		do
			a_hash := an_expanded_name.index_of ('#', 1)
			if a_hash > 0 then
				an_index := an_expanded_name.index_of ('#', a_hash + 1)
				if an_index > 0 then a_hash := an_index end -- (namespace-uri may include a #
				Result := an_expanded_name.substring (a_hash + 1, an_expanded_name.count)
			else
				Result := an_expanded_name
			end
		ensure
			local_name_is_NCName: Result /= Void and then is_ncname (Result)
		end

	namespace_uri_from_expanded_name (an_expanded_name: STRING): STRING is
			-- Namespace_uri from `an_expanded_name'
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
		local
			a_hash, an_index: INTEGER
		do
			a_hash := an_expanded_name.index_of ('#', 1)
			if a_hash > 0 then
				an_index := an_expanded_name.index_of ('#', a_hash + 1)
				if an_index > 0 then a_hash := an_index end -- (namespace-uri may include a #
				Result := an_expanded_name.substring (1, a_hash - 1)
			else
				Result := ""
			end
		ensure
			namespace_uri_not_void: Result /= Void -- TODO: and then is_valid_iri_reference ?
		end

	prefix_index_from_name_code (a_name_code: INTEGER): INTEGER is -- should be INTEGER_8
		do
			Result := a_name_code // bits_20
		end

	prefix_code_from_namespace_code (a_namespace_code: INTEGER): INTEGER is -- should return INTEGER_16
			-- Extracted prefix code from `a_namespace_code'
		do
			Result := a_namespace_code // bits_16
		end

	uri_code_from_namespace_code (a_namespace_code: INTEGER): INTEGER is -- should return INTEGER_16
			-- Extracted prefix code from `a_namespace_code'
		do
			Result := a_namespace_code - 	(prefix_code_from_namespace_code (a_namespace_code) * bits_16)
		end

	created_namespace_code (a_uri_code, a_prefix_code: INTEGER): INTEGER is -- arguments should be INTEGER_16
			-- Namespace code from it's constituents
		do
			Result := (a_prefix_code * bits_16) + a_uri_code
		end
end
	
