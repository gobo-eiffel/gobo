indexing

	description:

		"Xsl:functions compiled as templates"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_INSTRUCTION

inherit

	XM_XSLT_CALLABLE_FUNCTION

		-- TODO - tracing info

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_body: XM_XSLT_SEQUENCE_INSTRUCTION; a_function_name: STRING; a_base_uri: STRING; a_line_number: INTEGER) is
			-- Establish invariant
		require
			body_not_void: a_body /= Void
			function_name_not_void: a_function_name /= Void
				base_uri_not_void: a_base_uri /= Void
		do
			body := a_body
			function_name := a_function_name
			base_uri := a_base_uri
		ensure
			body_set: body = a_body
			function_name_set: function_name = a_function_name
			base_uri_set: base_uri = a_base_uri
		end

feature -- Evaluation

	call (some_actual_arguments: DS_LIST [XM_XPATH_VALUE]; a_transformer: XM_XSLT_TRANSFORMER; evaluate_tail_calls: BOOLEAN) is
			-- Evaluate function call.
		local
			a_saved_receiver: XM_XSLT_SEQUENCE_RECEIVER
			a_sequence_outputter: XM_XSLT_SEQUENCE_OUTPUTTER
			a_bindery: XM_XSLT_BINDERY
			an_object_value: XM_XPATH_OBJECT_VALUE
			a_function_package: XM_XSLT_FUNCTION_CALL_PACKAGE
		do
			last_called_value := Void
			if is_memo_function then
				last_called_value := cached_value (a_transformer, some_actual_arguments)
			end
			if last_called_value = Void then
				if a_transformer.is_tracing then
					todo ("call (tracing)", True)
				end
				a_saved_receiver := a_transformer.current_receiver
				create a_sequence_outputter.make
				a_sequence_outputter.set_system_id (base_uri)
				a_transformer.change_to_sequence_output_destination (a_sequence_outputter)
				a_bindery := a_transformer.bindery
				a_bindery.open_stack_frame_with_positional_parameters (some_actual_arguments)
				body.process (a_transformer.new_xpath_context)
				a_bindery.close_stack_frame
				a_transformer.reset_output_destination (a_saved_receiver)
				last_called_value := a_sequence_outputter.sequence
				if evaluate_tail_calls then
					an_object_value ?= last_called_value
					if an_object_value /= Void then
						from
							a_function_package ?= an_object_value.value
						until
							a_function_package = Void
						loop
							a_function_package.call
							last_called_value := a_function_package.last_called_value
							an_object_value ?= last_called_value
							if an_object_value /= Void then
								a_function_package ?= an_object_value.value
							end
						end
					end
				end
				if a_transformer.is_tracing then
					todo ("call (tracing)", True)
				end
				if is_memo_function then
					put_cached_value (a_transformer, some_actual_arguments, last_called_value)
				end
			end
		end

feature {NONE} -- Implementation

	body: XM_XSLT_SEQUENCE_INSTRUCTION
			-- Function body

	base_uri: STRING
			-- Base URI

invariant

	body_not_void: body /= Void
	function_name_not_void: function_name /= Void
	base_uri_not_void: base_uri /= Void

end
	
