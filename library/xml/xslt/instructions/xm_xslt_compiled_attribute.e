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
			sub_expressions, simplify, compute_cardinality, promote_instruction, display,
			item_type, evaluate_name_code
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end
		
	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XSLT_VALIDATION

create

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
			set_attribute_name (an_attribute_name)
			set_namespace (a_namespace)
			validation_action := a_validation_action
			type := a_simple_type
			type_annotation := a_type_annotation
			namespace_context := a_namespace_context
			options := 0
			compute_static_properties
			initialized := True
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
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := attribute_node_kind_test
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			an_index: INTEGER
		do
			create Result.make (3)
			an_index := 1
			if select_expression /= Void then
				Result.put (select_expression, an_index)
				an_index := an_index + 1
			end
			Result.put (attribute_name, an_index)
			an_index := an_index + 1
			if namespace /= Void then
				Result.put (namespace, an_index)
			end
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Status_setting

	set_attribute_name (a_name: like attribute_name) is
			-- Set attribute name.
		require
			attribute_name_not_void: a_name /= Void
		do
			attribute_name := a_name
			adopt_child_expression (attribute_name)
		ensure
			set: attribute_name = a_name
		end

	set_namespace (a_namespace: like namespace) is
			-- Set attribute name.
		do
			namespace := a_namespace
			if namespace /= Void then
				adopt_child_expression (namespace)
			end
		ensure
			set: namespace = a_namespace
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			attribute_name.simplify
			if attribute_name.was_expression_replaced then set_attribute_name (attribute_name.replacement_expression) end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
			if namespace /= Void then
				namespace.simplify
				if namespace.was_expression_replaced then set_namespace (namespace.replacement_expression) end
				if namespace.is_error then set_last_error (namespace.error_value) end
			end
			Precursor
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_string_type: XM_XPATH_SEQUENCE_TYPE
		do
			attribute_name.check_static_type (a_context, a_context_item_type)
			if attribute_name.was_expression_replaced then set_attribute_name (attribute_name.replacement_expression) end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
			create a_role.make (Instruction_role, "xsl:attribute/name", 1, Xpath_errors_uri, "XPTY0004")
			create a_type_checker
			create a_single_string_type.make_single_string
			a_type_checker.static_type_check (a_context, attribute_name, a_single_string_type, False, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error (a_type_checker.static_type_check_error)
			else
				set_attribute_name (a_type_checker.checked_expression)
			end
			if namespace /= Void then
				namespace.check_static_type (a_context, a_context_item_type)
				if namespace.was_expression_replaced then set_namespace (namespace.replacement_expression) end
				if namespace.is_error then set_last_error (namespace.error_value) end
				create a_role.make (Instruction_role, "xsl:attribute/namespace", 1, Xpath_errors_uri, "XPTY0004")
				create a_type_checker
				a_type_checker.static_type_check (a_context, namespace, a_single_string_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_namespace (a_type_checker.checked_expression)
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			attribute_name.promote (an_offer)
			if attribute_name.was_expression_replaced then set_attribute_name (attribute_name.replacement_expression) end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
			if not is_error and then namespace /= Void then
				namespace.promote (an_offer)
				if namespace.was_expression_replaced then
					namespace := namespace.replacement_expression
					adopt_child_expression (namespace)
				end
				if namespace.is_error then set_last_error (namespace.error_value) end
			end
			if not is_error then Precursor (an_offer) end
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			last_tail_call := Void
			todo ("process_leaving_tale", False)
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
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

	evaluate_name_code (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name code.
		do
			todo ("evaluate_name_code", False)
		end

invariant

	validation: initialized implies validation_action >= Validation_strict  and then Validation_strip <= validation_action
	name_not_void: initialized implies attribute_name /= Void

end
	
