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

feature -- Access

	bits_10: INTEGER is 1024 -- 2^10
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
			a_closing_brace: INTEGER
			a_local_part: STRING
		do
			if an_expanded_name.item (1).is_equal ('{') then
				a_closing_brace := an_expanded_name.index_of ('}', 1)
				if a_closing_brace < 2 then
					Result := False
				elseif a_closing_brace = an_expanded_name.count then
					Result := False
				else
					a_local_part := an_expanded_name.substring (a_closing_brace + 1, an_expanded_name.count)
					Result := is_ncname (a_local_part)
				end
			else
				Result := is_ncname (an_expanded_name)
			end
		end

feature -- Conversion

	fingerprint_from_name_code (a_name_code: INTEGER): INTEGER is
			-- Fingerprint of a name, given its name code
		local
		do
			Result := a_name_code - ((a_name_code // bits_20) * bits_20)
		end
	
	local_name_from_expanded_name (an_expanded_name: STRING): STRING is
			-- Local name from `an_expanded_name'
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
		local
			a_closing_brace: INTEGER
		do
			if an_expanded_name.item (1).is_equal ('{') then
				a_closing_brace := an_expanded_name.index_of ('}', 1)
					check
						closing_brace_present: a_closing_brace > 1
						-- from pre-condition
					end
				Result := an_expanded_name.substring (a_closing_brace + 1, an_expanded_name.count)
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
			a_closing_brace: INTEGER
		do
			if an_expanded_name.item (1).is_equal ('{') then
				a_closing_brace := an_expanded_name.index_of ('}', 1)
					check
						closing_brace_present: a_closing_brace > 1
						-- from pre-condition
					end
				if a_closing_brace = 2 then
					Result := ""
				else
					Result := an_expanded_name.substring (2, a_closing_brace - 1)
				end
			else
				Result := ""
			end
		ensure
			namespace_uri_not_void: Result /= void
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

end
	
