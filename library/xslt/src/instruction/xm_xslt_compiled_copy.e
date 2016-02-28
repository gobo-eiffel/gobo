note
	description:

		"Objects that implement xsl:copy"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_COPY

inherit

	XM_XSLT_COPY_ROUTINES

	XM_XSLT_ELEMENT_CONSTRUCTOR
		redefine
			evaluate_item, generate_tail_call
		end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_content: XM_XPATH_EXPRESSION; some_attribute_sets: DS_ARRAYED_LIST [INTEGER];
			a_copy_namespaces: BOOLEAN; an_inherit_namespaces: BOOLEAN; a_schema_type: detachable XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			content_not_void: a_content /= Void
		do
			executable := an_executable
			content := a_content
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_schema_type
			is_copy_namespaces := a_copy_namespaces
			is_inherit_namespaces := an_inherit_namespaces
			adopt_child_expression (content)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			content_set: content = a_content
			attribute_sets_set: attribute_sets = some_attribute_sets
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_schema_type
			is_copy_namespaces_set: is_copy_namespaces = a_copy_namespaces
			is_inherit_namespaces_set: is_inherit_namespaces = an_inherit_namespaces
		end

feature -- Access

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER
			-- Name code
		do
			check
				attached a_context.context_item as l_context_context_item
				context_item_is_node: l_context_context_item.is_node
			then
				Result := l_context_context_item.as_node.name_code
			end
		end

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING
			-- Re-calculated base URI
		local
			l_item: detachable XM_XPATH_ITEM
		do
			l_item := a_context.context_item
			if l_item /= Void and then l_item.is_node and then attached l_item.as_node.base_uri as l_base_uri then
				Result := l_base_uri
			else
				Result := ""
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string ("xsl:copy%N")
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_new_context: XM_XPATH_CONTEXT
			l_outputter: XM_XSLT_SEQUENCE_OUTPUTTER
		do
			l_new_context := a_context.new_minor_context
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} l_new_context as l_other_context
				-- this is XSLT
				attached l_other_context.transformer as l_transformer
			then
				create l_outputter.make_with_size (1, l_transformer)
				l_new_context.change_to_sequence_output_destination (l_outputter)
				generate_events (l_new_context)
				l_outputter.close
				a_result.put (l_outputter.first_item)
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check attached a_context.transformer as l_context_transformer then
				a_transformer := l_context_transformer
				a_new_context := a_context.new_minor_context
				check
					attached a_new_context.current_receiver as l_new_context_current_receiver
					attached a_new_context.context_item as l_new_context_context_item
				then
					a_receiver := l_new_context_current_receiver
					an_item := l_new_context_context_item
					if not an_item.is_node then
						a_receiver.append_item (an_item)
					else
						a_node := an_item.as_node
						inspect
							a_node.node_type
						when Element_node then
							Precursor (a_tail, a_new_context)
						when Attribute_node then
							copy_attribute (a_node, a_new_context, Void, Validation_strip)
						when Text_node then
							a_receiver.notify_characters (STRING_.cloned_string (a_node.string_value), 0)
						when Processing_instruction_node then
							check attached a_node.node_name as l_node_name then
								a_receiver.notify_processing_instruction (l_node_name, STRING_.cloned_string (a_node.string_value), 0)
							end
						when Comment_node then
							a_receiver.notify_comment (STRING_.cloned_string (a_node.string_value), 0)
						when Document_node then
							check attached {XM_XPATH_DOCUMENT} a_node as a_document then
								copy_document (a_document, a_new_context, a_transformer, a_receiver)
							end
						when Namespace_node then
							a_node.copy_node (a_receiver, No_namespaces, False)
						end
					end
				end
			end
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER)
			-- Output namespace nodes for the new element.
		local
			an_element: XM_XPATH_ELEMENT
		do
			if is_copy_namespaces then
				check
					attached a_context.context_item as l_context_context_item
					context_item_is_element: l_context_context_item.is_element
				then
					an_element := l_context_context_item.as_element
					an_element.output_namespace_nodes (a_receiver, True)
				end
			end
		end

feature {NONE} -- Implementation

	is_copy_namespaces: BOOLEAN
			-- Are namespaces to be copied to the output?

	copy_document (a_document: XM_XPATH_DOCUMENT; a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER; a_receiver: XM_XPATH_SEQUENCE_RECEIVER)
			-- Copy an entire document.
		require
			document_node: a_document /= Void
			transformer_not_void: a_transformer /= Void
			receiver_not_void: a_receiver /= Void
		local
			l_validator: XM_XPATH_RECEIVER
			l_nested: BOOLEAN
		do
			check attached a_document.base_uri as l_document_base_uri then
				l_validator := a_transformer.configuration.document_validator (a_receiver,
																								 l_document_base_uri,
																								 validation_action)
			end
			if l_validator /= a_receiver then
				todo ("copy_document (validation)", True)
			end

			l_nested := a_receiver.is_document_started
			if l_nested then
				check
					nested_document: attached {XM_XSLT_COMPLEX_CONTENT_OUTPUTTER} a_receiver as l_complex_content
					-- Logic of cluster
				then
					l_complex_content.start_nested_document
					content.generate_events (a_context)
					l_complex_content.end_nested_document
				end
			else
				a_receiver.start_document
				content.generate_events (a_context)
				a_receiver.end_document
			end
		end

end

