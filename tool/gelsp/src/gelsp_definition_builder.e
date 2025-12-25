note

	description:

		"Builders for lists of definitions"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_DEFINITION_BUILDER

inherit

	ET_BROWSABLE_DEFINITION_BUILDER

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_position: like position; a_message_manager: like message_manager)
			-- Create a new definition builder.
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

	response: LS_DEFINITION_RESPONSE
			-- List of definitions to be built

	position: ET_POSITION
			-- Position being inspected

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	add_feature (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add feature `a_feature` to the list of definitions.
		do
			add_location (a_feature.name, a_feature.implementation_class)
		end

	add_tuple_label (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add tuple label `a_tuple_label` to the list of definitions.
		do
			add_location (a_tuple_label.label, a_tuple_label.implementation_class)
		end

	add_formal_argument (a_argument: ET_FORMAL_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal argument `a_argument` to the list of definitions.
		do
			add_location (a_argument.name, a_browsable_name.current_class)
		end

	add_local_variable (a_local_variable: ET_LOCAL_VARIABLE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local variable `a_local_variable` to the list of definitions.
		do
			add_location (a_local_variable.name, a_browsable_name.current_class)
		end

	add_result_type (a_result_type: ET_TYPE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add 'Result' type `a_result_type` to the list of definitions.
		do
			add_location (a_result_type, a_browsable_name.current_class)
		end

	add_object_test_local (a_object_test: ET_NAMED_OBJECT_TEST; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local of `a_object_test` to the list of definitions.
		do
			add_location (a_object_test.name, a_browsable_name.current_class)
		end

	add_iteration_item (a_iteration: ET_ITERATION_COMPONENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add iteration item of `a_iteration` to the list of definitions.
		do
			add_location (a_iteration.item_name, a_browsable_name.current_class)
		end

	add_inline_separate_argument (a_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add argument of inline separate instruction `a_inline_separate_argument` to the list of definitions.
		do
			add_location (a_inline_separate_argument.name, a_browsable_name.current_class)
		end

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
