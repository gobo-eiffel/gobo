indexing

	description:

		"Objects that create message emitters which do nothing"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NULL_MESSAGE_EMITTER_FACTORY

inherit

	XM_XSLT_MESSAGE_EMITTER_FACTORY
		redefine
			new_message_emitter
		end

feature -- Creation

	new_message_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_outputter: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES): XM_XPATH_RECEIVER is
			-- New destination for xsl:message
		do
			create {XM_XSLT_NULL_SEQUENCE_RECEIVER} Result.make
		end

end
	
