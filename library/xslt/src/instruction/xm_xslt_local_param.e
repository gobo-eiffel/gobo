note

	description:

		"Objects that represent the compiled form of a local xsl:param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_LOCAL_PARAM

inherit

	XM_XSLT_LOCAL_VARIABLE
		redefine
			generate_tail_call, sub_expressions, display
		end

create

	make

feature -- Access

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			if attached select_expression as l_select_expression then
				Result.put_last (l_select_expression)
			end
			if attached conversion as l_conversion then
				Result.put_last (l_conversion)
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "local parameter: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if attached select_expression as l_select_expression then
				l_select_expression.display (a_level + 1)
			end
		end

feature -- Element change

	set_conversion (a_conversion: like conversion)
			-- Set type conversion.
		do
			conversion := a_conversion
			if a_conversion /= Void then
				adopt_child_expression (a_conversion)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_was_supplied: BOOLEAN
			l_invalid_item : XM_XPATH_INVALID_ITEM
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do
			l_was_supplied := a_context.is_local_parameter_supplied (variable_fingerprint, is_tunnel_parameter)
			if l_was_supplied then
				a_context.ensure_local_parameter_set (variable_fingerprint, is_tunnel_parameter, slot_number)
				if attached conversion as l_conversion then

					-- We do an eager evaluation here for safety, because the result of the
               --  type conversion overwrites the slot where the actual supplied parameter
               --   is contained.

					create l_result.make (Void)
					l_conversion.evaluate (l_result, l_conversion.eager_evaluation_mode, Many_references, a_context)
					check postcondition_of_evaluate: attached l_result.item as l_result_item then
						a_context.set_local_variable (l_result_item, slot_number)
					end
				end
			else
				if is_implicitly_required_parameter then
					create l_invalid_item.make_from_string (STRING_.concat ("No value supplied for implicitly required parameter: ", variable_name),
																		  Xpath_errors_uri, "XTDE0610", Dynamic_error)
					check attached a_context.current_receiver as l_current_receiver then
						l_current_receiver.append_item (l_invalid_item)
					end
				elseif is_required_parameter then
					create l_invalid_item.make_from_string (STRING_.concat ("No value supplied for required parameter: ", variable_name),
																		  Xpath_errors_uri, "XTDE0700", Dynamic_error)
					check attached a_context.current_receiver as l_current_receiver then
						l_current_receiver.append_item (l_invalid_item)
					end
				else
					a_context.set_local_variable (select_value (a_context), slot_number)
				end
			end
		end

feature {NONE} -- Implementation

	conversion: detachable XM_XPATH_EXPRESSION
			-- Type conversion to be applied

end

