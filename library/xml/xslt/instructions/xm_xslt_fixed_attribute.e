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
		redefine
			item_type
		end

	XM_XPATH_RECEIVER_OPTIONS
		
	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XSLT_VALIDATION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER; a_validation_action: INTEGER; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_type_annotation: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
		do
			executable := an_executable
			instruction_name := "attribute"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
			name_code := a_name_code
			validation_action := a_validation_action
			type := a_simple_type
			type_annotation := a_type_annotation
			options := 0
			set_cardinality_exactly_one
		ensure
			executable_set: executable = an_executable
			name_code_set: name_code = a_name_code
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			type_annotation_set: type_annotation = a_type_annotation
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

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			do_nothing
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
			a_transformer := a_context.transformer
			a_receiver := a_transformer.current_receiver
			some_receiver_options := options
			an_annotation := type_annotation

			-- We may need to change the namespace prefix if the one we chose is
			--  already in use with a different namespace URI. 
			-- This is done behind the scenes by the Outputter

			a_value := expanded_string_value (a_context)
			if type /= Void then
				todo ("process_leaving_tail", True)
			elseif validation_action = Validation_strict or else validation_action = Validation_lax then
				todo ("process_leaving_tail", True)
			end
			a_receiver.notify_attribute (name_code, an_annotation, a_value, some_receiver_options)
			last_tail_call := Void
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

	options: INTEGER
			-- Receiver options

invariant

	validation: validation_action >= Validation_strict  and then Validation_strip <= validation_action

end
	
