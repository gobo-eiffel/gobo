note

	description:

		"Builders for lists of definitions in flat contract views"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FLAT_CONTRACT_VIEW_DEFINITION_BUILDER

inherit

	GELSP_CONTRACT_VIEW_DEFINITION_BUILDER
		redefine
			process_qualified_call_name,
			process_unqualified_alias_name,
			process_unqualified_call_name,
			contract_view_uri,
			contract_view
		end

create

	make

feature {ET_BROWSABLE_NAME} -- Processing

	process_qualified_call_name (a_name: ET_BROWSABLE_QUALIFIED_CALL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.call_feature as l_feature and attached a_name.target_base_class as l_class then
				add_feature_location (l_feature, l_class)
			end
		end

	process_unqualified_alias_name (a_name: ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME)
			-- Process `a_name`.
		do
			if attached {ET_FEATURE} a_name.current_closure as l_feature then
				add_feature_location (l_feature, a_name.current_class)
			end
		end

	process_unqualified_call_name (a_name: ET_BROWSABLE_UNQUALIFIED_CALL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.call_feature as l_feature then
				add_feature_location (l_feature, a_name.current_class)
			end
		end

feature {NONE} -- Implementation

	contract_view_uri (a_class: ET_CLASS): detachable LS_DOCUMENT_URI
			-- URI of flat contract view of `a_class`, if any
		do
			if attached message_manager.flat_contract_view_uri (a_class) as l_uri then
				Result := l_uri
			end
		end

	contract_view (a_uri: LS_DOCUMENT_URI; a_class: ET_CLASS): detachable ET_BROWSABLE_CLASS
			-- Flat contract view of `a_class`, if any
		do
			if attached message_manager.flat_contract_view (a_uri, a_class, Void) as l_contract_view then
				Result := l_contract_view
			end
		end

end
