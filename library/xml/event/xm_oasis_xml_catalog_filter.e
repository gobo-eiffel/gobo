note

	description:

	"Filters that read oasis-xml-catalog PIs and update the catalog manager."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_OASIS_XML_CATALOG_FILTER

inherit

	XM_DTD_CALLBACKS_FILTER
		rename
			make_null as make_dtd_null,
			set_next as set_next_dtd,
			next as dtd_callbacks
		redefine
			on_dtd_end, on_dtd_processing_instruction
		end

	XM_CALLBACKS_FILTER
		rename
			make_null as make_filter_null,
			set_next as set_next_filter,
			next as callbacks
		redefine
			on_processing_instruction, on_start_tag
		end

	XM_SHARED_CATALOG_MANAGER

	KL_IMPORTED_STRING_ROUTINES

create

	set_next

feature {NONE} -- Initalization

	set_next (a_callback: XM_CALLBACKS; a_dtd_callback: XM_DTD_CALLBACKS) is
			-- Set forward chains.
		require
			callbacks_not_void: a_callback /= Void
			dtd_callbacks_not_void: a_dtd_callback /= Void
		do
			callbacks := a_callback
			dtd_callbacks := a_dtd_callback
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		do
			is_disallowed := True
			Precursor (a_namespace, a_prefix, a_local_part)
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		local
			a_catalog_name: STRING
		do
			if STRING_.same_string (a_name, "xml-stylesheet") then
				is_disallowed := True
			elseif STRING_.same_string (a_name, "oasis-xml-catalog") and then shared_catalog_manager.are_processing_instructions_allowed then
				if is_disallowed then
					shared_catalog_manager.debug_message (1, "Oasis-xml-catalog processing instruction appears too late in the document", "ignored")
				else
					if is_doubtful then
						shared_catalog_manager.debug_message (2, "Oasis-xml-catalog processing instruction might be erroneous as it appears after other PI", other_pi)
					end
					if a_content.substring_index ("catalog=%"", 1) = 1 and then a_content.count > 11 and then a_content.index_of ('"', a_content.count) > 0 then 
						a_catalog_name := a_content.substring (10, a_content.count - 1)
						shared_catalog_manager.add_pi_catalog (a_catalog_name)
					else
						shared_catalog_manager.debug_message (1, "Oasis-xml-catalog processing has invalid content", a_content)
					end
				end
			elseif not is_disallowed and then not is_doubtful and then a_content.count > 0 then
					other_pi := a_name
					is_doubtful := True
			end
			Precursor (a_name, a_content)
		end

feature -- Document type definition callbacks

	on_dtd_end is
			-- End of DTD.
		do
			is_disallowed := True
			Precursor
		end

	on_dtd_processing_instruction (a_name, a_content: STRING) is
			-- PI.
		do
			if STRING_.same_string (a_name, "oasis-xml-catalog") then
				shared_catalog_manager.debug_message (1, "Oasis-xml-catalog processing instruction is not allowed in the DTD", "ignored")
			end
			is_disallowed := True
			Precursor (a_name, a_content)
		end
	

feature {NONE} -- Implementation

	is_disallowed: BOOLEAN
			-- Are oasis-xml-catalog PIs disallowed at thia point

	is_doubtful: BOOLEAN
			-- Have other PIs appeared?

	other_pi: STRING
			-- Processing instruction which raised doubtful status

invariant
	
end
