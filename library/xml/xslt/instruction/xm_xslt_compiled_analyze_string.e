indexing

	description: "Objects that represent an xsl:analyze-string,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ANALYZE_STRING

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, promote_instruction,
			item_type, compute_dependencies
		end

	XM_XPATH_REGEXP_CACHE_ROUTINES

	XM_XPATH_SHARED_REGEXP_CACHE

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_regex_expression, a_flags_expression: XM_XPATH_EXPRESSION;
			a_regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY; a_matching_block, a_non_matching_block: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			regex_expression_not_void: a_regex_expression /= Void
			flags_expression_not_void: a_flags_expression /= Void
			at_least_one_block: a_matching_block = Void implies a_non_matching_block /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			executable := an_executable
			select_expression := a_select_expression
			regex_expression := a_regex_expression
			flags_expression := a_flags_expression
			regexp_cache_entry := a_regexp_cache_entry
			matching_block := a_matching_block
			non_matching_block := a_non_matching_block
			from
				a_cursor := sub_expressions.new_cursor; a_cursor.start
			until a_cursor.after loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
			compute_static_properties
			initialized := True
			context_item_type := type_factory.string_type
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			regex_expression_set: regex_expression = a_regex_expression
			flags_expression_set: flags_expression = a_flags_expression
			regexp_cache_entry_set: regexp_cache_entry = a_regexp_cache_entry
			matching_block_set: matching_block = a_matching_block
			non_matching_block_set: non_matching_block = a_non_matching_block
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			if matching_block /= Void then
				if non_matching_block /= Void then
					Result := common_super_type (matching_block.item_type, non_matching_block.item_type)
				else
					Result := matching_block.item_type
				end
			else
				Result := non_matching_block.item_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (5)
			Result.set_equality_tester (expression_tester)
			Result.put_last (select_expression)
			Result.put_last (regex_expression)
			Result.put_last (flags_expression)
			if matching_block /= Void then
				Result.put_last (matching_block)
			end
			if non_matching_block /= Void then
				Result.put_last (non_matching_block)
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		local
			a_dep: ARRAY [BOOLEAN]
			a_dummy: XM_XPATH_STATIC_PROPERTY
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			if not select_expression.are_dependencies_computed then select_expression.as_computed_expression.compute_dependencies end
			set_dependencies (select_expression.dependencies)
			if not regex_expression.are_dependencies_computed then regex_expression.as_computed_expression.compute_dependencies end
			merge_dependencies (regex_expression.dependencies)
			if not flags_expression.are_dependencies_computed then flags_expression.as_computed_expression.compute_dependencies end
			merge_dependencies (flags_expression.dependencies)
			if matching_block /= Void then
				if not matching_block.are_dependencies_computed then matching_block.as_computed_expression.compute_dependencies end
				a_dep := BOOLEAN_ARRAY_.cloned_array (matching_block.dependencies)
				create a_dummy
				a_dummy.set_dependencies (a_dep)
				if a_dummy.depends_upon_focus then
					a_dummy.set_focus_independent
				end
				if a_dummy.depends_upon_regexp_group then
					a_dummy.set_regexp_group_independent
				end
				merge_dependencies (a_dummy.dependencies)
			end
			if non_matching_block /= Void then
				if not non_matching_block.are_dependencies_computed then non_matching_block.as_computed_expression.compute_dependencies end
				a_dep := BOOLEAN_ARRAY_.cloned_array (non_matching_block.dependencies)
				create a_dummy
				a_dummy.set_dependencies (a_dep)
				if a_dummy.depends_upon_focus then
					a_dummy.set_focus_independent
				end
				if a_dummy.depends_upon_regexp_group then
					a_dummy.set_regexp_group_independent
				end
				merge_dependencies (a_dummy.dependencies)
			end
		end

feature -- Optimization

	simplify is
			-- Preform context-independent static optimizations
		do
			select_expression.simplify
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression end
			regex_expression.simplify
			if regex_expression.was_expression_replaced then regex_expression := regex_expression.replacement_expression end
			flags_expression.simplify
			if flags_expression.was_expression_replaced then flags_expression := flags_expression.replacement_expression end
			if matching_block /= Void then
				matching_block.simplify
				if matching_block.was_expression_replaced then matching_block := matching_block.replacement_expression end
			end
			if non_matching_block /= Void then
				non_matching_block.simplify
				if non_matching_block.was_expression_replaced then non_matching_block := non_matching_block.replacement_expression end
			end			
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			elseif select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression)
			end
			regex_expression.check_static_type (a_context, a_context_item_type)
			if regex_expression.is_error then
				set_last_error (regex_expression.error_value)
			elseif regex_expression.was_expression_replaced then
				regex_expression := regex_expression.replacement_expression; adopt_child_expression (regex_expression)
			end
			flags_expression.check_static_type (a_context, a_context_item_type)
			if flags_expression.is_error then
				set_last_error (flags_expression.error_value)
			elseif flags_expression.was_expression_replaced then
				flags_expression := flags_expression.replacement_expression; adopt_child_expression (flags_expression)
			end
			if matching_block /= Void then
				matching_block.check_static_type (a_context, context_item_type)
				if matching_block.is_error then
					set_last_error (matching_block.error_value)
				elseif matching_block.was_expression_replaced then
					matching_block := matching_block.replacement_expression; adopt_child_expression (matching_block)
				end
			end
			if non_matching_block /= Void then
				non_matching_block.check_static_type (a_context, context_item_type)
				if non_matching_block.is_error then
					set_last_error (non_matching_block.error_value)
				elseif non_matching_block.was_expression_replaced then
					non_matching_block := non_matching_block.replacement_expression; adopt_child_expression (non_matching_block)
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			elseif select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression)
			end
			regex_expression.optimize (a_context, a_context_item_type)
			if regex_expression.is_error then
				set_last_error (regex_expression.error_value)
			elseif regex_expression.was_expression_replaced then
				regex_expression := regex_expression.replacement_expression; adopt_child_expression (regex_expression)
			end
			flags_expression.optimize (a_context, a_context_item_type)
			if flags_expression.is_error then
				set_last_error (flags_expression.error_value)
			elseif flags_expression.was_expression_replaced then
				flags_expression := flags_expression.replacement_expression; adopt_child_expression (flags_expression)
			end
			if matching_block /= Void then
				matching_block.optimize (a_context, context_item_type)
				if matching_block.is_error then
					set_last_error (matching_block.error_value)
				elseif matching_block.was_expression_replaced then
					matching_block := matching_block.replacement_expression; adopt_child_expression (matching_block)
				end
			end
			if non_matching_block /= Void then
				non_matching_block.optimize (a_context, context_item_type)
				if non_matching_block.is_error then
					set_last_error (non_matching_block.error_value)
				elseif non_matching_block.was_expression_replaced then
					non_matching_block := non_matching_block.replacement_expression; adopt_child_expression (non_matching_block)
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
			regex_expression.promote (an_offer)
			if regex_expression.was_expression_replaced then
				regex_expression := regex_expression.replacement_expression
				adopt_child_expression (regex_expression)
				reset_static_properties
			end
			flags_expression.promote (an_offer)
			if flags_expression.was_expression_replaced then
				flags_expression := flags_expression.replacement_expression
				adopt_child_expression (flags_expression)
				reset_static_properties
			end
			if matching_block /= Void then
				matching_block.promote (an_offer)
				if matching_block.was_expression_replaced then
					matching_block := matching_block.replacement_expression
					adopt_child_expression (matching_block)
					reset_static_properties
				end
			end
			if non_matching_block /= Void then
				non_matching_block.promote (an_offer)
				if non_matching_block.was_expression_replaced then
					non_matching_block := non_matching_block.replacement_expression
					adopt_child_expression (non_matching_block)
					reset_static_properties
				end
			end			
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_regexp_iterator: XM_XSLT_REGEXP_ITERATOR
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_tail_call := Void
			a_regexp_iterator := regexp_iterator (a_context)
			if not a_context.transformer.is_error then
				a_new_context := a_context.new_context
				a_new_context.set_current_iterator (a_regexp_iterator)
				a_new_context.set_current_regexp_iterator (a_regexp_iterator)
				from a_regexp_iterator.start until is_error or else a_regexp_iterator.after loop
					if a_regexp_iterator.is_error then
						a_context.transformer.report_fatal_error (a_regexp_iterator.error_value)
					elseif a_regexp_iterator.is_matching then
						if matching_block /= Void then
							matching_block.process (a_new_context)
						end
						a_regexp_iterator.forth
					else
						if non_matching_block /= Void then
							non_matching_block.process (a_new_context)
						end
						a_regexp_iterator.forth
					end
				end
			end
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	regex_expression: XM_XPATH_EXPRESSION
			-- Regex expression

	flags_expression: XM_XPATH_EXPRESSION
			-- Falgs expression

	regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY
		-- Cached regular expression

	matching_block: XM_XPATH_EXPRESSION
			-- Expression called for matching substrings
	
	non_matching_block: XM_XPATH_EXPRESSION
			-- Expression called for non-matching substrings

	context_item_type: XM_XPATH_ITEM_TYPE
			-- Known context item type for xsl:(non-)matching-substring

	regexp_iterator (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XSLT_REGEXP_ITERATOR is
			-- Iterator over substrings in regular expression;
		require
			context_not_void: a_context /= Void
		local
			an_input, some_flags, a_key: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			select_expression.evaluate_as_string (a_context)
			if select_expression.last_evaluated_string.is_error then
				a_context.transformer.report_fatal_error (select_expression.last_evaluated_string.error_value)
			else
				an_input := select_expression.last_evaluated_string.string_value
				if regexp_cache_entry = Void then
					flags_expression.evaluate_as_string (a_context)
					if flags_expression.last_evaluated_string.is_error then
						a_context.transformer.report_fatal_error (flags_expression.last_evaluated_string.error_value)
					else
						some_flags := flags_expression.last_evaluated_string.string_value
						regex_expression.evaluate_as_string (a_context)
						if regex_expression.last_evaluated_string.is_error then
							a_context.transformer.report_fatal_error (regex_expression.last_evaluated_string.error_value)
						else
							a_key := composed_key (regex_expression.last_evaluated_string.string_value, some_flags)
							regexp_cache_entry :=  shared_regexp_cache.item (a_key)
							if regexp_cache_entry = Void then
								create regexp_cache_entry.make (regex_expression.as_string_value.string_value, some_flags)
								if regexp_cache_entry.is_error then
									create an_error.make_from_string (STRING_.concat ("Invalid regular expression: ", regex_expression.last_evaluated_string.string_value),
																				 Xpath_errors_uri, "XTDE1140", Dynamic_error)
									a_context.transformer.report_fatal_error (an_error)
								else
									shared_regexp_cache.put (regexp_cache_entry, a_key)
								end
							end
							if not a_context.transformer.is_error then
								if regexp_cache_entry.regexp.matches ("") then
									create an_error.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "XTDE1150", Dynamic_error)
								end
							end
						end
					end
				end
				if not a_context.transformer.is_error then
					
					-- we don't examine the cache for xsl:analyze-string - TODO: possible improvement

					create Result.make (an_input, regexp_cache_entry.regexp)
				end
			end
		ensure
			error_or_result_not_void: not a_context.transformer.is_error implies Result /= Void
		end

invariant

	select_expression_not_void: select_expression /= Void
	regex_expression_not_void: regex_expression /= Void
	flags_expression_not_void: flags_expression /= Void
	at_least_one_block: matching_block = Void implies non_matching_block /= Void

end
	
