note

	description:

		"Objects that represent the compiled form of a local xsl:param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LOCAL_PARAM

inherit

	XM_XSLT_LOCAL_VARIABLE
		redefine
			generate_tail_call, sub_expressions, display
		end

create

	make

feature -- Access
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then Result.put_last (select_expression) end
			if conversion /= Void then Result.put_last (conversion) end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "local parameter: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if select_expression /= Void then select_expression.display (a_level + 1) end
		end

feature -- Element change

	set_conversion (a_conversion: like conversion) is
			-- Set type conversion.
		do
			conversion := a_conversion
			if conversion /= Void then
				adopt_child_expression (conversion)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_was_supplied: BOOLEAN
			l_invalid_item : XM_XPATH_INVALID_ITEM
			l_result: DS_CELL [XM_XPATH_VALUE]
		do
			l_was_supplied := a_context.is_local_parameter_supplied (variable_fingerprint, is_tunnel_parameter)
			if l_was_supplied then
				a_context.ensure_local_parameter_set (variable_fingerprint, is_tunnel_parameter, slot_number)
				if conversion /= Void then

					-- We do an eager evaluation here for safety, because the result of the
               --  type conversion overwrites the slot where the actual supplied parameter
               --   is contained.

					create l_result.make (Void)
					conversion.evaluate (l_result, conversion.eager_evaluation_mode, Many_references, a_context)
					a_context.set_local_variable (l_result.item, slot_number)
				end
			else
				if is_implicitly_required_parameter then
					create l_invalid_item.make_from_string (STRING_.concat ("No value supplied for implicitly required parameter: ", variable_name),
																		  Xpath_errors_uri, "XTDE0610", Dynamic_error)
					a_context.current_receiver.append_item (l_invalid_item)
				elseif is_required_parameter then
					create l_invalid_item.make_from_string (STRING_.concat ("No value supplied for required parameter: ", variable_name),
																		  Xpath_errors_uri, "XTDE0700", Dynamic_error)
					a_context.current_receiver.append_item (l_invalid_item)
				else
					a_context.set_local_variable (select_value (a_context), slot_number)
				end
			end
		end

feature {NONE} -- Implementation

	conversion: XM_XPATH_EXPRESSION
			-- Type conversion to be applied

end
	
