indexing

	description:

		"Objects that evaluate XPath expressions in a stand-alone environment (no host language)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EVALUATOR

inherit

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_STRING_MODE

	XM_XPATH_TOKENS

	KL_SHARED_STANDARD_FILES

	MA_SHARED_DECIMAL_CONTEXT

	XM_RESOLVER_FACTORY

create

	make

feature {NONE} -- Initializtion

	make (digits: INTEGER; on_or_off: BOOLEAN) is
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

	static_context: XM_XPATH_STAND_ALONE_CONTEXT
			-- Static context

	context_item: XM_XPATH_ITEM
			-- Initial context item, normally a node

	function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library

	evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			-- Results from `evaluate'

	document: XM_XPATH_DOCUMENT
			-- Document node against which XPath is evaluated

feature -- Status report

	is_line_numbering: BOOLEAN
			-- Is_line numbering turned on?

	was_build_error: BOOLEAN
			-- Did an error occur building the static context?

	error_message: STRING is
			-- Error message from build process
		require
			build_error: was_build_error
		do
			Result := internal_error_message
		ensure
			error_message_not_void: Result /= Void
		end

	is_error: BOOLEAN
			-- Did last call to `evaluate' end in error?

	error_value: XM_XPATH_ERROR_VALUE is
			-- Error result from last call to `evaluate'
		require
			evaluation_error: is_error
		do
			Result := internal_error_value
		ensure
			error_value_not_void: Result /= Void
		end

feature -- Element change
	
	build_static_context (a_source_uri: STRING; xpath_one_compatibility, warnings, use_tiny_tree_model, compact_tree: BOOLEAN) is
			-- Create a new static_context by parsing `a_source_uri'
		require
			valid_uri: a_source_uri /= Void -- and then ... for now - is a relative file uri - TODO
			warnings: warnings implies xpath_one_compatibility
		local
			a_context_node: XM_XPATH_NODE
			has_error: BOOLEAN
			a_base_uri: UT_URI
			a_core_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			a_constructor_function_library: XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY
		do
			make_parser (use_tiny_tree_model)
			source_uri := a_source_uri
			parser.parse_from_system (source_uri)
			if use_tiny_tree_model then
				has_error := tiny_tree_pipe.tree.has_error
			else
				has_error := tree_pipe.tree.has_error
			end
			if has_error then
				was_build_error := True
				if use_tiny_tree_model then
					internal_error_message := tiny_tree_pipe.tree.last_error
				else
					internal_error_message := tree_pipe.tree.last_error
				end
			else
				if use_tiny_tree_model then
					context_item := tiny_tree_pipe.document
				else
					context_item := tree_pipe.document
				end
				check
					context_item_is_node: context_item.is_node
					-- because tree_pipe.document is a document node
				end
				a_context_node := context_item.as_node
				document := a_context_node.document_root
				create a_base_uri.make (document.base_uri)
				create function_library.make
				create a_core_function_library.make
				create a_constructor_function_library.make
				function_library.add_function_library (a_core_function_library)
				function_library.add_function_library (a_constructor_function_library)
				create {XM_XPATH_STAND_ALONE_CONTEXT} static_context.make (warnings, xpath_one_compatibility, a_base_uri, function_library)
			end
		ensure
			built: not was_build_error implies static_context /= Void and then document /= Void and then context_item /= Void
			source_uri_set: source_uri = a_source_uri
		end

	set_static_context (a_static_context: XM_XPATH_STAND_ALONE_CONTEXT) is
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

	set_context_item (an_item: XM_XPATH_ITEM) is
			-- Set the context item.
		require
			item_not_void: an_item /= void
		do
			context_item := an_item
		ensure
			context_item_set: context_item = an_item
		end

feature -- Evaluation

	evaluate (an_expression_text: STRING) is
			-- Evaluate `an_expression' against `context_item'.
		require
			expression_not_void: an_expression_text /= Void
			static_context_not_void: static_context /= Void
			context_item_not_void: context_item /= Void
		local
			an_expression: XM_XPATH_EXPRESSION
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			expression_factory.make_expression (an_expression_text, static_context, 1, Eof_token, 1)
			if expression_factory.is_parse_error then
				is_error := True
				internal_error_value := expression_factory.parsed_error_value
			else
				an_expression := expression_factory.parsed_expression
				an_expression.analyze (static_context)
				if an_expression.is_error then
					is_error := True
					internal_error_value := an_expression.error_value
				else
					if an_expression.was_expression_replaced then
						an_expression := an_expression.replacement_expression
						check
							not_replaced: not an_expression.was_expression_replaced
						end
					end
					if an_expression.is_error then
						is_error := True
						internal_error_value := an_expression.error_value
					else
						debug ("XPath evaluator")
							an_expression.display (1)
						end
						create a_slot_manager.make
						an_expression.allocate_slots (1, a_slot_manager)
						evaluate_post_analysis (an_expression, a_slot_manager)
					end
				end
			end
		ensure
			error_or_item_list: not is_error implies evaluated_items /= Void
		end

feature {NONE} -- Implementation

	source_uri: STRING
			-- URI of source document

	is_space_stripped: BOOLEAN
			-- Do we strip white space?

	media_type: UT_MEDIA_TYPE
			-- Media type of `source_uri'

	make_parser (use_tiny_tree_model: BOOLEAN) is
		local
			entity_resolver: XM_URI_EXTERNAL_RESOLVER
		do
			entity_resolver := new_file_resolver_current_directory
			create parser.make
			parser.copy_string_mode (Current)
			parser.set_resolver (entity_resolver)
			if use_tiny_tree_model then
				create tiny_tree_pipe.make (parser, is_line_numbering)
				parser.set_callbacks (tiny_tree_pipe.start)
				parser.set_dtd_callbacks (tiny_tree_pipe.emitter)
			else
				create tree_pipe.make (parser, is_line_numbering)
				parser.set_callbacks (tree_pipe.start)
				parser.set_dtd_callbacks (tree_pipe.emitter)
			end
		end

	internal_error_message: STRING
			-- Error message from `build_context'

	internal_error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to `evaluate'

	parser: XM_EIFFEL_PARSER
			-- Gobo XML parser

	tiny_tree_pipe: XM_XPATH_TINYTREE_CALLBACKS_PIPE
			-- Tree builder for tiny tree model

	tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE
		-- Tree builder

	evaluate_post_analysis (an_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- perform evaluation on `an_expression'.
		require
			expression_analyzed_without_error: an_expression /= Void and then not an_expression.is_error
			slot_manager_not_void: a_slot_manager /= Void
		local
			a_document_pool: XM_XPATH_DOCUMENT_POOL
			a_context: XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
				an_item: XM_XPATH_ITEM
		do
			create a_document_pool.make
			-- TODO media_type needs to be retrieved (earlier) from the tree pipe
			a_document_pool.add (document, media_type, source_uri)
			create a_context.make (context_item, a_document_pool, function_library)
			a_context.copy_string_mode (Current)
			a_context.open_stack_frame (a_slot_manager)
			an_expression.create_iterator (a_context)
			a_sequence_iterator := an_expression.last_iterator
			
			if a_sequence_iterator.is_error then
				is_error := True
				internal_error_value := a_sequence_iterator.error_value
			else
				from
					a_sequence_iterator.start
					if a_sequence_iterator.is_error then
						is_error := True
						internal_error_value := a_sequence_iterator.error_value
					end
					create evaluated_items.make
				until
					is_error or else a_sequence_iterator.is_error or else a_sequence_iterator.after
				loop
						check
							item_not_void: a_sequence_iterator.item /= Void
							-- Because start ensures not before and until clause ensures not after
						end
					an_item := a_sequence_iterator.item
					if an_item.is_error then
						is_error := True
						internal_error_value := an_item.error_value
					else
						evaluated_items.put_last (an_item)
					end
					
					a_sequence_iterator.forth
					if a_sequence_iterator.is_error then
						is_error := True
						internal_error_value := a_sequence_iterator.error_value
					end
				end
			end
		ensure
			error_or_item_list: not is_error implies evaluated_items /= Void
		end
				
invariant
	
	build_error_implies_error_message: was_build_error implies error_message /= Void
				
end
