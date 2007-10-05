indexing

	description:

	"Emitters that write XML with possible DTD internal subset."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_GEXSLT_EXAMPLES_XML_EMITTER

inherit
	
	XM_XSLT_XML_EMITTER
		redefine
			write_doctype, make
		end

		-- This class implements the xsl:output method gexslt-examples:xml
		-- This is identical to the normal xml method, except that
		--  it permits the user to write the internal subset of the DTD.
		-- This is done by examing the value of the extension attribute:
		-- {http://www.gobosoft.com/eiffel/gobo/gexslt/extension/examples}internal-subset
		-- Not the namespace URI. This is not the normal gexslt namespace.
		-- It could have been, but the XSLT library treats this namespace specially,
		--  in that only known extension attributes are permitted.
		-- Whereas ANY attributes in other namespaces are permitted, the
		--  assumption being, they are either intended for another XSLT processor,
		--  or they are for a user-implemented (QName) output method.
		-- So this class is being written as the latter, as an example of what need to be done.

create

	make


feature {NONE} -- Initialization

	make (a_serializer: XM_XSLT_SERIALIZER; an_outputter: XM_OUTPUT; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES; a_character_map_expander: XM_XSLT_CHARACTER_MAP_EXPANDER) is
			-- Establish invariant.
		do
			Precursor (a_serializer, an_outputter, some_output_properties, a_character_map_expander)
			if some_output_properties.extension_attributes.has (extension_attribute_expanded_name) then
				dtd_internal_subset := some_output_properties.extension_attributes.item (extension_attribute_expanded_name)
			end
		end

feature {NONE} -- Implementation

	extension_attribute_expanded_name: STRING is "http://www.gobosoft.com/eiffel/gobo/gexslt/extension/example#internal-subset"
			-- Name of extension attribute specifying DTD internal subset to be written

	dtd_internal_subset: STRING
			-- Text of internal subset to be written

	write_doctype (a_type, a_system_id, a_public_id: STRING ) is
			-- Write DOCTYPE.
		do
			if is_declaration_written then
				output ("%N")
			end
			output ("<!DOCTYPE ")
			output (a_type)
			output ("%N")
			if a_system_id /= Void then
				if a_public_id = Void then
					output ("  SYSTEM %"")
					output (a_system_id)
					if dtd_internal_subset /= Void then write_internal_subset end
					output ("%">%N")
				else
					output ("  PUBLIC %"")
					output (a_public_id)
					output ("%" %"")
					output (a_system_id)
					if dtd_internal_subset /= Void then write_internal_subset end
					output ("%">%N")
				end
			elseif a_public_id /= Void then -- for HTML - not supported
				on_error ("SYSTEM identifier must be supplied when a PUBLIC identifier is supplied, when method='gexslt:xml' is specified.")
			end
		end

	write_internal_subset is
			-- Write DTD internal subset.
		require
			internal_subset_not_void: dtd_internal_subset /= Void
		do
			output ("[%N  ")
			output (dtd_internal_subset)
			output ("%N]")
		end

end
	
