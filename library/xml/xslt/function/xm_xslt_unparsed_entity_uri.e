note

	description:

		"Objects that implement the XSLT unparsed-entity-uri() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_ENTITY_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, pre_evaluate, evaluate_item, check_static_type
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "unparsed-entity-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Unparsed_entity_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_single_string
			else
				create Result.make_single_node
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			a_function: XM_XSLT_UNPARSED_ENTITY_URI
		do
			Precursor (a_replacement)
			if a_replacement.item /= Current then
				a_function ?= a_replacement.item
				if a_function /= Void then
					a_function.add_context_document_argument (1, "unparsed-entity-uri+")
				end
			else
				add_context_document_argument (1, "unparsed-entity-uri+")
				merge_dependencies (arguments.item (2))
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			if a_replacement.item.is_error then
				if STRING_.same_string (a_replacement.item.error_value.namespace_uri, Xpath_errors_uri) and
					STRING_.same_string (a_replacement.item.error_value.code, "XPDY0002") then
					a_replacement.item.clear_error
					a_replacement.item.set_last_error_from_string (
						"May not call fn:unparsed-entity-uri() when there is no context node",
						Xpath_errors_uri, "XTDE1370", Static_error)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_entity, l_id: STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not a_result.item.is_error then
				l_entity := a_result.item.string_value
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				if a_result.item.is_error then
					if STRING_.same_string (a_result.item.error_value.namespace_uri, Xpath_errors_uri) then
						if STRING_.same_string (a_result.item.error_value.code, "XPDY0002") then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("May not call fn:unparsed-entity-uri() when there is no context node",
								Xpath_errors_uri, "XTDE1370", Static_error))
						elseif STRING_.same_string (a_result.item.error_value.code, "XPDY0050") then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("May not call fn:unparsed-entity-uri() when the context node is rooted at a document node",
								Xpath_errors_uri, "XTDE1370", Static_error))
						end
					end
				elseif a_result.item.is_document then
					l_id := a_result.item.as_document.unparsed_entity_system_id (l_entity)
					if l_id = Void then
						l_id := ""
					end
					a_result.put (create {XM_XPATH_ANY_URI_VALUE}.make (l_id))
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Context node is not set or it's root is not a document node.",
						Xpath_errors_uri, "XTDE1370", Dynamic_error))
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			-- Suppress compile-time evaluation
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end


end

