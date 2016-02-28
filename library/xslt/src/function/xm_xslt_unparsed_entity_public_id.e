note

	description:

		"Objects that implement the XSLT unparsed-entity-public-id() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_ENTITY_PUBLIC_ID

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
			name := "unparsed-entity-public-id"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Unparsed_entity_public_id_function_type_code
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
			Result := type_factory.string_type
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

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		do
			Precursor (a_replacement)
			if a_replacement.item /= Current then
				if attached {XM_XSLT_UNPARSED_ENTITY_PUBLIC_ID} a_replacement.item as l_function then
					l_function.add_context_document_argument (1, "unparsed-entity-public-id+")
				end
			else
				add_context_document_argument (1, "unparsed-entity-public-id+")
				merge_dependencies (arguments.item (2))
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			check postcondition_of_precursor: attached a_replacement.item as l_replacement_item then
				if attached l_replacement_item.error_value as l_error_value then
					check is_error: l_replacement_item.is_error end
					if STRING_.same_string (l_error_value.namespace_uri, Xpath_errors_uri) and
						STRING_.same_string (l_error_value.code, "XPDY0002") then
						l_replacement_item.clear_error
						l_replacement_item.set_last_error_from_string (
							"May not call fn:unparsed-entity-public-id() when there is no context node",
							Xpath_errors_uri, "XTDE1380", Static_error)
					end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_entity: STRING
			l_id: detachable STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			check attached a_result.item as l_result_item_1 then
				if not l_result_item_1.is_error then
					l_entity := l_result_item_1.string_value
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					check attached a_result.item as l_result_item_2 then
						if attached l_result_item_2.error_value as l_error_value then
							check is_error: l_result_item_2.is_error end
							if STRING_.same_string (l_error_value.namespace_uri, Xpath_errors_uri) then
								if STRING_.same_string (l_error_value.code, "XPDY0002") then
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("May not call fn:unparsed-entity-public-id() when there is no context node",
										Xpath_errors_uri, "XTDE1380", Static_error))
								elseif STRING_.same_string (l_error_value.code, "XPDY0050") then
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("May not call fn:unparsed-entity-public-id() when the context node is rooted at a document node",
										Xpath_errors_uri, "XTDE1380", Static_error))
								end
							end
						elseif l_result_item_2.is_document then
							l_id := l_result_item_2.as_document.unparsed_entity_public_id (l_entity)
							if l_id = Void then
								l_id := ""
							end
							a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_id))
						else
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Context node is not set or it's root is not a document node.",
								Xpath_errors_uri, "XTDE1380", Dynamic_error))
						end
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
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

