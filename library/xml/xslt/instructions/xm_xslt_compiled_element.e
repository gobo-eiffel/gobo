indexing
	description:

		"Elements whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ELEMENT

inherit

	XM_XSLT_ELEMENT_CONSTRUCTOR
		redefine
			simplified_expression, analyze, xpath_expressions, promote_instruction
		end

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; an_element_name, a_namespace: XM_XPATH_EXPRESSION; a_namespace_context: XM_XSLT_NAMESPACE_CONTEXT;
			some_attribute_sets: DS_ARRAYED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET]; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			element_name_not_void: an_element_name /= Void
			namespace_or_namespace_context: a_namespace = Void implies a_namespace_context /= Void
		do
			executable := an_executable
			create children.make (0)
			make_expression_instruction
			element_name := an_element_name
			namespace := a_namespace
			namespace_context := a_namespace_context
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_simple_type
		ensure
			executable_set: executable = an_executable
			element_name_set: element_name = an_element_name
			attribute_sets_set: attribute_sets = some_attribute_sets
			namespace_set: namespace = a_namespace
			namespace_context_set: namespace_context = a_namespace_context
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
		end

feature -- Access
	
	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			Result := "element"
		end

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code
		do
			todo ("name_code", False)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string, another_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			std.error.put_string (a_string)
			element_name.display (a_level + 1)
			std.error.put_new_line			
			if children.count = 0 then
				a_string := STRING_.appended_string (indentation (a_level + 1), "empty content")
				std.error.put_string (a_string)
				std.error.put_new_line
			else
				display_children (a_level + 1)
			end
		end


feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		do
			todo ("simplified_expression", False)
		end

		analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		do
			todo ("analyze", False)
		end

		promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			todo ("promote_instruction", False)
		end

feature {XM_XSLT_ELEMENT_CREATOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			-- do_nothing
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		do
			todo ("xpath_expressions", False)
		end

feature {NONE} -- Implementation
	
	element_name: XM_XPATH_EXPRESSION
			-- Name
	
	namespace: XM_XPATH_EXPRESSION
			-- Namespace

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

invariant

	element_name_not_void: element_name /= Void
	namespace_or_namespace_context: namespace = Void implies namespace_context /= Void

end
	
