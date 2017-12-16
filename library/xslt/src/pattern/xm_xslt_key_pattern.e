note

	description:

		"XSLT key patterns (of the form key(key-name, key-value))"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_PATTERN

inherit

	XM_XSLT_PATTERN
		redefine
			type_check, sub_expressions, compute_dependencies, promote
		end

	XM_XPATH_NAME_UTILITIES

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_name_code: INTEGER; a_key: XM_XPATH_EXPRESSION)
			-- Establish invariant
		require
			key_not_void: a_key /= Void
			static_context_not_void: a_static_context /= Void
		do
			key_fingerprint := fingerprint_from_name_code (a_name_code)
			key_expression := a_key
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			key_set: key_expression = a_key
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

feature -- Access

	key_fingerprint: INTEGER
			-- Name-pool fingerprint

	key_expression: XM_XPATH_EXPRESSION
			-- The expression

	original_text: STRING
			-- Original text
		do
			Result :=  ("key()")
		end

	node_test: XM_XSLT_NODE_TEST
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_ANY_NODE_TEST} Result.make
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (key_expression, 1)
		end

	compute_dependencies
			-- Compute dependencies which restrict optimizations
		do
			if not key_expression.are_dependencies_computed and key_expression.is_computed_expression then
				key_expression.as_computed_expression.compute_dependencies
			end
			set_dependencies (key_expression)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Type-check the pattern;
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			key_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				key_expression := l_replacement_item
				if attached key_expression.error_value as l_error_value then
					check is_error: key_expression.is_error end
					set_error_value (l_error_value)
				end
			end
		end

	promote (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote sub-expressions of `Current'.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			key_expression.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				key_expression := l_replacement_item
			end
		end

feature -- Matching

	match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Attempt to match `Current' againast `a_node'.
		local
			l_doc: detachable XM_XPATH_DOCUMENT
			l_key_value: XM_XPATH_STRING_VALUE
			l_key: STRING
			l_km: XM_XSLT_KEY_MANAGER
			l_finished: BOOLEAN
			l_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_nodes: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			internal_last_match_result := False
			l_doc := a_node.document_root
			if l_doc /= Void then
				check attached a_context.transformer as l_context_transformer then
					l_km := l_context_transformer.key_manager
					key_expression.create_iterator (a_context)
					check postcondition_of_create_iterator: attached key_expression.last_iterator as l_last_iterator then
						l_iter := l_last_iterator
						if attached l_iter.error_value as l_error_value then
							check is_error: l_iter.is_error end
							set_error_value (l_error_value)
						else
							from
								l_iter.start
							until
								l_finished or else l_iter.is_error or else l_iter.after
							loop
								l_key := l_iter.item.string_value
								create l_key_value.make (l_key)
								l_km.generate_keyed_sequence (key_fingerprint, l_doc, l_key_value, a_context)
								if attached l_context_transformer.last_error as l_last_error then
									check is_error: l_context_transformer.is_error end
									set_error_value (l_last_error)
								else
									l_nodes := l_km.last_key_sequence
									check l_nodes /= Void then
										from
											l_nodes.start
										until
											l_finished or else l_nodes.is_error or else l_nodes.after
										loop
											if l_nodes.item.is_same_node (a_node) then
												internal_last_match_result := True
												l_finished := True
											end
											l_nodes.forth
										end
									end
								end
								l_iter.forth
							end
							if not is_error then
								if l_nodes /= Void and then attached l_nodes.error_value as l_error_value then
									check is_error: l_nodes.is_error end
									set_error_value (l_error_value)
								elseif attached l_iter.error_value as l_error_value then
									check is_error: l_iter.is_error end
									set_error_value (l_error_value)
								end
							end
						end
					end
				end
			end
		end

invariant

	key_expression_not_void: key_expression /= Void

end

