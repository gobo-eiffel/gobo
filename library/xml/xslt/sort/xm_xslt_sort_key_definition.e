note

	description:

		"Objects that define one component of a sort key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_sort_key, an_order, a_case_order, a_language, a_data_type, a_collation_name: XM_XPATH_EXPRESSION) is
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

	order_expression: XM_XPATH_EXPRESSION
			-- Order (ascending or descending)

	case_order_expression: XM_XPATH_EXPRESSION
			-- Case order (upper-first or lower-first)

	language_expression: XM_XPATH_EXPRESSION
			-- Language

	data_type_expression: XM_XPATH_EXPRESSION
			-- Data type to which sort-key-values will be coerced (text, number or QName (but not NCName)

	collation_name_expression: XM_XPATH_EXPRESSION
			-- Name of collation (a URI) as an AVT

	collation_name: STRING
			-- Name of collation (a URI)

	order: STRING
			-- Value of order attribute (ascending or descending)

	language: STRING
			--  Value of language attribute

	case_order: STRING
			-- Value of case-order attribute ("lower-first" or "upper-first")

	data_type: STRING
			-- Value of data-type attribute ("text" or "number" or a QName)

	reduced_definition (a_context: XM_XSLT_EVALUATION_CONTEXT):  XM_XSLT_FIXED_SORT_KEY_DEFINITION is
			-- Sort key definition without any dependencies on the context except for the sort key itself;
			-- For the AVTs used to select data type, case order, language, it means
			--  all dependencies: after reduction, these values will be constants.
		require
			context_not_void: a_context /= Void
			reducible: is_reducible
			known_collation: collation_name /= Void implies a_context.is_known_collation (collation_name)
		local
			a_collator: ST_COLLATOR
		do
			if collation_name /= Void then
				a_collator := a_context.collator (collation_name)
			end
			create Result.make (sort_key, order, data_type, case_order, language, a_collator)
		ensure
			reduced_definition_not_void: Result /= Void
		end

feature -- Status_report

	is_reducible: BOOLEAN is
			-- May `reduced_definition' be called?
		do
			Result := order /= Void and
			case_order /= Void and
			language /= Void and
			data_type /= Void			
		end

feature -- Element change

	set_sort_key (a_key: like sort_key) is
			-- Set `sort_key' to `a_key'.
		require
			a_key_not_void: a_key /= Void
		do
			sort_key := a_key
		ensure
			sort_key_set: sort_key = a_key
		end

	evaluate_expressions (a_context: XM_XSLT_EVALUATION_CONTEXT) is
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

	is_fixed_sort_key: BOOLEAN is
			-- Is `Current' a fixed_sort_key?
		do
			Result := False
		end

	as_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION is
			-- `Current' seen as a fixed_sort_key
		require
			fixed_sort_key: is_fixed_sort_key
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature {NONE} -- Implementation

	evaluate_collation_name (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate `collation_name_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if collation_name_expression /= Void then
				create l_item.make (Void)
				collation_name_expression.evaluate_item (l_item, a_context)
				collation_name := l_item.item.string_value
			end
		end

	evaluate_order (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate `order_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if order_expression = Void then
				order := "ascending"
			else
				create l_item.make (Void)
				order_expression.evaluate_item (l_item, a_context)
				order := l_item.item.string_value
			end
		ensure
			order_not_void: order /= Void
		end
	
	evaluate_case_order (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate `case_order_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if case_order_expression = Void then
				case_order := "#default"
			else
				create l_item.make (Void)
				case_order_expression.evaluate_item (l_item, a_context)
				case_order := l_item.item.string_value
			end
		ensure
			case_order_not_void: case_order /= Void
		end
	
	evaluate_language (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate `language_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if language_expression = Void then
				language := ""
			else
				create l_item.make (Void)
				language_expression.evaluate_item (l_item, a_context)
				language := l_item.item.string_value
			end
		ensure
			language_not_void: language /= Void
		end
	
	evaluate_data_type (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate `data_type_expression'
		require
			context_not_void: a_context /= Void
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if data_type_expression = Void then
				data_type := ""
			else
				create l_item.make (Void)
				data_type_expression.evaluate_item (l_item, a_context)
				if l_item.item = Void then
					data_type := ""
				else
					data_type := l_item.item.string_value
				end
			end
		ensure
			data_type_not_void: data_type /= Void
		end
	
invariant

	sort_key_not_void: sort_key /= Void

end

