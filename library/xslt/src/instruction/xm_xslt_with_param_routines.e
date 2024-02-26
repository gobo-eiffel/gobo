note

	description: "Routines that support passing of xsl:with-param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_WITH_PARAM_ROUTINES

feature -- Access

	xpath_expressions (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- List of select expressions in `a_parameters'
		require
			parameter_list_not_void: a_parameters /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			l_expression: detachable XM_XPATH_EXPRESSION
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

	simplify_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM])
			-- Perform context-independent static optimizations on all in `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
		do
			a_parameters.do_all (agent simplify_parameter)
		end

	check_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking of all in  `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			static_context_not_void: a_context /= Void
		do
			a_parameters.do_all (agent check_parameter_static_type (?, a_context, a_context_item_type))
		end

	optimize_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Optimize all in  `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			static_context_not_void: a_context /= Void
		do
			a_parameters.do_all (agent optimize_parameter (?, a_context, a_context_item_type))
		end

	promote_with_params (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote all in `a_parameters'.
		require
			parameter_list_not_void: a_parameters /= Void
			promotion_offer_not_void: a_offer /= Void
		do
			a_parameters.do_all (agent promote_parameter (?, a_offer))
		end

feature -- Element change

	set_with_params_parent (a_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; l_expression_container: XM_XPATH_EXPRESSION_CONTAINER)
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

	simplify_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM)
			-- Simplify `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached a_parameter.select_expression as l_select_expression then
				l_expression := l_select_expression
				create l_replacement.make (Void)
				l_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					a_parameter.set_selector (l_replacement_item)
				end
			end
		end

	check_parameter_static_type (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Check static type of `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached a_parameter.select_expression as l_select_expression then
				l_expression := l_select_expression
				create l_replacement.make (Void)
				l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					a_parameter.set_selector (l_replacement_item)
				end
			end
		end

	optimize_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Optimize `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached a_parameter.select_expression as l_select_expression then
				l_expression := l_select_expression
				create l_replacement.make (Void)
				l_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					a_parameter.set_selector (l_replacement_item)
				end
			end
		end

	promote_parameter (a_parameter: XM_XSLT_COMPILED_WITH_PARAM; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote `select_expression' in `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_offer_not_void: a_offer /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached a_parameter.select_expression as l_select_expression then
				l_expression := l_select_expression
				create l_replacement.make (Void)
				l_expression.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					a_parameter.set_selector (l_replacement_item)
				end
			end
		end

end

