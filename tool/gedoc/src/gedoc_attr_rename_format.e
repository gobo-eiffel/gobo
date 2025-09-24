note

	description:

		"Gobo Eiffel Documentation Format: detect attribute renaming in a diamond"

	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"

class GEDOC_ATTR_RENAME_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			make,
			prepare_system,
			set_ast_factory
		end

create

	make

create {GEDOC_ATTR_RENAME_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- <Precursor>
		do
			create explicit_convert_expression_finder.make
			create explicit_convert_expressions.make (250)
			precursor (a_input_filename, a_system_processor)
		end

feature {NONE} -- Processing

	prepare_system (a_system: ET_SYSTEM)
			-- Prepare `a_system' before being processed.
		do
			precursor (a_system)
			system_processor.set_flat_mode (False)
			system_processor.set_flat_dbc_mode (False)
		end

	set_ast_factory
			-- Configure the AST factory as needed.
		local
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			create l_ast_factory.make
			set_explicit_convert_class_names (l_ast_factory)
			system_processor.set_ast_factory (l_ast_factory)
		end

	set_explicit_convert_class_names (a_ast_factory: ET_DECORATED_AST_FACTORY)
			-- Set 'explicit_convert_class_names' in `a_ast_factory'.
		require
			a_ast_factory_not_void: a_ast_factory /= Void
		local
			l_conversions: DS_ARRAYED_LIST [TUPLE [detachable LX_DFA_WILDCARD, detachable LX_DFA_WILDCARD]]
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_pattern: STRING
			l_from_wildcard: LX_DFA_WILDCARD
			l_to_wildcard: LX_DFA_WILDCARD
		do
			create l_conversions.make_default
			if attached override_variables as l_override_variables then
				if attached l_override_variables.primary_value ("convert") as l_convert then
					create l_regexp.make
					l_regexp.compile ("(([^-]|-[^>])*)->(.*)")
					if l_regexp.recognizes (l_convert) then
						l_pattern := l_regexp.captured_substring (1)
						l_pattern.left_adjust
						l_pattern.right_adjust
						create l_from_wildcard.compile_case_insensitive (l_pattern)
						if not l_from_wildcard.is_compiled then
							report_invalid_class_wildcard_error (l_pattern)
						end
						l_pattern := l_regexp.captured_substring (3)
						l_pattern.left_adjust
						l_pattern.right_adjust
						create l_to_wildcard.compile_case_insensitive (l_pattern)
						if not l_to_wildcard.is_compiled then
							report_invalid_class_wildcard_error (l_pattern)
						end
						l_conversions.force_last ([l_from_wildcard, l_to_wildcard])
					end
				end
			end
			a_ast_factory.set_explicit_convert_class_names (l_conversions)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		local
			l_input_classes: like input_classes
			l_all_classes: like input_classes
			l_formats: DS_ARRAYED_LIST [like Current]
		do
			create l_all_classes.make (a_system.class_count_recursive)
			a_system.classes_do_unless_recursive (agent l_all_classes.force_last, agent {ET_CLASS}.is_none)
			l_input_classes := input_classes
			system_processor.compile_degree_5 (l_all_classes, False)
			system_processor.compile_degree_4 (l_all_classes)
			-- system_processor.compile_degree_3 (l_input_classes)
			create l_formats.make (system_processor.processor_count)
			system_processor.do_all (agent add_format (?, l_formats))
			l_input_classes.do_all (agent {ET_CLASS}.set_marked (False))
			system_processor.process_custom (l_input_classes)
			has_error := l_formats.there_exists (agent {like Current}.has_error)
		end

feature {GEDOC_ATTR_RENAME_FORMAT} -- Processing

	is_direct_parent(sub_class: ET_CLASS; super_class: ET_CLASS): BOOLEAN
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			l_parent_list: ET_PARENT_LIST
			l_parent: ET_PARENT
		do
			Result := False
			if attached sub_class.parent_clauses as l_parents then
				nb := l_parents.count
				from i := 1 until (i > nb or Result) loop
					l_parent_list := l_parents.item (i)
					nb2 := l_parent_list.count
					from j := 1 until (j > nb2 or Result) loop
						l_parent := l_parent_list.parent (j)
						if l_parent.type.base_class = super_class then
							Result := True
						end
						j := j + 1
					end
					i := i + 1
				end
			end
		end


	process_parent_clauses(a_class: ET_CLASS)
		local
			i, k, nb, nr: INTEGER
			j, nb2: INTEGER
			old_name: STRING
			l_parent_list: ET_PARENT_LIST
			parent: ET_PARENT
			l_item: ET_RENAME_ITEM
			l_rename: ET_RENAME
			attr_table: HASH_TABLE [BOOLEAN, STRING]
		do
			if attached a_class.parent_clauses as l_parent_clauses then
				nb := l_parent_clauses.count
				from i := 1 until i > nb loop
					l_parent_list := l_parent_clauses.item (i)
					nb2 := l_parent_list.count
					from j := 1 until j > nb2 loop
						parent := l_parent_list.parent (j)

						-- collect all the fields
						-- assumption: parent.base_class.queries is flattened / conslidated
						attr_table := collect_all_attributes(parent.type.base_class)

						-- loop on renames, and report
						if attached parent.renames as l_renames then
							-- e.g. STUDENT.addr => RESEARCH_ASSISTANT.student_addr only reported here
							nr := l_renames.count
							from k := 1 until k > nr loop
								l_item := l_renames.item(k)
								l_rename := l_item.rename_pair
								if attached a_class.named_query(l_rename.new_name.feature_name) as query then
									if query.is_attribute then
										old_name := l_rename.old_name.lower_name
										error_handler.report_info_message ("renamed," + parent.type.upper_name + "." + old_name +
											"," + a_class.upper_name + "." + query.lower_name + "%N")
										attr_table.remove (old_name)
									end
								end
								k := k + 1
							end
						end

						-- report un-renamed, directly inherited fields
						across attr_table as it loop
							error_handler.report_info_message ("inherited," + parent.type.upper_name + "." + @ it.key +
								"," + a_class.upper_name + "." + @ it.key + "%N")
						end
						j := j + 1
					end
					i := i + 1
				end
			end
		end

	collect_all_attributes (a_class: ET_CLASS): HASH_TABLE [BOOLEAN, STRING]
		local
			i, nb: INTEGER
			query: ET_QUERY
		do
			create Result.make (10)
			nb := a_class.queries.count
			-- print(a_class.upper_name + ":"); print(nb); print("%N")
			from i := 1 until i > nb loop
				query := a_class.queries.item(i)
				-- print(query.lower_name + "%N")
				if query.is_attribute then
					Result.put (False, query.lower_name)
				end
				i := i + 1
			end
			-- print("%N")
		end

	process_implicit_converts (a_class: ET_CLASS)
			-- Process implicit conversions in `a_class' if it has not been marked yet.
		require
			a_class_not_void: a_class /= Void
		local
			i, nb, j, np: INTEGER
			l_expression: ET_EXPLICIT_CONVERT_EXPRESSION
			l_position: ET_POSITION
			query: ET_QUERY
			l_other_precursor: ET_FEATURE
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					if a_class.is_none then
						-- Do nothing.
					else
						process_parent_clauses(a_class)
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
			end
		end

feature {NONE} -- Implementation

	add_format (a_system_processor: ET_SYSTEM_PROCESSOR; a_formats: DS_ARRAYED_LIST [like Current])
			-- Add format associated with `a_system_processor' to `a_formats'.
		require
			a_system_processor_not_void: a_system_processor /= Void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
		local
			l_format: like Current
		do
			if a_system_processor = system_processor then
				l_format := Current
			else
				create l_format.make_from_format (Current, a_system_processor)
			end
			a_system_processor.set_custom_processor (agent l_format.process_implicit_converts)
			a_formats.force_last (l_format)
		ensure
			no_void_format: not a_formats.has_void
			one_more: a_formats.count = old a_formats.count + 1
			system_processor_set: a_formats.last.system_processor = a_system_processor
		end

	explicit_convert_expression_finder: ET_EXPLICIT_CONVERT_EXPRESSION_FINDER
			-- Used to find convert expressions

	explicit_convert_expressions: DS_ARRAYED_LIST [ET_EXPLICIT_CONVERT_EXPRESSION]
			-- Convert expressions found by `explicit_convert_expression_finder'

feature {NONE} -- Error handling

	report_invalid_class_wildcard_error (a_wildcard: STRING)
			-- Report that the wildcard specified for conversion is invalid.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Invalid wildcard '" + a_wildcard + "' in variable 'convert'.")
			report_error (l_error)
		end

invariant

	explicit_convert_expression_finder_not_void: explicit_convert_expression_finder /= Void
	explicit_convert_expressions_not_void: explicit_convert_expressions /= Void
	no_void_explicit_convert_expression: not explicit_convert_expressions.has_void

end
