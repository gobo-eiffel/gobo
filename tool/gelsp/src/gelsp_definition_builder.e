note

	description:

		"Builders for lists of definitions"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_DEFINITION_BUILDER

inherit

	ET_BROWSABLE_NAME_PROCESSOR

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_uri: like document_uri; a_position: like position; a_message_manager: like message_manager)
			-- Create a new definition builder.
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

	response: LS_DEFINITION_RESPONSE
			-- List of definitions to be built

	document_uri: LS_DOCUMENT_URI
			-- URI of the document being inspected

	position: ET_POSITION
			-- Position being inspected

	message_manager: GELSP
			-- Message manager

feature {ET_BROWSABLE_NAME} -- Processing

	process_argument_name (a_name: ET_BROWSABLE_ARGUMENT_NAME)
			-- Process `a_name`.
		do
			if attached a_name.formal_argument as l_formal_argument then
				add_location (l_formal_argument.name, a_name.current_class)
			end
		end

	process_boolean_keyword (a_name: ET_BROWSABLE_BOOLEAN_KEYWORD)
			-- Process `a_name`.
		do
		end

	process_class_name (a_name: ET_BROWSABLE_CLASS_NAME)
			-- Process `a_name`.
		local
			l_class: ET_CLASS
		do
			l_class := a_name.actual_class
			add_location (l_class.name, l_class)
		end

	process_current_keyword (a_name: ET_BROWSABLE_CURRENT_KEYWORD)
			-- Process `a_name`.
		do
		end

	process_formal_parameter_name (a_name: ET_BROWSABLE_FORMAL_PARAMETER_NAME)
			-- Process `a_name`.
		do
			add_location (a_name.formal_parameter.name, a_name.current_class)
		end

	process_inline_separate_argument_name (a_name: ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME)
			-- Process `a_name`.
		do
			if attached a_name.inline_separate_argument as l_inline_separate_argument then
				add_location (l_inline_separate_argument.name, a_name.current_class)
			end
		end

	process_iteration_item_name (a_name: ET_BROWSABLE_ITERATION_ITEM_NAME)
			-- Process `a_name`.
		do
			if attached a_name.iteration_component as l_iteration_component then
				add_location (l_iteration_component.item_name, a_name.current_class)
			end
		end

	process_keyword (a_name: ET_BROWSABLE_KEYWORD)
			-- Process `a_name`.
		do
		end

	process_local_name (a_name: ET_BROWSABLE_LOCAL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.local_variable as l_local_variable then
				add_location (l_local_variable.name, a_name.current_class)
			end
		end

	process_object_test_local_name (a_name: ET_BROWSABLE_OBJECT_TEST_LOCAL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.object_test as l_object_test then
				add_location (l_object_test.name, a_name.current_class)
			end
		end

	process_precursor_name (a_name: ET_BROWSABLE_PRECURSOR_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_location (l_feature_impl.name, l_feature_impl.implementation_class)
			end
		end

	process_qualified_call_name (a_name: ET_BROWSABLE_QUALIFIED_CALL_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_location (l_feature_impl.name, l_feature_impl.implementation_class)
			end
		end

	process_result (a_name: ET_BROWSABLE_RESULT)
			-- Process `a_name`.
		do
			if attached a_name.current_closure as l_closure and then attached l_closure.type as l_type then
				add_location (l_type, a_name.current_class)
			end
		end

	process_tuple_label_name (a_name: ET_BROWSABLE_TUPLE_LABEL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.labeled_parameter as l_labeled_parameter then
				add_location (l_labeled_parameter.label, l_labeled_parameter.implementation_class)
			end
		end

	process_unqualified_alias_name (a_name: ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached {ET_FEATURE} a_name.current_closure as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_location (l_feature_impl.name, l_feature_impl.implementation_class)
			end
		end

	process_unqualified_call_name (a_name: ET_BROWSABLE_UNQUALIFIED_CALL_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_location (l_feature_impl.name, l_feature_impl.implementation_class)
			end
		end

	process_void_keyword (a_name: ET_BROWSABLE_VOID_KEYWORD)
			-- Process `a_name`.
		do
		end

feature {NONE} -- Implementation

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
