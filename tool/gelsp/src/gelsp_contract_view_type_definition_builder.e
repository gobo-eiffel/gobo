note

	description:

		"Builders for lists of type definitions in contract views"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_CONTRACT_VIEW_TYPE_DEFINITION_BUILDER

inherit

	GELSP_TYPE_DEFINITION_BUILDER
		redefine
			add_class_location,
			add_declaration_location
		end

create

	make

feature {NONE} -- Implementation

	add_class_location (a_class: ET_CLASS)
			-- Add location corresponding to the class name of `a_class` to `response`. 
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
		
end
