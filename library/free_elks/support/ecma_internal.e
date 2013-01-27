note
	description: "Version of INTERNAL which does not use the mapping of STRING to STRING_8, INTEGER to INTEGER_32, etc..."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2008-12-29 20:36:38 +0100 (Mon, 29 Dec 2008) $"
	revision: "$Revision: 254 $"

class
	ECMA_INTERNAL

inherit
	INTERNAL
		redefine
			is_pre_ecma_mapping_disabled
		end

feature -- Access

	is_pre_ecma_mapping_disabled: BOOLEAN
			-- Are we mapping old names to new ECMA names?
			-- No, because we are only using the ECMA names.
		do
			Result := True
		end

end
