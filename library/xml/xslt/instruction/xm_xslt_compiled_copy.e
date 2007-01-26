indexing
	description:

		"Objects that implement xsl:copy"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
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
			a_copy_namespaces: BOOLEAN; an_inherit_namespaces: BOOLEAN; a_schema_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			content_not_void: a_content /= Void
		do
			executable := an_executable
			content := a_content
			adopt_child_expression (content)
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_schema_type
			is_copy_namespaces := a_copy_namespaces
			is_inherit_namespaces := an_inherit_namespaces
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
	
	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code
		do
			check
				context_item_is_node: a_context.context_item.is_node
			end
			Result := a_context.context_item.as_node.name_code
		end

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING is
			-- Re-calculated base URI
		local
			l_item: XM_XPATH_ITEM
		do
			l_item := a_context.context_item
			if l_item /= Void and then l_item.is_node then
				Result := l_item.as_node.base_uri
			end
			if Result = Void then
				Result := ""
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string ("xsl:copy%N")
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			a_new_context: XM_XPATH_CONTEXT
			an_outputter: XM_XSLT_SEQUENCE_OUTPUTTER
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_new_context := a_context.new_minor_context
			another_context ?= a_new_context
			check
				evaluation_context: another_context /= Void
				-- this is XSLT
			end
			create an_outputter.make_with_size (1, another_context.transformer)
			a_new_context.change_to_sequence_output_destination (an_outputter)
			generate_events (a_new_context)
			an_outputter.close
			last_evaluated_item := an_outputter.first_item
		end

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			a_document: XM_XPATH_DOCUMENT
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_transformer := a_context.transformer
			a_new_context := a_context.new_minor_context
			a_receiver := a_new_context.current_receiver
			an_item := a_new_context.context_item
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
					a_receiver.notify_processing_instruction (a_node.node_name, STRING_.cloned_string (a_node.string_value), 0)
				when Comment_node then
					a_receiver.notify_comment (STRING_.cloned_string (a_node.string_value), 0)
				when Document_node then
					a_document ?= a_node
					copy_document (a_document, a_new_context, a_transformer, a_receiver)
				when Namespace_node then
					a_node.copy_node (a_receiver, No_namespaces, False)
				end
			end
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		local
			an_element: XM_XPATH_ELEMENT
		do
			if is_copy_namespaces then
				check
					context_item_is_element: a_context.context_item.is_element
				end
				an_element := a_context.context_item.as_element
				an_element.output_namespace_nodes (a_receiver, True)
			end
		end

feature {NONE} -- Implementation
	
	is_copy_namespaces: BOOLEAN
			-- Are namespaces to be copied to the output?

	copy_document (a_document: XM_XPATH_DOCUMENT; a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER; a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Copy an entire document.
		require
			document_node: a_document /= Void
			transformer_not_void: a_transformer /= Void
			receiver_not_void: a_receiver /= Void
		local
			l_validator: XM_XPATH_RECEIVER
			l_complex_content: XM_XSLT_COMPLEX_CONTENT_OUTPUTTER
			l_nested: BOOLEAN
		do
			l_validator := a_transformer.configuration.document_validator (a_receiver,
																								 a_document.base_uri,
																								 validation_action)
			if l_validator /= a_receiver then
				todo ("copy_document (validation)", True)
			end

			l_nested := a_receiver.is_document_started
			if l_nested then
				l_complex_content ?= a_receiver
				check
					nested_document: l_complex_content /= Void
					-- Logic of cluster
				end
				l_complex_content.start_nested_document
			else
				a_receiver.start_document
			end
			content.generate_events (a_context)
			if l_nested then
				l_complex_content.end_nested_document
			else
				a_receiver.end_document
			end
		end

end
	
