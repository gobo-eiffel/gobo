note

	description:

		"Builders for lists of type definitions"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_TYPE_DEFINITION_BUILDER

inherit

	ET_BROWSABLE_TYPE_DEFINITION_BUILDER

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_position: like position; a_message_manager: like message_manager)
			-- Create a new type definition builder.
		require
			a_response_not_void: a_response /= Void
			a_position_not_void: a_position /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			position := a_position
			message_manager := a_message_manager
		ensure
			response_set: response = a_response
			position_set: position = a_position
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_TYPE_DEFINITION_RESPONSE
			-- List of type definitions to be built

	position: ET_POSITION
			-- Position being inspected

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	add_class (a_class: ET_CLASS; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add class `a_class` to the list of definitions.
		do
			add_location (a_class.name, a_class)
		end

	add_formal_parameter (a_formal_parameter: ET_FORMAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal paramater `a_formal_parameter` to the list of definitions.
		do
			add_location (a_formal_parameter.name, a_browsable_name.current_class)
		end
		
	add_location (a_node: ET_AST_NODE; a_class: ET_CLASS)
			-- Add location corresponding to `a_node` in `a_class` to `response`.
		require
			a_node_not_void: a_node /= Void
			a_class_no_void: a_class /= Void
		do
			if a_node.contains_position (position) then
					-- The browsable name is its own definition.
			elseif attached message_manager.location (a_node, a_class) as l_location then
				response.add_location (l_location)
			end
		end

invariant

	response_not_void: response /= Void
	position_not_void: position /= Void
	message_manager_not_void: message_manager /= Void

end
