indexing

	description:

		"XSLT ID patterns (of the form id(literal))"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ID_PATTERN

inherit

	XM_XPATH_PATTERN
		redefine
			type_check, item_type
		end

creation

	make
	
feature {NONE} -- Initialization

	make (an_id: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			id_not_void: an_id /= Void
		do
			id_expression := an_id
		ensure
			id_set: id_expression = an_id
		end

feature -- Access

	node_test: XM_XPATH_NODE_TEST is
			-- Retrieve an `XM_XPATH_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make (Element_node)
		end

	item_type: INTEGER is
			-- Determine the types of nodes to which this pattern applies;
			-- Used for optimisation;
			-- For patterns that match nodes of several types, return Any_node
		do
			Result := Element_node
		end

feature -- Analysis

	type_check (context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_PATTERN is
			-- Type-check the pattern;
		local
			id_pattern: XM_XPATH_ID_PATTERN
		do
			id_pattern := clone (Current)
			id_pattern.set_expression (id_expression.analyze (context))
			Result := id_pattern
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		local
			doc: XM_XPATH_DOCUMENT
			id_value: XM_XPATH_STRING_VALUE
			id, ids: STRING
			splitter: ST_SPLITTER
			strings:  DS_LIST [STRING]
			element: XM_XPATH_ELEMENT
			finished: BOOLEAN
		do
			if a_node.item_type = Element_node then
				doc := a_node.document_root
				if doc = Void then
					Result := False
				else
					id_value ?= id_expression.evaluate_item (a_controller.new_xpath_context)
					if id_value = Void then
						Result := False						
					else
						ids := id_value.string_value
						create splitter.make
						strings := splitter.split (ids)
							check
								more_than_zero_ids: strings.count > 0
							end
						if strings.count = 1 then
							element := doc.select_id (ids)
							if element = Void then
								Result := False
							else
								Result := element.is_same_node (a_node)
							end
						else
							from
								finished := False
								strings.start
							variant
								strings.count + 1 - strings.index
							until
								finished or else strings.after
							loop
								id := strings.item_for_iteration
								element := doc.select_id (id)
								if element /= Void and then element.is_same_node (a_node) then
									Result := True
									finished := True
								end
								strings.forth
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_ID_PATTERN} -- Implementation

	set_expression (exp: XM_XPATH_EXPRESSION) is
			-- Set `id_expression'.
		require
			id_expression_not_void: exp /= Void
		do
			id_expression := exp
		ensure
			id_expression_set: id_expression = exp
		end

feature {NONE} -- Implementation

	id_expression: XM_XPATH_EXPRESSION
			-- The expression

invariant

	id_expression_not_void: id_expression /= Void

end
	
