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
			simplify, analyze, xpath_expressions, promote_instruction
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
			validation: a_validation_action >= Validation_strict  and then Validation_strip >= a_validation_action
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
		local
			a_name_value: XM_XPATH_ITEM
			a_qname_value: XM_XPATH_QNAME_VALUE
			a_string_value: XM_XPATH_STRING_VALUE
			a_uri, an_xml_prefix, a_local_name: STRING
			a_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_error: XM_XPATH_ERROR_VALUE 
		do
			element_name.evaluate_item (a_context)
			a_name_value := element_name.last_evaluated_item
			if a_name_value = Void or else a_name_value.is_error then -- empty sequence
				create an_error.make_from_string ("xsl:element has no 'name'", "","XT0820", Dynamic_error) 
				a_context.transformer.report_recoverable_error (an_error, Current)
				Result := -1
			else
				a_string_value ?= a_name_value
				if a_string_value /= Void then
					create a_splitter.make
					a_splitter.set_separators (":")
					qname_parts := a_splitter.split (a_string_value.string_value)
					if qname_parts.count = 0 or else qname_parts.count > 2 then
						create an_error.make_from_string ("'name' attribute of xsl:element does not evaluate to a lexical QName.", "","XT0820", Dynamic_error) 
						a_context.transformer.report_recoverable_error (an_error, Current)
						Result := -1
					elseif qname_parts.count = 1 then
						a_local_name := qname_parts.item (1)
						an_xml_prefix := ""
					else
						a_local_name := qname_parts.item (2)
						an_xml_prefix := qname_parts.item (1)
					end
				else
					a_qname_value ?= a_name_value
					if a_qname_value /= Void then
						create an_error.make_from_string ("xsl:element 'name' has a QName value - I don't think this is supposed to happen XSLT, so it's a BUG.", "","XT0820", Dynamic_error) 
						a_context.transformer.report_recoverable_error (an_error, Current)
						Result := -1
					else
						create an_error.make_from_string ("'name' has an unexpected value. This is a BUG.", "","XT0820", Dynamic_error) 
						a_context.transformer.report_recoverable_error (an_error, Current)
						Result := -1
					end
				end
			end
			if Result /= -1 then
				if namespace = Void then
					a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, True)
					if a_uri = Void then
						create an_error.make_from_string (STRING_.concat ("'name' attribute of xsl:element has an undeclared prefix: ", an_xml_prefix), "","XT0830", Dynamic_error) 
						a_context.transformer.report_recoverable_error (an_error, Current)
						Result := -1
						check False end
					end
				else
					namespace.evaluate_as_string (a_context)
					if namespace.last_evaluated_string.is_error then
						a_context.transformer.report_warning ("'namespace' attribute of xsl:element failed evaluation - using null namespace", Current)
						a_uri := ""
					else
						a_uri := namespace.last_evaluated_string.string_value
					end
					if a_uri.count = 0 then
						an_xml_prefix := ""
					end
					if STRING_.same_string (an_xml_prefix, "xmlns") then
						-- not legal, so:
						an_xml_prefix := "x-xmlns"
					end
				end
				if Result /= -1 then
					if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
						Result := shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
					else
						shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
						Result := shared_name_pool.last_name_code
					end
				end
			end
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

	simplify is
			-- Perform context-independent static optimizations
		do
			todo ("simplify", False)
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
			if namespace /= Void then
				create Result.make (2)
			else
				create Result.make (1)
			end
			Result.put_last (element_name)
			if namespace /= Void then
				Result.put_last (namespace)
			end
			Result.set_equality_tester (expression_tester)
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
	
