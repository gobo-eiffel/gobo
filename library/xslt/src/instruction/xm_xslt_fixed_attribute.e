﻿note

	description:

		"Attributes whose name is known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FIXED_ATTRIBUTE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			item_type, evaluate_name_code, compute_cardinality, display
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XSLT_VALIDATION

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER; a_validation_action: INTEGER; a_simple_type: detachable XM_XPATH_SIMPLE_TYPE; a_type_annotation: INTEGER)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip >= a_validation_action
		do
			executable := an_executable
			name_code := a_name_code
			validation_action := a_validation_action
			type := a_simple_type
			type_annotation := a_type_annotation
			options := 0
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_code_set: name_code = a_name_code
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			type_annotation_set: type_annotation = a_type_annotation
			no_options_set: options = 0
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := attribute_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status_report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:attribute")
			std.error.put_string (a_string); std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "fixed name ")
			std.error.put_string (a_string)
			std.error.put_string (shared_name_pool.display_name_from_name_code (name_code)); std.error.put_new_line
		end

feature -- Status_setting

	set_no_special_characters
			-- Certify free of special characters.
		do
			if not are_no_special_characters (options) then
				options := options + No_special_characters
			end
		ensure
			no_special_characters: are_no_special_characters (options)
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking
		do
			-- do nothing
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XPATH_RECEIVER
			some_receiver_options, an_annotation: INTEGER
		do
			check attached a_context.current_receiver as l_context_current_receiver then
				a_receiver := l_context_current_receiver
				some_receiver_options := options
				an_annotation := type_annotation

				-- We may need to change the namespace prefix if the one we chose is
				--  already in use with a different namespace URI.
				-- This is done behind the scenes by the Outputter

				expand_children (a_context)
				if attached error_value as l_error_value then
					check is_error: is_error end
					l_error_value.set_location (system_id, line_number)
					check attached a_context.transformer as l_transformer then
						l_transformer.report_recoverable_error (l_error_value)
					end
				else
					if type /= Void then
						todo ("process_leaving_tail - validation by type", True)
					elseif validation_action = Validation_strict or else validation_action = Validation_lax then
						todo ("process_leaving_tail - validation", True)
					end
					check postcondition_of_expand_children: attached last_string_value as l_last_string_value then
						a_receiver.notify_attribute (name_code, an_annotation, l_last_string_value, some_receiver_options)
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

	name_code: INTEGER
			-- Name code

	validation_action: INTEGER
			-- Validation action

	type_annotation: INTEGER
			-- Type annotation

	type: detachable XM_XPATH_SCHEMA_TYPE
			--Type

	options: INTEGER
			-- Receiver options

	evaluate_name_code (a_context: XM_XPATH_CONTEXT)
			-- Evaluate name code.
		do
			last_name_code := name_code
		end

invariant

	validation: initialized implies validation_action >= Validation_strict  and then Validation_strip >= validation_action

end

