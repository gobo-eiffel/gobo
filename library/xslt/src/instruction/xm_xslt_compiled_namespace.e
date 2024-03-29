﻿note

	description:

		"Compiled xsl:namespace"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_COMPILED_NAMESPACE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			promote_instruction, display, item_type, compute_cardinality,
			compute_dependencies, sub_expressions, simplify, evaluate_name_code
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: XM_XPATH_EXPRESSION)
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := namespace_node_kind_test
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			if attached select_expression as l_select_expression then
				Result.put_last (l_select_expression)
			end
			Result.put_last (name)
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "xsl:namespace"))
			std.error.put_new_line
			name.display (a_level + 1)
			Precursor (a_level + 1)
		end

feature -- Status setting

	compute_dependencies
			-- Compute dependencies on context.
		do
			Precursor
			merge_dependencies (name)
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking
		do
			-- Do nothing.
		end

	simplify  (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			name.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_name (l_replacement_item)
				if name.is_error then
					set_replacement (a_replacement, name)
				else
					Precursor (a_replacement)
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			name.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_name (l_replacement_item)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_uri: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_namespace_code: INTEGER
			l_receiver: XM_XPATH_SEQUENCE_RECEIVER
		do
			evaluate_prefix (a_context)
			check attached a_context.transformer as l_context_transformer then
				if not l_context_transformer.is_error then
					expand_children (a_context)
					if not is_error then
						check
							postcondition_of_expand_children: attached last_string_value as l_last_string_value
							postcondition_of_evaluate_prefix: attached last_evaluated_prefix as l_last_evaluated_prefix
						then
							l_uri := l_last_string_value
							if STRING_.same_string (l_last_evaluated_prefix, Xml_prefix) and then not STRING_.same_string (l_uri, Xml_prefix_namespace) then
								create l_error.make_from_string ("Namespace prefix of 'xml' may only be used with 'http://www.w3.org/XML/1998/namespace'", Xpath_errors_uri, "XTDE0925", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_context_transformer.report_fatal_error (l_error)
							elseif STRING_.same_string (l_uri, Xml_prefix_namespace) and not STRING_.same_string (l_last_evaluated_prefix, Xml_prefix) then
								create l_error.make_from_string ("Namespace prefix of 'xml' must be used with 'http://www.w3.org/XML/1998/namespace'", Xpath_errors_uri, "XTDE0925", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_context_transformer.report_fatal_error (l_error)
							elseif l_uri.count = 0 then
								create l_error.make_from_string ("Namespace URI is the empty string", Xpath_errors_uri, "XTDE0930", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_context_transformer.report_fatal_error (l_error)
							elseif l_uri.occurrences ('#') > 1 then
								create l_error.make_from_string ("Namespace URI is not a valid xs:anyURI", Xpath_errors_uri, "XTDE0905", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_context_transformer.report_fatal_error (l_error)
							else
								if shared_name_pool.is_namespace_code_allocated (l_last_evaluated_prefix, l_uri) then
									l_namespace_code := shared_name_pool.namespace_code (l_last_evaluated_prefix, l_uri)
								else
									shared_name_pool.allocate_namespace_code (l_last_evaluated_prefix, l_uri)
									l_namespace_code := shared_name_pool.last_namespace_code
								end
								check attached a_context.current_receiver as l_context_current_receiver then
									l_receiver := l_context_current_receiver
									l_receiver.notify_namespace (l_namespace_code, Reject_duplicates)
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	name: XM_XPATH_EXPRESSION
			-- Name

	last_evaluated_prefix: detachable STRING
			-- Result from successful call to `evaluate_prefix

	set_name (a_name: XM_XPATH_EXPRESSION)
			-- Ensure `name' = `a_name'.
		do
			if name /= a_name then
				name := a_name
				if name /= Void then
					adopt_child_expression (name)
					reset_static_properties
				end
			end
		ensure
			set: name = a_name
		end

	evaluate_prefix (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate namespace prefix.
		require
			initialized: initialized
			a_context_not_void: a_context /= Void
		local
			l_error: XM_XPATH_ERROR_VALUE
			l_last_evaluated_prefix: like last_evaluated_prefix
		do
			name.evaluate_as_string (a_context)
			check
				postcondition_of_evaluate_as_string: attached name.last_evaluated_string as l_name_last_evaluated_string
				attached a_context.transformer as l_context_transformer
			then
				if attached l_name_last_evaluated_string.error_value as l_error_value then
					check is_error: l_name_last_evaluated_string.is_error end
					l_error_value.set_location (system_id, line_number)
					l_context_transformer.report_fatal_error (l_error_value)
				else
					l_last_evaluated_prefix := l_name_last_evaluated_string.string_value
					last_evaluated_prefix := l_last_evaluated_prefix
					if not (l_last_evaluated_prefix.is_empty or else is_ncname (l_last_evaluated_prefix)) then
						create l_error.make_from_string (STRING_.concat ("Namespace prefix is invalid: ", l_last_evaluated_prefix), Xpath_errors_uri, "XTDE0920", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_context_transformer.report_fatal_error (l_error)
					elseif STRING_.same_string (l_last_evaluated_prefix, Xmlns) then
						create l_error.make_from_string ("Namespace prefix of 'xmlns' is not allowed", Xpath_errors_uri, "XTDE0920", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_context_transformer.report_fatal_error (l_error)
					end
				end
			end
		ensure
			last_evaluated_prefix_not_void: last_evaluated_prefix /= Void
		end

	evaluate_name_code (a_context: XM_XPATH_CONTEXT)
			-- Evaluate name code.
		do
			check
				xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
				attached l_context.transformer as l_context_transformer
			then
				evaluate_prefix (l_context)
				if attached l_context_transformer.last_error as l_last_error then
					check is_error: l_context_transformer.is_error end
					last_name_code := -1
					set_last_error (l_last_error)
				else
					check postcondition_of_evaluate_prefix: attached last_evaluated_prefix as l_last_evaluated_prefix then
						if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, l_last_evaluated_prefix) then
							last_name_code := shared_name_pool.name_code (Null_uri, Null_uri, l_last_evaluated_prefix)
						else
							shared_name_pool.allocate_name (Null_uri, Null_uri, l_last_evaluated_prefix)
							last_name_code := shared_name_pool.last_name_code
						end
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

invariant

	name_not_void: initialized implies name /= Void

end

