indexing

	description:

		"Objects that create message emitters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_MESSAGE_EMITTER_FACTORY

feature -- Creation

	new_message_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_outputter: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES): XM_XPATH_RECEIVER is
			-- New destination for xsl:message
		require
			a_transformer_not_void: a_transformer /= Void
			a_outputter_not_void: a_outputter /= Void
			a_properties_not_void: a_properties /= Void
		do
			create {XM_XSLT_MESSAGE_EMITTER} Result.make (a_transformer, a_outputter, a_properties, Void)
		ensure
			new_message_emitter_not_void: Result /= Void
		end

end
	
