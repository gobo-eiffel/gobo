indexing

	description:

		"Tiny tree Element nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ELEMENT

inherit

	XM_XPATH_ELEMENT
		undefine
			has_child_nodes, is_nilled, first_child
		redefine
			has_attributes
		end

	XM_XPATH_TINY_COMPOSITE_NODE
		undefine
			type_annotation, has_attributes, local_part
		end

creation

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_DOCUMENT; a_node_number: INTEGER) is
		require
			valid_document: a_document /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= a_document.last_node_added
		do
			document := a_document
			node_number := a_node_number
			node_type := Element_node
		ensure
			document_set: document = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access
	
	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		do
			Result := attribute_value (document.name_pool.fingerprint (a_uri, a_local_name))
		end

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		local
			an_alpha_value, a_name_code: INTEGER
			finished: BOOLEAN
		do
			an_alpha_value := document.alpha_value (node_number)
			if an_alpha_value < 0 then
				Result := Void
			else
				from
					finished := False
				variant
					document.number_of_attributes	+ 1 - an_alpha_value
				until
					finished or else an_alpha_value > document.number_of_attributes
						or else document.attribute_parent (an_alpha_value) = node_number
				loop
					a_name_code := document.attribute_name_code (an_alpha_value)
					if a_name_code // bits_20 = a_fingerprint then
						Result := document.attribute_value (an_alpha_value)
						finished := True
					end
					an_alpha_value := an_alpha_value + 1
				end
			end
		end

feature -- Status report

	has_attributes: BOOLEAN is
			-- Does `Current' have any attributes?
		do
			Result := document.alpha_value (node_number) > 0
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER) is
			-- Set `name_code'.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		do
			document.set_name_code_for_node (a_name_code, node_number)
		ensure then
			name_code_set: document.name_code_for_node (node_number) = a_name_code
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end
end
