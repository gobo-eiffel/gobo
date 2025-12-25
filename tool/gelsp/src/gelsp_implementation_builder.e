note

	description:

		"Builders for lists of implementations of a given browsable name"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_IMPLEMENTATION_BUILDER

inherit

	ET_BROWSABLE_IMPLEMENTATION_BUILDER

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager)
			-- Create a new implementation builder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_IMPLEMENTATION_RESPONSE
			-- List of implementation locations to be built

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	add_feature (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add feature `a_feature` to the list of implementations of `a_browsable_name'.
		do
			add_location (a_feature.name, a_feature.implementation_class)
		end

	add_location (a_node: ET_AST_NODE; a_class: ET_CLASS)
			-- Add location corresponding to `a_node` in `a_class` to `response`.
		require
			a_node_not_void: a_node /= Void
			a_class_no_void: a_class /= Void
		do
			if attached message_manager.location (a_node, a_class) as l_location then
				response.add_location (l_location)
			end
		end

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void

end
