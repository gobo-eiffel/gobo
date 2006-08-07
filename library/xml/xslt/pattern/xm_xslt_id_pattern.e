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
			type_check, node_kind, sub_expressions, computed_dependencies, promote
		end

create

	make
	
feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; an_id: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			id_not_void: an_id /= Void
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			id_expression := an_id
		ensure
			static_context_set: static_context = static_context
			id_set: id_expression = an_id
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

feature -- Access

	id_expression: XM_XPATH_EXPRESSION
			-- The expression

	original_text: STRING is
			-- Original text
		do
			Result := "id()"
		end

	node_kind: INTEGER is
			-- Type of nodes matched
		do
			Result := Element_node
		end
	
	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_NODE_KIND_TEST} Result.make (static_context, Element_node)
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (id_expression, 1)
		end

	computed_dependencies: ARRAY [BOOLEAN] is
			-- Dependencies which restrict optimizations
		do
			if not id_expression.are_dependencies_computed and id_expression.is_computed_expression then
				id_expression.as_computed_expression.compute_dependencies
			end
			Result := id_expression.dependencies
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type-check the pattern;
		do
			id_expression.check_static_type (a_context, a_context_item_type)
			if id_expression.was_expression_replaced then
				id_expression := id_expression.replacement_expression
			end
			if id_expression.is_error then
				set_error_value (id_expression.error_value)
			end			
		end

	promote (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote sub-expressions of `Current'.
		do
			id_expression.promote (a_offer)
			if id_expression.was_expression_replaced then
				id_expression := id_expression.replacement_expression
			end
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		local
			a_doc: XM_XPATH_DOCUMENT
			an_id, ids: STRING
			a_splitter: ST_SPLITTER
			strings:  DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			an_element: XM_XPATH_ELEMENT
		do
			if a_node.node_type = Element_node then
				a_doc := a_node.document_root
				if a_doc = Void then
					Result := False
				else
					id_expression.evaluate_item (a_context)
					if not id_expression.last_evaluated_item.is_string_value then
						Result := False						
					else
						ids := id_expression.last_evaluated_item.as_string_value.string_value
						create a_splitter.make
						strings := a_splitter.split (ids)
							check
								more_than_zero_ids: strings.count > 0
							end
						if strings.count = 1 then
							an_element := a_doc.selected_id (ids)
							if an_element = Void then
								Result := False
							else
								Result := an_element.is_same_node (a_node)
							end
						else
							from
								a_cursor := strings.new_cursor
								a_cursor.start
							variant
								strings.count + 1 - a_cursor.index
							until
								a_cursor.after
							loop
								an_id := a_cursor.item
								an_element := a_doc.selected_id (an_id)
								if an_element /= Void and then an_element.is_same_node (a_node) then
									Result := True
									a_cursor.go_after
								end
								a_cursor.forth
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	static_context: XM_XPATH_STATIC_CONTEXT
			-- Stored static context

invariant

	id_expression_not_void: id_expression /= Void
	static_context_not_void: static_context /= Void

end
	
