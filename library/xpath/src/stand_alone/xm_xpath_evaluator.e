note

	description:

		"Objects that evaluate XPath expressions in a stand-alone environment (no host language)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_EVALUATOR

inherit

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_STRING_MODE

	XM_XPATH_TOKENS

	XM_XPATH_ISOLATION_LEVELS

	KL_SHARED_STANDARD_FILES

	MA_SHARED_DECIMAL_CONTEXT

	XM_RESOLVER_FACTORY

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initializtion

	make (digits: INTEGER; on_or_off: BOOLEAN)
			-- Set precision for decimal arithmetic, and line numbering status.
		require
			sufficient_precision: digits >= 18
		do
			shared_decimal_context.set_digits (digits)
			is_line_numbering := on_or_off
		ensure
			precision_set: shared_decimal_context.digits = digits
			line_numbering_set: is_line_numbering = on_or_off
		end

feature -- Access

	static_context: detachable XM_XPATH_STAND_ALONE_CONTEXT
			-- Static context

	context_item: detachable XM_XPATH_ITEM
			-- Initial context item, normally a node

	function_library: detachable XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library

	evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
			-- Results from `evaluate'

	document: detachable XM_XPATH_DOCUMENT
			-- Document node against which XPath is evaluated

	source_uri: detachable STRING
			-- URI of source document

	implicit_timezone: detachable DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates

feature -- Status report

	is_line_numbering: BOOLEAN
			-- Is_line numbering turned on?

	was_build_error: BOOLEAN
			-- Did an error occur building the static context?

	error_message: STRING
			-- Error message from build process
		require
			build_error: was_build_error
		do
			check precondition_was_build_error: attached internal_error_message as l_internal_error_message then
				Result := l_internal_error_message
			end
		ensure
			error_message_not_void: Result /= Void
		end

	is_error: BOOLEAN
			-- Did last call to `evaluate' end in error?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to `evaluate'
		require
			evaluation_error: is_error
		do
			check preconditin_is_error: attached internal_error_value as l_internal_error_value then
				Result := l_internal_error_value
			end
		ensure
			error_value_not_void: Result /= Void
		end

feature -- Element change

	build_static_context (a_source_uri: STRING; xpath_one_compatibility, warnings, use_tiny_tree_model, compact_tree: BOOLEAN)
			-- Create a new static_context by parsing `a_source_uri'
		require
			valid_uri: a_source_uri /= Void -- and then ... for now - is a relative file uri - TODO
			warnings: warnings implies xpath_one_compatibility
		local
			has_error: BOOLEAN
			l_base_uri: UT_URI
			l_core_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			l_constructor_function_library: XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY
			l_function_library: like function_library
		do
			create l_base_uri.make (a_source_uri)
			make_parser (use_tiny_tree_model, a_source_uri, l_base_uri)
			check postcondition_of_make_parser: attached parser as l_parser then
				source_uri := a_source_uri
				l_parser.parse_from_system (a_source_uri)
				if use_tiny_tree_model then
					check postcondition_of_make_parser: attached tiny_tree_pipe as l_tiny_tree_pipe then
						if l_tiny_tree_pipe.tree.has_error then
							has_error := True
							was_build_error := True
							internal_error_message := l_tiny_tree_pipe.tree.last_error
						else
							context_item := l_tiny_tree_pipe.document
						end
					end
				else
					check postcondition_of_make_parser: attached tree_pipe as l_tree_pipe then
						if l_tree_pipe.tree.has_error then
							has_error := True
							was_build_error := True
							internal_error_message := l_tree_pipe.tree.last_error
						else
							context_item := l_tree_pipe.document
						end
					end
				end
				if not has_error then
					check
						attached context_item as l_context_item
						context_item_is_node: l_context_item.is_node
						-- because tree_pipe.document is a document node
					then
					  document := l_context_item.as_node.document_root
					  check attached document as l_document then
						  source_uri := l_document.base_uri
						  create l_function_library.make
						  function_library := l_function_library
						  create l_core_function_library.make
						  create l_constructor_function_library.make
						  l_function_library.add_function_library (l_core_function_library)
						  l_function_library.add_function_library (l_constructor_function_library)
						  create {XM_XPATH_STAND_ALONE_CONTEXT} static_context.make (warnings, xpath_one_compatibility, l_base_uri, l_function_library)
					  end
					end
				end
			end
		ensure
			built: not was_build_error implies static_context /= Void and then document /= Void and then context_item /= Void and then function_library /= Void
			source_uri_set: source_uri /= Void
		end

	set_static_context (a_static_context: XM_XPATH_STAND_ALONE_CONTEXT)
			-- Set the static context for compiling XPath expressions.
			-- This provides control over the environment in which the expression is compiled.
			-- For example it allows namespace prefixes to be declared,
			--  variables to be bound and functions to be defined.
			-- For most purposes, the static context can be defined
			--  by providing and tailoring an instance of `XM_XPATH_STAND_ALONE_CONTEXT'.
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_set: static_context = a_static_context
		end

	set_context_item (an_item: XM_XPATH_ITEM)
			-- Set the context item.
		require
			item_not_void: an_item /= void
		do
			context_item := an_item
		ensure
			context_item_set: context_item = an_item
		end

	set_implicit_timezone (an_implicit_timezone: like implicit_timezone)
			-- Set `implicit_timezone'.
		require
			implicit_timezone_not_void: an_implicit_timezone /= Void
		do
			implicit_timezone := an_implicit_timezone
		ensure
			set: implicit_timezone = an_implicit_timezone
		end

	reset_errors
			-- Reset to no errors.
		do
			internal_error_message := Void
			is_error := False
		ensure
			no_error: not is_error
		end

feature -- Evaluation

	evaluate (a_expression_text: STRING)
			-- Evaluate `a_expression_text' against `context_item'.
		require
			expression_not_void: a_expression_text /= Void
			static_context_not_void: static_context /= Void
			context_item_not_void: context_item /= Void
			source_uri_not_void: source_uri /= Void
			function_library_not_void: function_library /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_slot_manager: XM_XPATH_SLOT_MANAGER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check precondition_static_context_not_void: attached static_context as l_static_context then
				expression_factory.make_expression (a_expression_text, l_static_context, 1, Eof_token, 1, "unknown:")
				if expression_factory.is_parse_error then
					is_error := True
					internal_error_value := expression_factory.parsed_error_value
				else
					l_expression := expression_factory.parsed_expression
					create l_replacement.make (Void)
					l_expression.check_static_type (l_replacement, l_static_context, any_item)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_expression then
						l_expression := l_replacement_expression
						if l_expression.is_error then
							is_error := True
							internal_error_value := l_expression.error_value
						else
							debug ("XPath evaluator")
								l_expression.display (1)
							end
							l_replacement.put (Void)
							l_expression.optimize (l_replacement, l_static_context, any_item)
							check postcondition_of_optimize: attached l_replacement.item as l_replacement_expression2 then
								l_expression := l_replacement_expression2
								if l_expression.is_error then
									is_error := True
									internal_error_value := l_expression.error_value
								else
									debug ("XPath evaluator")
										l_expression.display (1)
									end
									create l_slot_manager.make
									l_expression.allocate_slots (1, l_slot_manager)
									evaluate_post_analysis (l_expression, l_slot_manager)
								end
							end
						end
					end
				end
			end
		ensure
			error_or_item_list: not is_error implies evaluated_items /= Void
		end

feature {NONE} -- Implementation

	is_space_stripped: BOOLEAN
			-- Do we strip white space?

	media_type: detachable UT_MEDIA_TYPE
			-- Media type of `source_uri'

	make_parser (use_tiny_tree_model: BOOLEAN; a_base_uri: STRING; a_document_uri: detachable UT_URI)
		require
			a_base_uri_not_void: a_base_uri /= Void
		local
			entity_resolver: XM_URI_EXTERNAL_RESOLVER
			l_parser: like parser
			l_tiny_tree_pipe: like tiny_tree_pipe
			l_tree_pipe: like tree_pipe
		do
			entity_resolver := new_file_resolver_current_directory
			create l_parser.make
			parser := l_parser
			l_parser.copy_string_mode (Current)
			l_parser.set_resolver (entity_resolver)
			if use_tiny_tree_model then
				create l_tiny_tree_pipe.make (l_parser, is_line_numbering, a_base_uri, a_document_uri)
				tiny_tree_pipe := l_tiny_tree_pipe
				l_parser.set_callbacks (l_tiny_tree_pipe.start)
				l_parser.set_dtd_callbacks (l_tiny_tree_pipe.emitter)
			else
				create l_tree_pipe.make (l_parser, is_line_numbering, a_base_uri, a_document_uri)
				tree_pipe := l_tree_pipe
				l_parser.set_callbacks (l_tree_pipe.start)
				l_parser.set_dtd_callbacks (l_tree_pipe.emitter)
			end
		ensure
			parser_not_void: parser /= Void
			tiny_tree_pipe_not_void: use_tiny_tree_model implies tiny_tree_pipe /= Void
			tree_pipe_not_void: not use_tiny_tree_model implies tree_pipe /= Void
		end

	internal_error_message: detachable STRING
			-- Error message from `build_context'

	internal_error_value: detachable XM_XPATH_ERROR_VALUE
			-- Error result from last call to `evaluate'

	parser: detachable XM_EIFFEL_PARSER
			-- Gobo XML parser

	tiny_tree_pipe: detachable XM_XPATH_TINYTREE_CALLBACKS_PIPE
			-- Tree builder for tiny tree model

	tree_pipe: detachable XM_XPATH_TREE_CALLBACKS_PIPE
		-- Tree builder

	evaluate_post_analysis (a_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- perform evaluation on `a_expression'.
		require
			a_expression_checked_and_optimized_without_error: a_expression /= Void and then not a_expression.is_error
			a_slot_manager_not_void: a_slot_manager /= Void
			context_item_not_void: context_item /= Void
			source_uri_not_void: source_uri /= Void
			function_library_not_void: function_library /= Void
		local
			l_document_pool: XM_XPATH_DOCUMENT_POOL
			l_context: XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT
			l_item: XM_XPATH_ITEM
			l_evaluated_items: like evaluated_items
		do
			check
				precondition_context_item_not_void: attached context_item as l_context_item
				precondition_source_uri_not_void: attached source_uri as l_source_uri
				precondition_function_library_not_void: attached function_library as l_function_library
			then
				create l_document_pool.make (Serializable)
				-- TODO media_type needs to be retrieved (earlier) from the tree pipe
				l_document_pool.add (document, media_type, l_source_uri)
				create l_context.make (l_context_item, l_document_pool, l_function_library)
				if attached implicit_timezone as l_implicit_timezone then
					l_context.set_implicit_timezone (l_implicit_timezone)
				end
				l_context.copy_string_mode (Current)
				l_context.open_stack_frame (a_slot_manager)
				a_expression.create_iterator (l_context)
				check postcondition_of_creste_iterator: attached a_expression.last_iterator as l_sequence_iterator then
					if l_sequence_iterator.is_error then
						is_error := True
						internal_error_value := l_sequence_iterator.error_value
					else
						from
							l_sequence_iterator.start
							if l_sequence_iterator.is_error then
								is_error := True
								internal_error_value := l_sequence_iterator.error_value
							end
							create l_evaluated_items.make
							evaluated_items := l_evaluated_items
						until
							is_error or else l_sequence_iterator.is_error or else l_sequence_iterator.after
						loop
								check
									item_not_void: l_sequence_iterator.item /= Void
									-- Because start ensures not before and until clause ensures not after
								end
							l_item := l_sequence_iterator.item
							if l_item.is_error then
								is_error := True
								internal_error_value := l_item.error_value
							else
								l_evaluated_items.put_last (l_item)
							end

							l_sequence_iterator.forth
							if l_sequence_iterator.is_error then
								is_error := True
								internal_error_value := l_sequence_iterator.error_value
							end
						end
					end
				end
			end
		ensure
			error_or_item_list: not is_error implies evaluated_items /= Void
		end

invariant

	build_error_implies_error_message: was_build_error implies error_message /= Void

end
