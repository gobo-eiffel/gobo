note

	description:

		"Builders for lists of type definitions in flat contract views"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FLAT_CONTRACT_VIEW_TYPE_DEFINITION_BUILDER

inherit

	GELSP_CONTRACT_VIEW_TYPE_DEFINITION_BUILDER
		redefine
			contract_view_uri,
			contract_view
		end

create

	make

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
