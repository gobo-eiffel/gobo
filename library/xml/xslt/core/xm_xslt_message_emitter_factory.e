note

	description:

		"Objects that create message emitters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_MESSAGE_EMITTER_FACTORY

feature -- Access

	outputter: XM_OUTPUT
			-- Destination for xsl:message output

feature -- Element change
	
	set_outputter (a_outputter: like outputter) is
			-- Set `outputter' to `a_outputter'.
		require
			a_outputter_not_void: a_outputter /= Void
		do
			outputter := a_outputter
		ensure
			outputter_set: outputter = a_outputter
		end

feature -- Creation

	new_message_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_properties: XM_XSLT_OUTPUT_PROPERTIES): XM_XPATH_RECEIVER is
			-- New destination for xsl:message
		require
			a_transformer_not_void: a_transformer /= Void
			a_properties_not_void: a_properties /= Void
		do
			if outputter = void then
				create outputter
				outputter.set_output_standard_error
			end
			create {XM_XSLT_MESSAGE_EMITTER} Result.make (a_transformer, outputter, a_properties)
		ensure
			new_message_emitter_not_void: Result /= Void
		end

end
	
