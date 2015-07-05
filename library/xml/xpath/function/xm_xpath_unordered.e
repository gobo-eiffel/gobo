note

	description:

		"Objects that implement the XPath unordered() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNORDERED

inherit

	XM_XPATH_COMPILE_TIME_FUNCTION
		redefine
			check_static_type, optimize, pre_evaluate, is_unordered_function, as_unordered_function
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "unordered"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Unordered_function_type_code
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
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	is_unordered_function: BOOLEAN
			-- Is `Current' XPath unordered() function?
		do
			Result := True
		end

	as_unordered_function: XM_XPATH_UNORDERED
			-- `Current' seen as XPath unordered() function
		do
			Result := Current
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			check postcondition_of_precursor: attached a_replacement.item as a_replacement_item_1 then
				if a_replacement_item_1 = Current then
					create l_replacement.make (Void)
					arguments.item (1).set_unsorted (l_replacement, True)
					check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item_2 then
						if arguments.item (1) /= l_replacement_item_2 then
							arguments.replace (l_replacement_item_2, 1)
						end
					end
				elseif a_replacement_item_1.is_unordered_function then
					a_replacement_item_1.as_unordered_function.arguments.item (1).set_unsorted (a_replacement, True)
				end
				if a_replacement.item /= Void then
					a_replacement.put (Void)
					set_replacement (a_replacement, arguments.item (1))
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			check postcondition_of_precursor: attached a_replacement.item as a_replacement_item_1 then
				if not is_error and a_replacement_item_1 = Current then
					create l_replacement.make (Void)
					arguments.item (1).set_unsorted (l_replacement, True)
					check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item_2 then
						if arguments.item (1) /= l_replacement_item_2 then
							arguments.replace (l_replacement_item_2, 1)
						end
					end
				elseif a_replacement_item_1.is_unordered_function then
					a_replacement_item_1.as_unordered_function.arguments.item (1).set_unsorted (a_replacement, True)
				end
				if a_replacement.item /= Void then
					set_replacement (a_replacement, arguments.item (1))
				else
					a_replacement.put (Current)
				end
			end
		end

feature -- Evaluation

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (a_replacement, arguments.item (1))
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_any_sequence
		end

feature -- Optimization

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end

