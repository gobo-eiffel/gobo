note

	description: "Objects that represent an xsl:analyze-string,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ANALYZE_STRING

inherit

	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, promote_instruction,
			item_type, compute_dependencies, create_iterator, create_node_iterator
		end

	XM_XPATH_REGEXP_CACHE_ROUTINES

	XM_XPATH_SHARED_REGEXP_CACHE

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_regex_expression, a_flags_expression: XM_XPATH_EXPRESSION;
			a_regexp_cache_entry: detachable XM_XPATH_REGEXP_CACHE_ENTRY; a_matching_block, a_non_matching_block: detachable XM_XPATH_EXPRESSION)
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
			context_item_type := type_factory.string_type
			from
				a_cursor := sub_expressions.new_cursor; a_cursor.start
			until a_cursor.after loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
			compute_static_properties
			initialized := True
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			if attached matching_block as l_matching_block then
				if attached non_matching_block as l_non_matching_block then
					Result := common_super_type (l_matching_block.item_type, l_non_matching_block.item_type)
				else
					Result := l_matching_block.item_type
				end
			else
				check invariant_at_least_one_block: attached non_matching_block as l_non_matching_block then
					Result := l_non_matching_block.item_type
				end
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (5)
			Result.set_equality_tester (expression_tester)
			Result.put_last (select_expression)
			Result.put_last (regex_expression)
			Result.put_last (flags_expression)
			if attached matching_block as l_matching_block then
				Result.put_last (l_matching_block)
			end
			if attached non_matching_block as l_non_matching_block then
				Result.put_last (l_non_matching_block)
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "xsl:analyze-string"))
			std.error.put_new_line
		end

feature -- Status setting

	compute_dependencies
			-- Compute dependencies on context.
		local
			l_dummy: XM_XPATH_STATIC_PROPERTY
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			if not select_expression.are_dependencies_computed then
				select_expression.as_computed_expression.compute_dependencies
			end
			set_dependencies (select_expression)
			if not regex_expression.are_dependencies_computed then
				regex_expression.as_computed_expression.compute_dependencies
			end
			merge_dependencies (regex_expression)
			if not flags_expression.are_dependencies_computed then
				flags_expression.as_computed_expression.compute_dependencies
			end
			merge_dependencies (flags_expression)
			if attached matching_block as l_matching_block then
				if not l_matching_block.are_dependencies_computed then
					l_matching_block.as_computed_expression.compute_dependencies
				end
				create l_dummy
				l_dummy.set_dependencies (l_matching_block)
				if l_dummy.depends_upon_focus then
					l_dummy.set_focus_independent
				end
				if l_dummy.depends_upon_regexp_group then
					l_dummy.set_regexp_group_independent
				end
				merge_dependencies (l_dummy)
			end
			if attached non_matching_block as l_non_matching_block then
				if not l_non_matching_block.are_dependencies_computed then
					l_non_matching_block.as_computed_expression.compute_dependencies
				end
				create l_dummy
				l_dummy.set_dependencies (l_non_matching_block)
				if l_dummy.depends_upon_focus then
					l_dummy.set_focus_independent
				end
				if l_dummy.depends_upon_regexp_group then
					l_dummy.set_regexp_group_independent
				end
				merge_dependencies (l_dummy)
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Preform context-independent static optimizations
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
			end
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				regex_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					set_regex_expression (l_replacement_item)
				end
				if regex_expression.is_error then
					set_replacement (a_replacement, regex_expression)
				else
					l_replacement.put (Void)
					flags_expression.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
						set_flags_expression (l_replacement_item)
					end
					if flags_expression.is_error then
						set_replacement (a_replacement, flags_expression)
					else
						if attached matching_block as l_matching_block then
							l_replacement.put (Void)
							l_matching_block.simplify (l_replacement)
							check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
								set_matching_block (l_replacement_item)
							end
							if l_matching_block.is_error then
								set_replacement (a_replacement, l_matching_block)
							elseif attached non_matching_block as l_non_matching_block then
								l_replacement.put (Void)
								l_non_matching_block.simplify (l_replacement)
								check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
									set_non_matching_block (l_replacement_item)
								end
								if l_non_matching_block.is_error then
									set_replacement (a_replacement, l_non_matching_block)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
			end
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				regex_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					set_regex_expression (l_replacement_item)
				end
				if regex_expression.is_error then
					set_replacement (a_replacement, regex_expression)
				else
					l_replacement.put (Void)
					flags_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
						set_flags_expression (l_replacement_item)
					end
					if flags_expression.is_error then
						set_replacement (a_replacement, flags_expression)
					else
						if attached matching_block as l_matching_block then
							l_replacement.put (Void)
							l_matching_block.check_static_type (l_replacement, a_context, context_item_type)
							check postcondition_of_check_static_type: attached l_replacement.item as l_new_matching_block then
								set_matching_block (l_new_matching_block)
								if l_new_matching_block.is_error then
									set_replacement (a_replacement, l_new_matching_block)
								end
							end
						end
						if attached non_matching_block as l_non_matching_block then
							l_replacement.put (Void)
							l_non_matching_block.check_static_type (l_replacement, a_context, context_item_type)
							check postcondition_of_check_static_type: attached l_replacement.item as l_new_non_matching_block then
								set_non_matching_block (l_new_non_matching_block)
								if l_new_non_matching_block.is_error then
									set_replacement (a_replacement, l_new_non_matching_block)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.optimize (l_replacement, a_context, a_context_item_type)
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				regex_expression.optimize (l_replacement, a_context, a_context_item_type)
				if regex_expression.is_error then
					set_replacement (a_replacement, regex_expression)
				else
					l_replacement.put (Void)
					flags_expression.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						set_flags_expression (l_replacement_item)
					end
					if flags_expression.is_error then
						set_replacement (a_replacement, flags_expression)
					else
						l_replacement.put (Void)
						if attached matching_block as l_matching_block then
							l_matching_block.optimize (l_replacement, a_context, context_item_type)
							check postcondition_of_optimize: attached l_replacement.item as l_new_matching_block then
								set_matching_block (l_new_matching_block)
								if l_new_matching_block.is_error then
									set_replacement (a_replacement, l_new_matching_block)
								end
							end
						end
						if attached non_matching_block as l_non_matching_block then
							l_replacement.put (Void)
							l_non_matching_block.optimize (l_replacement, a_context, context_item_type)
							check postcondition_of_optimize: attached l_replacement.item as l_new_non_matching_block then
								set_non_matching_block (l_new_non_matching_block)
								if l_new_non_matching_block.is_error then
									set_replacement (a_replacement, l_new_non_matching_block)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
			end
			l_replacement.put (Void)
			regex_expression.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_regex_expression (l_replacement_item)
			end
			l_replacement.put (Void)
			flags_expression.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_flags_expression (l_replacement_item)
			end
			l_replacement.put (Void)
			if attached matching_block as l_matching_block then
				l_replacement.put (Void)
				l_matching_block.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_matching_block (l_replacement_item)
				end
			end
			if attached non_matching_block as l_non_matching_block then
				l_replacement.put (Void)
				l_non_matching_block.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_non_matching_block (l_replacement_item)
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the values of a sequence.
		local
			l_regexp_iterator: detachable XM_XSLT_REGEXP_ITERATOR
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				l_context_not_void: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
			then
				l_regexp_iterator := regexp_iterator (l_context)
				check attached l_context.transformer as l_transformer then
					if attached l_transformer.last_error as l_last_error then
						check is_error: l_transformer.is_error end
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_last_error)
					else
						check postcondition_of_regexp_iterator: l_regexp_iterator /= Void then
							l_new_context := l_context.new_context
							l_new_context.set_current_iterator (l_regexp_iterator)
							l_new_context.set_current_regexp_iterator (l_regexp_iterator)
							create {XM_XPATH_CONTEXT_MAPPING_ITERATOR} last_iterator.make (create {XM_XSLT_ANALYZE_MAPPING_FUNCTION}.make (l_regexp_iterator, l_new_context, matching_block, non_matching_block), l_new_context)
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the nodes of a sequence.
		local
			l_regexp_iterator: detachable XM_XSLT_REGEXP_ITERATOR
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				l_context_not_void: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
			then
				l_regexp_iterator := regexp_iterator (l_context)
				check attached l_context.transformer as l_transformer then
					if attached l_transformer.last_error as l_last_error then
						check is_error: l_transformer.is_error end
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_last_error)
					else
						check postcondition_of_regexp_iterator: l_regexp_iterator /= Void then
							l_new_context := l_context.new_context
							l_new_context.set_current_iterator (l_regexp_iterator)
							l_new_context.set_current_regexp_iterator (l_regexp_iterator)
							create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_regexp_iterator, create {XM_XSLT_ANALYZE_NODE_MAPPING_FUNCTION}.make (l_regexp_iterator, l_new_context, matching_block, non_matching_block), l_new_context)
						end
					end
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_regexp_iterator: detachable XM_XSLT_REGEXP_ITERATOR
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			l_regexp_iterator := regexp_iterator (a_context)
			check attached a_context.transformer as l_transformer then
				if not l_transformer.is_error then
					check postcondition_of_regexp_iterator: l_regexp_iterator /= Void then
						l_new_context := a_context.new_context
						l_new_context.set_current_iterator (l_regexp_iterator)
						l_new_context.set_current_regexp_iterator (l_regexp_iterator)
						from l_regexp_iterator.start until is_error or else l_regexp_iterator.after loop
							if attached l_regexp_iterator.error_value as l_error_value then
								check is_error: l_regexp_iterator.is_error end
								l_transformer.report_fatal_error (l_error_value)
							elseif l_regexp_iterator.is_matching then
								if attached matching_block as l_matching_block then
									l_matching_block.generate_events (l_new_context)
								end
								l_regexp_iterator.forth
							else
								if attached non_matching_block as l_non_matching_block then
									l_non_matching_block.generate_events (l_new_context)
								end
								l_regexp_iterator.forth
							end
						end
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

	regexp_cache_entry: detachable XM_XPATH_REGEXP_CACHE_ENTRY
		-- Cached regular expression

	matching_block: detachable XM_XPATH_EXPRESSION
			-- Expression called for matching substrings

	non_matching_block: detachable XM_XPATH_EXPRESSION
			-- Expression called for non-matching substrings

	context_item_type: XM_XPATH_ITEM_TYPE
			-- Known context item type for xsl:(non-)matching-substring

	set_select_expression (a_expression: XM_XPATH_EXPRESSION)
			-- Ensure `select_expression' is `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			if select_expression /= a_expression then
				select_expression := a_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
		ensure
			select_expression_set: select_expression = a_expression
		end

	set_regex_expression (a_expression: XM_XPATH_EXPRESSION)
			-- Ensure `regex_expression' is `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			if regex_expression /= a_expression then
				regex_expression := a_expression
				adopt_child_expression (regex_expression)
				reset_static_properties
			end
		ensure
			regex_expression_set: regex_expression = a_expression
		end

	set_flags_expression (a_expression: XM_XPATH_EXPRESSION)
			-- Ensure `flags_expression' is `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			if flags_expression /= a_expression then
				flags_expression := a_expression
				adopt_child_expression (flags_expression)
				reset_static_properties
			end
		ensure
			flags_expression_set: flags_expression = a_expression
		end


	set_matching_block (a_expression: XM_XPATH_EXPRESSION)
			-- Ensure `matching_block' is `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			if matching_block /= a_expression then
				matching_block := a_expression
				adopt_child_expression (a_expression)
				reset_static_properties
			end
		ensure
			matching_block_set: matching_block = a_expression
		end


	set_non_matching_block (a_expression: XM_XPATH_EXPRESSION)
			-- Ensure `non_matching_block' is `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			if non_matching_block /= a_expression then
				non_matching_block := a_expression
				adopt_child_expression (a_expression)
				reset_static_properties
			end
		ensure
			non_matching_block_set: non_matching_block = a_expression
		end


	regexp_iterator (a_context: XM_XSLT_EVALUATION_CONTEXT): detachable XM_XSLT_REGEXP_ITERATOR
			-- Iterator over substrings in regular expression;
		require
			context_not_void: a_context /= Void
		local
			an_input, a_key: STRING
			some_flags: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
			l_regexp_cache_entry: like regexp_cache_entry
		do
			check attached a_context.transformer as l_transformer then
				select_expression.evaluate_as_string (a_context)
				check postcondition_of_evaluate_as_string: attached select_expression.last_evaluated_string as l_select_expression_last_evaluated_string then
					if attached l_select_expression_last_evaluated_string.error_value as l_error_value then
						check is_error: l_select_expression_last_evaluated_string.is_error end
						l_transformer.report_fatal_error (l_error_value)
					else
						an_input := utf8.to_utf8 (l_select_expression_last_evaluated_string.string_value)
						if regexp_cache_entry = Void then
							flags_expression.evaluate_as_string (a_context)
							check postcondition_of_evaluate_as_string: attached flags_expression.last_evaluated_string as l_flags_expression_last_evaluated_string then
								if attached l_flags_expression_last_evaluated_string.error_value as l_error_value then
									check is_error: l_flags_expression_last_evaluated_string.is_error end
									l_transformer.report_fatal_error (l_error_value)
								else
									some_flags := normalized_flags_string (l_flags_expression_last_evaluated_string.string_value)
									regex_expression.evaluate_as_string (a_context)
									check postcondition_of_evaluate_as_string: attached regex_expression.last_evaluated_string as l_regex_expression_last_evaluated_string then
										if attached l_regex_expression_last_evaluated_string.error_value as l_error_value then
											check is_error: l_regex_expression_last_evaluated_string.is_error end
											l_transformer.report_fatal_error (l_error_value)
										else
											check some_flags /= Void then
												a_key := composed_key (utf8.to_utf8 (l_regex_expression_last_evaluated_string.string_value), some_flags)
												regexp_cache_entry :=  shared_regexp_cache.item (a_key)
												l_regexp_cache_entry := regexp_cache_entry
												if l_regexp_cache_entry = Void then
													create l_regexp_cache_entry.make (utf8.to_utf8 (l_regex_expression_last_evaluated_string.string_value), some_flags)
													regexp_cache_entry := l_regexp_cache_entry
													if l_regexp_cache_entry.is_error then
														create an_error.make_from_string (STRING_.concat ("Invalid regular expression: ", l_regex_expression_last_evaluated_string.string_value),
																									 Xpath_errors_uri, "XTDE1140", Dynamic_error)
														l_transformer.report_fatal_error (an_error)
													else
														shared_regexp_cache.put (l_regexp_cache_entry, a_key)
													end
												end
											end
											if not l_transformer.is_error then
												if l_regexp_cache_entry.regexp.matches ("") then
													create an_error.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "XTDE1150", Dynamic_error)
												end
											end
										end
									end
								end
							end
						end
						if not l_transformer.is_error then

							-- we don't examine the cache for xsl:analyze-string - TODO: possible improvement
							check attached regexp_cache_entry as l_regexp_cache_entry_2 then
								create Result.make (an_input, l_regexp_cache_entry_2.regexp)
							end
						end
					end
				end
			end
		ensure
			error_or_result_not_void: attached a_context.transformer as l_transformer and then not l_transformer.is_error implies Result /= Void
		end

invariant

	select_expression_not_void: select_expression /= Void
	regex_expression_not_void: regex_expression /= Void
	flags_expression_not_void: flags_expression /= Void
	at_least_one_block: matching_block = Void implies non_matching_block /= Void

end

