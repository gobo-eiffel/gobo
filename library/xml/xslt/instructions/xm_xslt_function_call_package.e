indexing
	description:

		"Objects that represent tail-recusive calls to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_CALL_PACKAGE

creation

	make

feature {NONE} -- Initialization

	make (a_function: XM_XSLT_CALLABLE_FUNCTION; some_actual_arguments: DS_ARRAYED_LIST [XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Establish invariant.
		require
			function_not_void: a_function /= Void
			arguments_not_void: some_actual_arguments /= Void
			context_not_void: a_context /= Void
		do
			function := a_function
			actual_arguments := some_actual_arguments
			context := a_context
		ensure
			function_set: function = a_function
			arguments_set: actual_arguments = some_actual_arguments
			context_set: context = a_context
		end

feature -- Status report

	last_called_value: XM_XPATH_VALUE
			-- Result of last non-tail call

feature -- Evaluation

	call is
			-- Call `Current'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT
		do
			a_transformer := context.transformer
			a_saved_context := a_transformer.saved_context
			a_transformer.reset_global_context
			a_transformer.set_current_iterator (Void)
			function.call (actual_arguments, a_transformer, False)
			last_called_value := function.last_called_value
			a_transformer.restore_context (a_saved_context)
		ensure
			called_value_not_void: last_called_value /= Void -- but may be an error value
		end

feature {NONE} -- Implementation

	function: XM_XSLT_CALLABLE_FUNCTION
			-- Function to call

	actual_arguments: DS_ARRAYED_LIST [XM_XPATH_VALUE]
			-- Arguments to function call

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Evaluation context

invariant

	function_not_void: function /= Void
	arguments_not_void: actual_arguments /= Void
	context_not_void: context /= Void

end
	
