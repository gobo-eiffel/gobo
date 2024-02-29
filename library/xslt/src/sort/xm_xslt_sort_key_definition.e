note

	description:

		"Objects that define one component of a sort key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SORT_KEY_DEFINITION

		-- Note that most attributes defining the sort key can be attribute value templates,
		-- and can therefore vary from one invocation to another. We hold them as expressions. As
		-- soon as they are all known (which in general is only at run-time), the XM_XSLT_SORT_KEY_DEFINITION
		-- is replaced by a XM_XSLT_FIXED_SORT_KEY_DEFINITION in which all these values are fixed (this doesn't work,
		-- in the case of AVTs using local parameters, so now the reduction is performed repeatedly - TODO: optimize this).

	-- TODO - optimizations

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_sort_key: XM_XPATH_EXPRESSION; an_order, a_case_order, a_language, a_data_type, a_collation_name: detachable XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			sort_key_not_void: a_sort_key /= Void
		do
			sort_key := a_sort_key
			order_expression := an_order
			case_order_expression := a_case_order
			language_expression := a_language
			data_type_expression := a_data_type
			collation_name_expression := a_collation_name
		ensure
			sort_key_set:sort_key = a_sort_key
			order_expressiion_set: order_expression = an_order
			case_order_expression_set: case_order_expression = a_case_order
			language_expression_set: language_expression = a_language
			data_type_expression_set: data_type_expression = a_data_type
			collation_name_expression_set: collation_name_expression = a_collation_name
		end

feature -- Access

	sort_key: XM_XPATH_EXPRESSION
			-- Sort key

	order_expression: detachable XM_XPATH_EXPRESSION
			-- Order (ascending or descending)

	case_order_expression: detachable XM_XPATH_EXPRESSION
			-- Case order (upper-first or lower-first)

	language_expression: detachable XM_XPATH_EXPRESSION
			-- Language

	data_type_expression: detachable XM_XPATH_EXPRESSION
			-- Data type to which sort-key-values will be coerced (text, number or QName (but not NCName)

	collation_name_expression: detachable XM_XPATH_EXPRESSION
			-- Name of collation (a URI) as an AVT

	collation_name: detachable STRING
			-- Name of collation (a URI)

	order: detachable STRING
			-- Value of order attribute (ascending or descending)

	language: detachable STRING
			--  Value of language attribute

	case_order: detachable STRING
			-- Value of case-order attribute ("lower-first" or "upper-first")

	data_type: detachable STRING
			-- Value of data-type attribute ("text" or "number" or a QName)

	reduced_definition (a_context: XM_XSLT_EVALUATION_CONTEXT):  XM_XSLT_FIXED_SORT_KEY_DEFINITION
			-- Sort key definition without any dependencies on the context except for the sort key itself;
			-- For the AVTs used to select data type, case order, language, it means
			--  all dependencies: after reduction, these values will be constants.
		require
			context_not_void: a_context /= Void
			reducible: is_reducible
			known_collation: attached collation_name as l_collation_name implies a_context.is_known_collation (l_collation_name)
		local
			a_collator: detachable ST_COLLATOR
		do
			if attached collation_name as l_collation_name then
				a_collator := a_context.collator (l_collation_name)
			end
			check
				attached order as l_order
				attached data_type as l_data_type
				attached case_order as l_case_order
				attached language as l_language
			then
				create Result.make (sort_key, l_order, l_data_type, l_case_order, l_language, a_collator)
			end
		ensure
			reduced_definition_not_void: Result /= Void
		end

feature -- Status_report

	is_reducible: BOOLEAN
			-- May `reduced_definition' be called?
		do
			Result := order /= Void and
			case_order /= Void and
			language /= Void and
			data_type /= Void
		end

feature -- Element change

	set_sort_key (a_key: like sort_key)
			-- Set `sort_key' to `a_key'.
		require
			a_key_not_void: a_key /= Void
		do
			sort_key := a_key
		ensure
			sort_key_set: sort_key = a_key
		end

	evaluate_expressions (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate all AVTs
		require
			context_not_void: a_context /= Void
		do
			evaluate_order (a_context)
			evaluate_case_order (a_context)
			evaluate_language (a_context)
			evaluate_data_type (a_context)
			evaluate_collation_name (a_context)
		ensure
			order_not_void: order /= Void
			case_order_not_void: case_order /= Void
			language_not_void: language /= Void
			data_type_not_void: data_type /= Void
		end

feature -- Conversion

	is_fixed_sort_key: BOOLEAN
			-- Is `Current' a fixed_sort_key?
		do
			Result := False
		end

	as_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			-- `Current' seen as a fixed_sort_key
		require
			fixed_sort_key: is_fixed_sort_key
		do
			check fixed_sort_key: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature {NONE} -- Implementation

	evaluate_collation_name (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `collation_name_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if attached collation_name_expression as l_collation_name_expression then
				create l_item.make (Void)
				l_collation_name_expression.evaluate_item (l_item, a_context)
				check attached l_item.item as l_item_item then
					collation_name := l_item_item.string_value
				end
			end
		end

	evaluate_order (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `order_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if not attached order_expression as l_order_expression then
				order := "ascending"
			else
				create l_item.make (Void)
				l_order_expression.evaluate_item (l_item, a_context)
				check attached l_item.item as l_item_item then
					order := l_item_item.string_value
				end
			end
		ensure
			order_not_void: order /= Void
		end

	evaluate_case_order (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `case_order_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if not attached case_order_expression as l_case_order_expression then
				case_order := "#default"
			else
				create l_item.make (Void)
				l_case_order_expression.evaluate_item (l_item, a_context)
				check attached l_item.item as l_item_item then
					case_order := l_item_item.string_value
				end
			end
		ensure
			case_order_not_void: case_order /= Void
		end

	evaluate_language (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `language_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if not attached language_expression as l_language_expression then
				language := ""
			else
				create l_item.make (Void)
				l_language_expression.evaluate_item (l_item, a_context)
				check attached l_item.item as l_item_item then
					language := l_item_item.string_value
				end
			end
		ensure
			language_not_void: language /= Void
		end

	evaluate_data_type (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `data_type_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if not attached data_type_expression as l_data_type_expression then
				data_type := ""
			else
				create l_item.make (Void)
				l_data_type_expression.evaluate_item (l_item, a_context)
				if not attached l_item.item as l_item_item then
					data_type := ""
				else
					data_type := l_item_item.string_value
				end
			end
		ensure
			data_type_not_void: data_type /= Void
		end

invariant

	sort_key_not_void: sort_key /= Void

end

