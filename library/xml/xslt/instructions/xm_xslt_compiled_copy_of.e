indexing

	description: "Objects that represent an xsl:copy-of,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_COPY_OF

inherit

	XM_XSLT_COPY_ROUTINES

	XM_XSLT_INSTRUCTION

	XM_XSLT_VALIDATION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; copy_ns: BOOLEAN) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			copy_namespaces := copy_ns
			instruction_name := "copy-of"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			copy_namespaces_set: copy_namespaces = copy_ns
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver: XM_XSLT_SEQUENCE_RECEIVER
			which_namespaces: INTEGER
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
		do
			last_tail_call := Void
			a_transformer := a_context.transformer
			a_receiver := a_transformer.current_receiver
			if copy_namespaces then
				which_namespaces := All_namespaces
			else
				which_namespaces := No_namespaces
			end
			from
				a_sequence_iterator := select_expression.iterator (a_context); a_sequence_iterator.start
			until
				a_sequence_iterator.after
			loop
				an_item := a_sequence_iterator.item
				a_node ?= an_item
				if a_node /= Void then
					process_node (a_node, a_receiver, which_namespaces, a_transformer)
				else
					a_receiver.append_item (an_item)
				end
				a_sequence_iterator.forth
			end
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	copy_namespaces: BOOLEAN
			-- Do we copy namespaces?

	process_node (a_node: XM_XPATH_NODE; a_receiver: XM_XSLT_SEQUENCE_RECEIVER; which_namespaces: INTEGER; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Process a node.
		require
			node_not_void: a_node /= Void
			receiver_not_void: a_receiver /= Void
			transformer_not_void: a_transformer /= Void
		local
			a_validator: XM_XPATH_RECEIVER
		do
			inspect
				a_node.node_type
			when Element_node then
				a_validator := a_transformer.configuration.element_validator (a_receiver, a_node.name_code, Void, Validation_strip, Void)
				a_node.copy_node (a_validator, which_namespaces, True)
			when Attribute_node then
				copy_attribute (a_node, a_transformer, Void, Validation_strip)
			when Text_node then
				a_receiver.notify_characters (a_node.string_value, 0)
			when Processing_instruction_node then
				a_receiver.notify_processing_instruction (a_node.node_name, a_node.string_value, 0)
			when Comment_node then
				a_receiver.notify_comment (a_node.string_value, 0)
			when Namespace_node then
				a_node.copy_node (a_receiver, No_namespaces, False)
			when Document_node then

				-- TODO: if we are building a sequence rather than a tree, we
            --  need to add a document node to the constructed sequence

				a_validator := a_transformer.configuration.document_validator (a_receiver, a_node.base_uri, Validation_strip)
				a_node.copy_node (a_validator, which_namespaces, True)
			end
		end

invariant

	select_expression_not_void: select_expression /= Void

end
	
