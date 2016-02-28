note

	description:

	"Objects that represent pending events."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_PENDING_EVENT

inherit

	XM_XPATH_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_content_string, a_name: STRING; a_node_type, some_properties: INTEGER)
			-- Establish invariant.
		require
			content_not_void: a_content_string /= Void
			name_not_void: a_name /= Void
			valid_node_type: a_node_type = Text_node or else a_node_type = Comment_node or else a_node_type = Processing_instruction_node
		do
			content := a_content_string
			name := a_name
			node_type := a_node_type
			properties := some_properties
		ensure
			content_set: content = a_content_string
			name_set: name = a_name
			node_type_set:	node_type = a_node_type
			properties_set: properties = some_properties
		end


feature -- Access

	content: STRING
			-- Content data

	name: STRING
			-- Node name

	node_type: INTEGER
			-- Node type

	properties: INTEGER
			-- Event properties

invariant

	content_not_void: content /= Void
	name_not_void: name /= Void
	valid_node_type: node_type = Text_node or else node_type = Comment_node or else node_type = Processing_instruction_node

end

