indexing

	description:

		"Attributes whose name is known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_ATTRIBUTE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR

		
	XM_XPATH_SHARED_NODE_KIND_TESTS

creation

	make

feature {NONE} -- Initialization

	make (a_name_code: INTEGER; a_validation_action: INTEGER; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_type_annotation: INTEGER) is
			-- Establish invariant.
		require
			no_requirements: True
		do
			instruction_name := "attribute"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
			name_code := a_name_code
			validation_action := a_validation_action
			type := a_simple_type
			type_annotation := a_type_annotation
		ensure
			name_code_set: name_code = a_name_code
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			type_annotation_set: type_annotation = a_type_annotation
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

feature -- Status_setting

	set_no_special_characters is
			-- Cretify free of special characters.
		do
			no_special_characters := True
		ensure
			no_special_characters: no_special_characters
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			do_nothing
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {NONE} -- Implementation

	name_code: INTEGER
			-- Name code

	validation_action: INTEGER
			-- Validation action

	type_annotation: INTEGER
			-- Type annotation

	type: XM_XPATH_SCHEMA_TYPE
			--Type

	no_special_characters: BOOLEAN
			-- Is `Current' certified free of special characters?

end
	
