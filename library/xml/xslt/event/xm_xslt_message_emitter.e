indexing
	description:

	"Emitters that write xsl:messages."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_MESSAGE_EMITTER

inherit

	XM_XSLT_XML_EMITTER
		redefine
			end_document
		end

create

	make

feature -- Events

	end_document is
			-- Notify the end of the document
		do
			if is_output_open then
				output ("%N")
			end
			Precursor
		end

end


