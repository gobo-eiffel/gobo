indexing

	description:

		"XSLT ID patterns (of the form id(literal))"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ID_PATTERN

inherit

	XM_XSLT_PATTERN
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

	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_NODE_KIND_TEST} Result.make (Element_node)
		end

	item_type: INTEGER is
			-- Determine the types of nodes to which this pattern applies;
			-- Used for optimisation;
			-- For patterns that match nodes of several types, return Any_node
		do
			Result := Element_node
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT): XM_XSLT_PATTERN is
			-- Type-check the pattern;
		local
			an_id_pattern: XM_XSLT_ID_PATTERN
		do
			an_id_pattern := clone (Current)
			an_id_pattern.set_expression (id_expression.analyze (a_context))
			Result := an_id_pattern
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		local
			a_doc: XM_XPATH_DOCUMENT
			an_id_value: XM_XPATH_STRING_VALUE
			an_id, ids: STRING
			a_splitter: ST_SPLITTER
			strings:  DS_LIST [STRING]
			an_element: XM_XPATH_ELEMENT
			finished: BOOLEAN
		do
			if a_node.item_type = Element_node then
				a_doc := a_node.document_root
				if a_doc = Void then
					Result := False
				else
					an_id_value ?= id_expression.evaluated_item (a_controller.new_xpath_context)
					if an_id_value = Void then
						Result := False						
					else
						ids := an_id_value.string_value
						create a_splitter.make
						strings := a_splitter.split (ids)
							check
								more_than_zero_ids: strings.count > 0
							end
						if strings.count = 1 then
							an_element := a_doc.select_id (ids)
							if an_element = Void then
								Result := False
							else
								Result := an_element.is_same_node (a_node)
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
								an_id := strings.item_for_iteration
								an_element := a_doc.select_id (an_id)
								if an_element /= Void and then an_element.is_same_node (a_node) then
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

feature {XM_XSLT_ID_PATTERN} -- Local

	set_expression (an_expr: XM_XPATH_EXPRESSION) is
			-- Set `id_expression'.
		require
			id_expression_not_void: an_expr /= Void
		do
			id_expression := an_expr
		ensure
			id_expression_set: id_expression = an_expr
		end

feature {NONE} -- Implementation

	id_expression: XM_XPATH_EXPRESSION
			-- The expression

invariant

	id_expression_not_void: id_expression /= Void

end
	
