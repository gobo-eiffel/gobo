indexing

	description:

		"Objects that implement URI to media-type mapping rules"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_MEDIA_TYPE_MAP


	-- TODO: This will implement mapping URIs expressed as regular expressions,
	-- to media types, for when the resolver does not provide the information.

create

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing for now.
		do
		end

feature -- Access

	may_use_xpointer: BOOLEAN
			-- Set by last call to `check_fragment_processing_rules' if XPointer may be used

	may_use_id: BOOLEAN
			-- Set by last call to `check_fragment_processing_rules' if "{XM_XPATH_DOCUMENT}.selected_id" may be used

feature -- Element change

	check_fragment_processing_rules (a_media_type: UT_MEDIA_TYPE; xpointer_in_use, is_xhtml_spoofing: BOOLEAN) is
			-- Check which fragment-identifier processing rules apply to `a_media_type'
		require
			media_type_not_void:  a_media_type /= Void
		local
			a_type, a_subtype: STRING
		do
			may_use_xpointer := False
			may_use_id := False
			a_type := a_media_type.type
			a_subtype := a_media_type.subtype
			if a_type.is_equal ("text") then
				if a_subtype.is_equal ("html") then
					if is_xhtml_spoofing then
						a_type := "application"; a_subtype := "xhtml+xml"
					end
				elseif a_subtype.is_equal ("xml") or else a_subtype.is_equal ("xml-external-parsed-entity") then
					if xpointer_in_use then
						may_use_xpointer := True
					end
				end
			end
			if a_type.is_equal ("application") then
				if a_subtype.is_equal ("xml") or else a_subtype.is_equal ("xml-external-parsed-entity") or else a_subtype.is_equal ("xslt+xml") then
					if xpointer_in_use then
						may_use_xpointer := True
					end
				elseif a_subtype.is_equal ("xhtml+xml") then
					if xpointer_in_use then
						may_use_xpointer := True
					else
						may_use_id := True
					end
				elseif a_subtype.count > 4 and then a_subtype.substring (a_subtype.count - 4, a_subtype.count).is_equal ("+xml") then
					if xpointer_in_use then
						may_use_xpointer := True
					end
				end
			end
		end

end
	
