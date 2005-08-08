indexing

	description: "Routines that support passing of xsl:with-param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_WITH_PARAM_ROUTINES

feature -- Access

	xpath_expressions (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- List of select expressions in `some_parameters'
		require
			parameter_list_not_void: some_parameters /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				create Result.make (some_parameters.count)
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item.select_expression
				if an_expression /= Void then
					Result.put_last (an_expression)
				end
				a_cursor.forth
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Optimization

	simplify_with_params (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]) is
			-- Preform context-independent static optimizations on all in `some_parameters'.
		require
			parameter_list_not_void: some_parameters /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item.select_expression
				if an_expression /= Void then
					an_expression.simplify
					if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
					a_cursor.item.set_selector (an_expression)
				end
				a_cursor.forth
			end
		end

	check_with_params (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking of all in  `some_parameters'.
		require
			parameter_list_not_void: some_parameters /= Void
			static_context_not_void: a_context /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item.select_expression
				if an_expression /= Void then
					an_expression.check_static_type (a_context)
					if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
					a_cursor.item.set_selector (an_expression)
				end
				a_cursor.forth
			end
		end

	optimize_with_params (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Optimize all in  `some_parameters'.
		require
			parameter_list_not_void: some_parameters /= Void
			static_context_not_void: a_context /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item.select_expression
				if an_expression /= Void then
					an_expression.optimize (a_context)
					if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
					a_cursor.item.set_selector (an_expression)
				end
				a_cursor.forth
			end
		end

	promote_with_params (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote all in `some_parameters'.
		require
			parameter_list_not_void: some_parameters /= Void
			promotion_offer_not_void: an_offer /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item.select_expression
				if an_expression /= Void then
					an_expression.promote (an_offer)
					if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
					a_cursor.item.set_selector (an_expression)
				end
				a_cursor.forth
			end	
		end

feature -- Element change
	
	set_with_params_parent (some_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; an_expression_container: XM_XPATH_EXPRESSION_CONTAINER) is
			-- Set `an_expression_container' to be parent of all in `some_parameters'.
		require
			parameter_list_not_void: some_parameters /= Void
			container_not_void: an_expression_container /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
		do
			from
				a_cursor := some_parameters.new_cursor;a_cursor.start
			variant
				some_parameters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.set_parent (an_expression_container)
				a_cursor.forth
			end
		end

end
	
