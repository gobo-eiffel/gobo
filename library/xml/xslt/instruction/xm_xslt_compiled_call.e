indexing

	description: "Objects that represent an xsl:call-template,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_CALL

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, generate_events, creates_new_nodes, promote_instruction,
			compute_intrinsic_dependencies
		end

	XM_XSLT_WITH_PARAM_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_target: XM_XSLT_COMPILED_TEMPLATE; an_actual_parameter_list, a_tunnel_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM];
			a_use_tail_recursion: BOOLEAN) is
			-- Establish invariant.
		require
			an_executable_not_void: an_executable /= Void
			target_not_void: a_target /= Void
			actual_parameter_list_not_void: an_actual_parameter_list /= Void
			tunnel_parameter_list_not_void: a_tunnel_parameter_list /= Void
		do
			executable := an_executable
			target := a_target
			actual_parameter_list := an_actual_parameter_list
			tunnel_parameter_list := a_tunnel_parameter_list
			use_tail_recursion := a_use_tail_recursion
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			target_set: target = a_target
			actual_parameter_list_set: actual_parameter_list = an_actual_parameter_list
			tunnel_parameter_list_set: tunnel_parameter_list = a_tunnel_parameter_list
			tail_recursion_set: use_tail_recursion = a_use_tail_recursion
		end

feature -- Access
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			Result := xpath_expressions (actual_parameter_list)
			Result.append_last (xpath_expressions (tunnel_parameter_list))
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:call-template")
			std.error.put_string (a_string); std.error.put_new_line
			if target.template_fingerprint > 0 then
				std.error.put_string (indentation (a_level + 1))
				std.error.put_string ("Name=")
				std.error.put_string (shared_name_pool.display_name_from_name_code (target.template_fingerprint)); std.error.put_new_line
			end
		end

feature -- Status setting
	
	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do

			-- We could go to the called template and find which parts of the context it depends on, but this
			--  would create the risk of infinite recursion. So we just assume that the dependencies exist.

			set_intrinsically_depends_upon_xslt_context
			set_intrinsically_depends_upon_focus
		end
			

feature -- Optimization

	simplify is
			-- Preform context-independent static optimizations
		do
			simplify_with_params (actual_parameter_list)
			simplify_with_params (tunnel_parameter_list)
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			check_with_params (actual_parameter_list, a_context, a_context_item_type)
			check_with_params (tunnel_parameter_list, a_context, a_context_item_type)
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			optimize_with_params (actual_parameter_list, a_context, a_context_item_type)
			optimize_with_params (tunnel_parameter_list, a_context, a_context_item_type)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			promote_with_params (actual_parameter_list, an_offer)
			promote_with_params (tunnel_parameter_list, an_offer)
		end

feature -- Evaluation

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
			l_context, l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_transformer: XM_XSLT_TRANSFORMER
		do
			l_context ?= a_context
			check
				l_context_not_void: l_context /= Void
				-- this is xslt
			end
			l_new_context := l_context.new_context
			l_new_context.open_stack_frame (target.slot_manager)
			l_new_context.set_local_parameters (assembled_parameters (l_context, actual_parameter_list))
			l_new_context.set_tunnel_parameters (assembled_tunnel_parameters (l_context, tunnel_parameter_list))
			l_transformer := l_new_context.transformer
			create l_tail.make (Void)
			target.expand (l_tail, l_new_context)
			from
				l_tail_call := l_tail.item
			until
				l_transformer.is_error or else l_tail_call = Void
			loop
				l_tail.put (Void)
				l_tail_call.generate_tail_call (l_tail, l_new_context)
				l_tail_call := l_tail.item
			end
		end

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_tunnel_parameters: XM_XSLT_PARAMETER_SET
			l_parameters: XM_XSLT_PARAMETER_SET
			a_local_variable_frame: XM_XPATH_STACK_FRAME
			l_variables: ARRAY [XM_XPATH_VALUE]
			l_index: INTEGER
			l_tail_call: XM_XPATH_TAIL_CALL
		do
			if not use_tail_recursion then
				generate_events (a_context)
			else

				-- Handle any parameters.

				l_parameters := assembled_parameters (a_context, actual_parameter_list)
				l_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameter_list)

				-- The local variables are no longer needed, so we clear them:

				a_local_variable_frame := a_context.local_variable_frame
				l_variables := a_local_variable_frame.variables
				from
					l_index := 1
				until
					l_index > l_variables.count
				loop
					l_variables.put (Void, l_index)
					l_index := l_index + 1
				end

				-- Call the named template. Actually, don't call it; rather construct a call package
				--  and return it to the caller, who will then process this package.

				create {XM_XSLT_CALL_TEMPLATE_PACKAGE} l_tail_call.make (target,
																								l_parameters,
																								l_tunnel_parameters,
																								a_context)
				a_tail.put (l_tail_call)
			end
		end

feature {NONE} -- Implementation
	
	target: XM_XSLT_COMPILED_TEMPLATE
			-- Target template

	actual_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Actual (non-tunnel) parameters

	tunnel_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Tunnel parameters
	
	use_tail_recursion: BOOLEAN
			-- Is tail recursion used?

invariant

	target_not_void: initialized implies target /= Void
	actual_parameter_list_not_void: initialized implies actual_parameter_list /= Void
	tunnel_parameter_list_not_void: initialized implies tunnel_parameter_list /= Void
	
end
	
