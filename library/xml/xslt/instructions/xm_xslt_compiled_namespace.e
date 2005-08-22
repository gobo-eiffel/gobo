indexing

	description:

		"Compiled xsl:namespace"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_NAMESPACE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			promote_instruction, display, item_type, compute_cardinality,
			compute_dependencies, sub_expressions, simplify
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: a_name /= Void
		do
			executable := an_executable
			name := a_name;  adopt_child_expression (name)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_set: name = a_name
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do

			-- The following is hardly conducive to good optimization,
			--  but since removing namespace nodes from our data model,
			--  we have little choice:

			Result := any_item
		end

	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then Result.put_last (select_expression) end
			Result.put_last (name)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "xsl:namespace"))
			std.error.put_new_line
			name.display (a_level + 1)
			Precursor (a_level + 1)
		end
	
feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
			Precursor
			merge_dependencies (name.dependencies)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		do
			-- Do nothing.
		end

	simplify is
			-- Perform context-independent static optimizations
		do
			name.simplify
			if name.was_expression_replaced then
				name := name.replacement_expression;  adopt_child_expression (name)
			end
			Precursor
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			-- Do nothing.
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_prefix, a_uri: STRING
			an_error: XM_XPATH_ERROR_VALUE
			a_namespace_code: INTEGER
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
		do
			a_transformer := a_context.transformer
			name.evaluate_as_string (a_context)
			if name.last_evaluated_string.is_error then
					name.last_evaluated_string.error_value.set_location (system_id, line_number)
				a_transformer.report_fatal_error (name.last_evaluated_string.error_value)
			else
				a_prefix := name.last_evaluated_string.string_value
				if not (a_prefix.count = 0 or else is_ncname (a_prefix)) then
					create an_error.make_from_string (STRING_.concat ("Namespace prefix is invalid: ", a_prefix), Xpath_errors_uri, "XTDE0920", Dynamic_error)
					an_error.set_location (system_id, line_number)
					a_transformer.report_fatal_error (an_error)
				elseif STRING_.same_string (a_prefix, Xmlns) then
					create an_error.make_from_string ("Namespace prefix of 'xmlns' is not allowed", Xpath_errors_uri, "XTDE0920", Dynamic_error)
					an_error.set_location (system_id, line_number)
					a_transformer.report_fatal_error (an_error)
				else
					expand_children (a_context)
					if not is_error then
						a_uri := last_string_value
						if STRING_.same_string (a_prefix, Xml_prefix) and then not STRING_.same_string (a_uri, Xml_prefix_namespace) then
							create an_error.make_from_string ("Namespace prefix of 'xml' may only be used with 'http://www.w3.org/XML/1998/namespace'", Xpath_errors_uri, "XTDE0925", Dynamic_error)
							an_error.set_location (system_id, line_number)
							a_transformer.report_fatal_error (an_error)
						elseif STRING_.same_string (a_uri, Xml_prefix_namespace) then
							create an_error.make_from_string ("Namespace prefix of 'xml' must be used with 'http://www.w3.org/XML/1998/namespace'", Xpath_errors_uri, "XTDE0925", Dynamic_error)
							an_error.set_location (system_id, line_number)
							a_transformer.report_fatal_error (an_error)
						elseif a_uri.count = 0 then
							create an_error.make_from_string ("Namespace prefix is the empty string", Xpath_errors_uri, "XTDE0930", Dynamic_error)
							an_error.set_location (system_id, line_number)
							a_transformer.report_fatal_error (an_error)
						else
							if shared_name_pool.is_namespace_code_allocated (a_prefix, a_uri) then
								a_namespace_code := shared_name_pool.namespace_code (a_prefix, a_uri)
							else
								shared_name_pool.allocate_namespace_code (a_prefix, a_uri)
								a_namespace_code := shared_name_pool.last_namespace_code
							end
							a_receiver := a_context.current_receiver
							a_receiver.notify_namespace (a_namespace_code, Reject_duplicates)
						end
					end
				end
			end
			last_tail_call := Void
		end

feature {NONE} -- Implementation

	name: XM_XPATH_EXPRESSION
			-- Name

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

invariant

	name_not_void: initialized implies name /= Void
	
end
	
