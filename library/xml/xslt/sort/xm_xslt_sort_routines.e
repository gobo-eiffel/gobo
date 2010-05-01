note

	description:

		"Routines supporting sorting"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_SORT_ROUTINES

inherit

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end
	
feature -- Optimization

	check_sort_key (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_key: XM_XSLT_SORT_KEY_DEFINITION;
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Check `a_key' for more than one item.
			-- TODO: also perform early evaluation of comparators.
		require
			a_replacement_not_void: a_replacement /= Void
			a_key_not_void: a_key /= Void
			a_context_not_void: a_context /= Void
			context_item_may_not_be_set: True
		local
			l_expression: XM_XPATH_EXPRESSION
			l_role: XM_XPATH_ROLE_LOCATOR
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				l_expression := a_key.sort_key
				l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				l_expression := l_replacement.item
				if l_expression.is_error then
					set_replacement (a_replacement, l_expression)
				else
					if a_context.is_backwards_compatible_mode then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (l_expression)
					else
						create l_role.make (Instruction_role, "xsl:sort select", 1, Xpath_errors_uri, "XTTE1020")
						create {XM_XPATH_CARDINALITY_CHECKER} l_expression.make (l_expression, Required_cardinality_optional, l_role)
					end
					a_key.set_sort_key (l_expression)
				end
			end
		end

feature -- Setting

		set_replacement (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_expression: XM_XPATH_EXPRESSION) is
			-- Set replacement for `Current'.
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		deferred
		ensure
			replaced: a_replacement.item /= Void
		end

end
