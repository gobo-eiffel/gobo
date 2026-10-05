note

	description:

		"Builders for lists of definitions in contract views"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_CONTRACT_VIEW_DEFINITION_BUILDER

inherit

	ET_BROWSABLE_NAME_PROCESSOR

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_uri: like document_uri; a_position: like position; a_message_manager: like message_manager)
			-- Create a new contract view definition builder.
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
				add_declaration_location (l_formal_argument.name, a_name.current_class)
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
			add_class_location (l_class)
		end

	process_current_keyword (a_name: ET_BROWSABLE_CURRENT_KEYWORD)
			-- Process `a_name`.
		do
		end

	process_formal_parameter_name (a_name: ET_BROWSABLE_FORMAL_PARAMETER_NAME)
			-- Process `a_name`.
		do
			add_declaration_location (a_name.formal_parameter.name, a_name.current_class)
		end

	process_inline_separate_argument_name (a_name: ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME)
			-- Process `a_name`.
		do
			if attached a_name.inline_separate_argument as l_inline_separate_argument then
				add_declaration_location (l_inline_separate_argument.name, a_name.current_class)
			end
		end

	process_iteration_item_name (a_name: ET_BROWSABLE_ITERATION_ITEM_NAME)
			-- Process `a_name`.
		do
			if attached a_name.iteration_component as l_iteration_component then
				add_declaration_location (l_iteration_component.item_name, a_name.current_class)
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
				add_declaration_location (l_local_variable.name, a_name.current_class)
			end
		end

	process_object_test_local_name (a_name: ET_BROWSABLE_OBJECT_TEST_LOCAL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.object_test as l_object_test then
				add_declaration_location (l_object_test.name, a_name.current_class)
			end
		end

	process_precursor_name (a_name: ET_BROWSABLE_PRECURSOR_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_feature_location (l_feature_impl, l_feature_impl.implementation_class)
			end
		end

	process_qualified_call_name (a_name: ET_BROWSABLE_QUALIFIED_CALL_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_feature_location (l_feature_impl, l_feature_impl.implementation_class)
			end
		end

	process_result (a_name: ET_BROWSABLE_RESULT)
			-- Process `a_name`.
		do
			if attached a_name.current_closure as l_closure then
				add_query_type_location (l_closure, a_name.current_class)
			end
		end

	process_tuple_label_name (a_name: ET_BROWSABLE_TUPLE_LABEL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.labeled_parameter as l_labeled_parameter then
				add_declaration_location (l_labeled_parameter.label, l_labeled_parameter.implementation_class)
			end
		end

	process_unqualified_alias_name (a_name: ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached {ET_FEATURE} a_name.current_closure as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_feature_location (l_feature_impl, l_feature_impl.implementation_class)
			end
		end

	process_unqualified_call_name (a_name: ET_BROWSABLE_UNQUALIFIED_CALL_NAME)
			-- Process `a_name`.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached a_name.call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				add_feature_location (l_feature_impl, l_feature_impl.implementation_class)
			end
		end

	process_void_keyword (a_name: ET_BROWSABLE_VOID_KEYWORD)
			-- Process `a_name`.
		do
		end

feature {NONE} -- Implementation

	add_class_location (a_class: ET_CLASS)
			-- Add location corresponding to the class name of `a_class` to `response`. 
		require
			a_class_not_void: a_class /= Void
		local
			l_location: LS_LOCATION
			l_range: ET_RANGE
		do
			if attached contract_view_uri (a_class) as l_uri and then attached contract_view (l_uri, a_class) as l_contract_view then
				l_range := l_contract_view.class_name_range
				if not (l_range.contains (position) and l_uri.same_uri (document_uri)) then
					create l_location.make (l_uri, message_manager.range_to_lsp (l_range))
					response.add_location (l_location)
				end
			end
		end

	add_declaration_location (a_identifier: ET_IDENTIFIER; a_class: ET_CLASS)
			-- Add location corresponding to the class name of `a_class` to `response`. 
		require
			a_identifier_not_void: a_identifier /= Void
			a_class_not_void: a_class /= Void
		local
			l_location: LS_LOCATION
		do
			if attached contract_view_uri (a_class) as l_uri and then attached contract_view (l_uri, a_class) as l_contract_view then
				if attached l_contract_view.declaration_ranges.value (a_identifier) as l_range then
					if not (l_range.contains (position) and l_uri.same_uri (document_uri)) then
						create l_location.make (l_uri, message_manager.range_to_lsp (l_range))
						response.add_location (l_location)
					end
				end
			end
		end

	add_feature_location (a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Add location corresponding to `a_feature` in `a_class` to `response`. 
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			l_location: LS_LOCATION
			l_range: ET_RANGE
		do
			if attached contract_view_uri (a_class) as l_uri and then attached contract_view (l_uri, a_class) as l_contract_view then
				if attached l_contract_view.features.value (a_feature.name) as l_feature then
					l_range := l_feature.feature_name_range
					if not (l_range.contains (position) and l_uri.same_uri (document_uri)) then
						create l_location.make (l_uri, message_manager.range_to_lsp (l_range))
						response.add_location (l_location)
					end
				else
						-- It might be that the feature is not exported and hence not
						-- visible in contract view. Show the feature in the class text
						-- in that case.
					add_location (a_feature, a_class)
				end
			end
		end

	add_query_type_location (a_query: ET_CLOSURE; a_class: ET_CLASS)
			-- Add location corresponding to the type of `a_query` to `response`. 
		require
			a_query_not_void: a_query /= Void
			a_class_not_void: a_class /= Void
		local
			l_location: LS_LOCATION
		do
			if attached contract_view_uri (a_class) as l_uri and then attached contract_view (l_uri, a_class) as l_contract_view then
				if attached l_contract_view.query_type_ranges.value (a_query) as l_range then
					if not (l_range.contains (position) and l_uri.same_uri (document_uri)) then
						create l_location.make (l_uri, message_manager.range_to_lsp (l_range))
						response.add_location (l_location)
					end
				end
			end
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

	contract_view_uri (a_class: ET_CLASS): detachable LS_DOCUMENT_URI
			-- URI of at contract view of `a_class`, if any
		require
			a_class_not_void: a_class /= Void
		do
			if attached message_manager.contract_view_uri (a_class) as l_uri then
				Result := l_uri
			end
		end

	contract_view (a_uri: LS_DOCUMENT_URI; a_class: ET_CLASS): detachable ET_BROWSABLE_CLASS
			-- Contract view of `a_class`, if any
		require
			a_uri_not_void: a_uri /= Void
			a_class_not_void: a_class /= Void
		do
			if attached message_manager.contract_view (a_uri, a_class, Void) as l_contract_view then
				Result := l_contract_view
			end
		end
		
invariant

	response_not_void: response /= Void
	document_uri_not_void: document_uri /= Void
	position_not_void: position /= Void
	message_manager_not_void: message_manager /= Void

end
