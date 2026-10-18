note

	description:

		"Builders for lists of type definitions"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_TYPE_DEFINITION_BUILDER

inherit

	ET_BROWSABLE_NAME_TYPE_PROCESSOR

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_uri: like document_uri; a_position: like position; a_message_manager: like message_manager)
			-- Create a new type definition builder.
		require
			a_response_not_void: a_response /= Void
			a_uri_not_void: a_uri /= Void
			a_position_not_void: a_position /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			document_uri := a_uri
			position := a_position
			message_manager := a_message_manager
		ensure
			response_set: response = a_response
			document_uri_set: document_uri = a_uri
			position_set: position = a_position
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_TYPE_DEFINITION_RESPONSE
			-- List of type definitions to be built

	document_uri: LS_DOCUMENT_URI
			-- URI of the document being inspected

	position: ET_POSITION
			-- Position being inspected

	message_manager: GELSP
			-- Message manager

feature -- Processing

	process_class (a_class: ET_CLASS; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add class `a_class` to the list of definitions.
		do
			add_class_location (a_class)
		end

	process_formal_parameter (a_formal_parameter: ET_FORMAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal parameter `a_formal_parameter` to the list of definitions.
		do
			add_declaration_location (a_formal_parameter.name, a_browsable_name.current_class)
		end

feature {NONE} -- Implementation

	add_class_location (a_class: ET_CLASS)
			-- Add location corresponding to the class name of `a_class` to `response`. 
		require
			a_class_not_void: a_class /= Void
		do
			add_location (a_class.name, a_class)
		end
		
	add_declaration_location (a_identifier: ET_IDENTIFIER; a_class: ET_CLASS)
			-- Add location corresponding to the class name of `a_class` to `response`. 
		require
			a_identifier_not_void: a_identifier /= Void
			a_class_not_void: a_class /= Void
		do
			add_location (a_identifier, a_class)
		end

	add_location (a_node: ET_AST_NODE; a_class: ET_CLASS)
			-- Add location corresponding to `a_node` in `a_class` to `response`.
		require
			a_node_not_void: a_node /= Void
			a_class_no_void: a_class /= Void
		do
			if not attached message_manager.location (a_node, a_class) as l_location then
				-- No location to be added.
			elseif a_node.contains_position (position) and l_location.uri.same_uri (document_uri) then
				-- The browsable name is its own definition.
			else
				response.add_location (l_location)
			end
		end

invariant

	response_not_void: response /= Void
	document_uri_not_void: document_uri /= Void
	position_not_void: position /= Void
	message_manager_not_void: message_manager /= Void

end
