indexing

	description: "Routines that support passing of xsl:with-param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_WITH_PARAM_ROUTINES

feature -- Access

	xpath_expressions (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- List of select expressions in `a_parameters'
		require
			parameter_list_not_void: a_parameters /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			l_expression: XM_XPATH_EXPRESSION
		do
			from
				create Result.make (a_parameters.count)
				l_cursor := a_parameters.new_cursor;l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item.select_expression
				if l_expression /= Void then
					Result.put_last (l_expression)
				end
				l_cursor.forth
			variant
				a_parameters.count + 1 - l_cursor.index
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Optimization

	simplify_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]) is
			-- Perform context-independent static optimizations on all in `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
		do
			a_parameters.do_all (agent simplify_parameter)
		end

	check_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking of all in  `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			static_context_not_void: a_context /= Void
		do
			a_parameters.do_all (agent check_parameter_static_type (?, a_context, a_context_item_type))
		end

	optimize_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize all in  `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			static_context_not_void: a_context /= Void
		do
			a_parameters.do_all (agent optimize_parameter (?, a_context, a_context_item_type))
		end

	promote_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote all in `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			promotion_offer_not_void: a_offer /= Void
		do
			a_parameters.do_all (agent promote_parameter (?, a_offer))
		end

feature -- Element change

	set_with_params_parent (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; l_expression_container: XM_XPATH_EXPRESSION_CONTAINER) is
			-- Set `l_expression_container' to be parent of all in `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			container_not_void: l_expression_container /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
		do
			from
				l_cursor := a_parameters.new_cursor;l_cursor.start
			until
				l_cursor.after
			loop
				l_cursor.item.set_parent (l_expression_container)
				l_cursor.forth
			variant
				a_parameters.count + 1 - l_cursor.index
			end
		end

feature {NONE} -- Agents

	simplify_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM) is
			-- Simplify `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_expression := a_parameter.select_expression
			create l_replacement.make (Void)
			l_expression.simplify (l_replacement)
			a_parameter.set_selector (l_replacement.item)
		end

	check_parameter_static_type (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Check static type of `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_expression := a_parameter.select_expression
			create l_replacement.make (Void)
			l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			a_parameter.set_selector (l_replacement.item)
		end

	optimize_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_expression := a_parameter.select_expression
			create l_replacement.make (Void)
			l_expression.optimize (l_replacement, a_context, a_context_item_type)
			a_parameter.set_selector (l_replacement.item)
		end

	promote_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_offer_not_void: a_offer /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_expression := a_parameter.select_expression
			create l_replacement.make (Void)
			l_expression.promote (l_replacement, a_offer)
			a_parameter.set_selector (l_replacement.item)
		end

end

