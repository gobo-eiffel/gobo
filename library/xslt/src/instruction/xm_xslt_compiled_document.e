note

	description:

		"Objects that represent the document node of a temporary tree"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_COMPILED_DOCUMENT

inherit

	XM_XSLT_INSTRUCTION
		redefine
			promote_instruction, evaluate_item, item_type, sub_expressions,
			creates_new_nodes, compute_cardinality
		end

	XM_XSLT_VALIDATION

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_NODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; text_only: BOOLEAN;  a_constant_text: detachable STRING; a_base_uri: STRING; a_content: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			base_uri: a_base_uri /= Void
			content_not_void: not text_only implies a_content /= Void and then a_constant_text = Void
		do
			executable := an_executable
			is_text_only := text_only
			constant_text := a_constant_text
			base_uri := a_base_uri
			content := a_content
			adopt_child_expression (content)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			is_text_only: is_text_only = text_only
			constant_text_set: constant_text = a_constant_text
			base_uri_set: base_uri = a_base_uri
			content_set: content = a_content
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := document_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
		end

feature -- Status report

	is_text_only: BOOLEAN
			-- Is content only constant text?

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:document")
			std.error.put_string (a_string)
			std.error.put_new_line
			content.display (a_level + 1)
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			create l_replacement.make (Void)
			content.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if content /= l_replacement_item then
					content := l_replacement_item
					adopt_child_expression (content)
					reset_static_properties
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			create l_replacement.make (Void)
			content.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if content /= l_replacement_item then
					content := l_replacement_item
					adopt_child_expression (content)
					reset_static_properties
				end
			end
			check_contents_for_attributes (a_context)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			create l_replacement.make (Void)
			content.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if content /= l_replacement_item then
					content := l_replacement_item
					adopt_child_expression (content)
					reset_static_properties
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			content.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if content /= l_replacement_item then
					content := l_replacement_item
					adopt_child_expression (content)
					reset_static_properties
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_text_value, l_error: STRING
			l_builder: XM_XPATH_TINY_BUILDER
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_receiver: XM_XPATH_RECEIVER
			l_splitter: ST_SPLITTER
			l_words: DS_LIST [STRING]
		do
			if is_text_only then
				if attached constant_text as l_constant_text then
					l_text_value := l_constant_text
				else
					l_text_value := ""
					from
						content.create_iterator (a_context)
						check postconditin_of_create_iterator: attached content.last_iterator as l_last_iterator then
							l_iterator := l_last_iterator
							if attached l_iterator.error_value as l_error_value then
								check is_error: l_iterator.is_error end
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
							else
								l_iterator.start
							end
						end
					until
						l_iterator.is_error or else l_iterator.after
					loop
						l_text_value := STRING_.appended_string (l_text_value, l_iterator.item.string_value)
						l_iterator.forth
					end
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
					end
				end
				if a_result.item = Void then
					a_result.put (create {XM_XPATH_TEXT_FRAGMENT_VALUE}.make (l_text_value, base_uri))
				end
			else
				check attached {XM_XSLT_EVALUATION_CONTEXT} a_context.new_minor_context as l_new_context then
					create l_builder.make (base_uri, Void)
					create l_result.make_receiver (l_builder)
					l_new_context.change_output_destination (Void, l_result, False, Validation_strip, Void)
					check attached l_new_context.current_receiver as l_new_context_current_receiver then
						l_receiver := l_new_context_current_receiver
						check
							receiver_opened: l_receiver.is_open
							-- `change_output_destination' guarentees this
						end
						l_receiver.start_document
						content.generate_events (l_new_context)
						l_receiver.end_document
						l_receiver.close
						if attached l_builder.last_error as l_builder_last_error then
							check has_error: l_builder.has_error end
							create l_splitter.make_with_separators (": %T%N%R")
							l_words := l_splitter.split (l_builder_last_error)
							l_error := l_words.item (1)
							l_words.remove (1)
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (l_splitter.join_unescaped (l_words), Xpath_errors_uri, l_error, Dynamic_error))
							check attached a_result.item as l_result_item and then attached l_result_item.error_value as l_error_value then
								set_last_error (l_error_value)
							end
						else
							a_result.put (l_builder.current_root)
						end
					end
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_item.make (Void)
			evaluate_item (l_item, a_context)
			if attached l_item.item as l_item_item then
				if attached l_item_item.error_value as l_error_value then
					check is_error: l_item_item.is_error end
					check attached a_context.transformer as l_transformer then
						l_transformer.report_recoverable_error (l_error_value)
					end
				else
					check attached a_context.current_receiver as l_current_receiver then
						l_current_receiver.append_item (l_item_item)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	content: XM_XPATH_EXPRESSION
			-- Content (unless `is_text_only')

	constant_text: detachable STRING
			-- Constant text content

	base_uri: STRING
			-- Base URI

	check_contents_for_attributes (a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check no attributes or namespaces are created after child nodes of document element.
		require
			a_context_not_void: a_context /= Void
		local
			l_children: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_component: XM_XPATH_EXPRESSION
			l_finished: BOOLEAN
			l_mask: INTEGER
			l_error: XM_XPATH_ERROR_VALUE
		do
			if content.is_sequence_expression then
				l_children := content.as_sequence_expression.children.new_cursor
				from
					l_children.start
				until
					l_children.after or l_finished
				loop
					l_component := l_children.item
					if l_component.item_type.is_node_test then
						l_mask := l_component.item_type.as_node_test.node_kind_mask
						if l_mask = INTEGER_.bit_shift_left (1, Attribute_node) then
							l_finished := True
							create l_error.make_from_string ("May not create an attribute node as a child of the document node", Xpath_errors_uri, "XTDE0420", Dynamic_error)
							set_last_error (l_error)
						elseif l_mask = INTEGER_.bit_shift_left (1, Namespace_node) then
							l_finished := True
							create l_error.make_from_string ("May not create a namespace node as a child of the document node", Xpath_errors_uri, "XTDE0420", Dynamic_error)
							set_last_error (l_error)
						end
					end
					if not l_finished then
						l_children.forth
					end
				end
			end
		end

invariant

	base_uri: initialized implies base_uri /= Void
	content_not_void: initialized implies content /= Void

end

