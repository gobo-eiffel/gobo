indexing

	description:

		"Attributes whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ATTRIBUTE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			simplify, xpath_expressions, promote_instruction, display, item_type
		end

	XM_XPATH_RECEIVER_OPTIONS
		
	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XSLT_VALIDATION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; an_attribute_name, a_namespace: XM_XPATH_EXPRESSION; a_namespace_context: XM_XSLT_NAMESPACE_CONTEXT;
			a_validation_action: INTEGER; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_type_annotation: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: an_attribute_name /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
		do
			executable := an_executable
			attribute_name := an_attribute_name
			namespace := a_namespace
			instruction_name := "attribute"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
			validation_action := a_validation_action
			type := a_simple_type
			type_annotation := a_type_annotation
			namespace_context := a_namespace_context
			options := 0
			set_cardinality_exactly_one
			merge_dependencies (attribute_name.dependencies)
			if namespace /= Void then
				merge_dependencies (namespace.dependencies)
			end
		ensure
			executable_set: executable = an_executable
			name_set: attribute_name = an_attribute_name
			namespace_set: namespace = a_namespace
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			type_annotation_set: type_annotation = a_type_annotation
			namespace_context_set: namespace_context = a_namespace_context
			no_options_set: options = 0
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := attribute_node_kind_test
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			todo ("display", False)
		end

feature -- Status_setting

	set_no_special_characters is
			-- Certify free of special characters.
		do
			if not are_no_special_characters (options) then
				options := options + No_special_characters
			end
		ensure
			no_special_characters: are_no_special_characters (options)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			todo ("simplify", False)
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			todo ("type-check", False)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			todo ("promote_instruction", False)
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver: XM_XPATH_RECEIVER
			some_receiver_options, an_annotation: INTEGER
			a_value: STRING
		do
			todo ("process_leaving_tale", False)
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		do
			todo ("xpath_expressions", False)
		end
		
feature {NONE} -- Implementation

	attribute_name: XM_XPATH_EXPRESSION
			-- Name

	namespace: XM_XPATH_EXPRESSION
			-- Namespace

	validation_action: INTEGER
			-- Validation action

	type_annotation: INTEGER
			-- Type annotation

	type: XM_XPATH_SCHEMA_TYPE
			--Type

	options: INTEGER
			-- Receiver options

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

invariant

	validation: validation_action >= Validation_strict  and then Validation_strip <= validation_action
	name_not_void: attribute_name /= Void

end
	
