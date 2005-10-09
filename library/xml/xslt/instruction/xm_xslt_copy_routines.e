indexing

	description: "Routines common to xsl:copy and xsl:copy_of,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COPY_ROUTINES

inherit

	XM_XPATH_TYPE

feature {NONE} -- Implementation

	copy_attribute (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT; a_schema_type: ANY; a_validation_action: INTEGER) is
			-- Copy an attribute.
		require
			attribute_node_not_void: a_node /= Void and then a_node.node_type = Attribute_node
			context_not_void: a_context /= Void
			schema_type_not_supported: a_schema_type = Void
		do

			-- Schema validation stuff omitted

			a_context.current_receiver.notify_attribute (a_node.name_code, -1, a_node.string_value, 0)
		end

end
	
