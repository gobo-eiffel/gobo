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

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_STRING_MODE

	KL_SHARED_STANDARD_FILES
	
	-- TODO: need to add a white-space stripper

feature -- Access

	static_context: XM_XPATH_STAND_ALONE_CONTEXT
			-- Static context

	context_item: XM_XPATH_ITEM
			-- Initial context item, normally a node

	evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			-- Results from `evaluate'
	
feature -- Status report

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
			input_stream: KL_TEXT_INPUT_FILE
			a_context_node: XM_XPATH_NODE
			has_error: BOOLEAN
		do
			create input_stream.make (a_source_uri)
			input_stream.open_read
			if input_stream.is_open_read then
				make_parser (a_source_uri, use_tiny_tree_model)
				parser.parse_from_stream (input_stream)
				if use_tiny_tree_model then
					has_error := tiny_tree_pipe.error.has_error
				else
					has_error := tree_pipe.error.has_error
				end
				if has_error then
					was_build_error := True
					if use_tiny_tree_model then
						internal_error_message := tiny_tree_pipe.error.last_error
					else
						internal_error_message := tree_pipe.error.last_error
					end
				else
					if use_tiny_tree_model then
						context_item := tiny_tree_pipe.document
					else
						context_item := tree_pipe.document
					end
					a_context_node ?= context_item
						check
							context_item_is_node: a_context_node /= Void
							-- because tree_pipe.document is a document node
						end
					document := a_context_node.document_root
					create {XM_XPATH_STAND_ALONE_CONTEXT} static_context.make (document.name_pool, warnings, xpath_one_compatibility)
				end
			else
				was_build_error := True
				internal_error_message := "Failed to open input source"
			end
		ensure
			built: not was_build_error implies static_context /= Void and then document /= Void and then context_item /= Void
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
			a_system_function_factory: XM_XPATH_SYSTEM_FUNCTION_FACTORY
		do
			create a_system_function_factory
			function_factory.register_system_function_factory (a_system_function_factory)
			expression_factory.make_expression (an_expression_text, static_context)
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
					end
					if an_expression.is_error then
						is_error := True
						internal_error_value := an_expression.error_value
					else
						debug ("XPath evaluator")
							an_expression.display (1, static_context.name_pool)
						end
						an_expression.allocate_slots (1)
						evaluate_post_analysis (an_expression)
					end
				end
			end
		ensure
			error_or_item_list: not is_error implies evaluated_items /= Void
		end

feature {NONE} -- Implementation

	document: XM_XPATH_DOCUMENT
			-- Document node against which XPath is evaluated

	is_space_stripped: BOOLEAN
			-- Do we strip white space?

	make_parser (a_system_id: STRING; use_tiny_tree_model: BOOLEAN) is
		require
			system_id_not_void: a_system_id /= Void
		local
			entity_resolver: XM_FILE_EXTERNAL_RESOLVER
		do
			create entity_resolver.make
			create parser.make
			parser.copy_string_mode (Current)
			parser.set_resolver (entity_resolver)
			if use_tiny_tree_model then
				create tiny_tree_pipe.make (a_system_id)
				parser.set_callbacks (tiny_tree_pipe.start)
				parser.set_dtd_callbacks (tiny_tree_pipe.emitter)
			else
				create tree_pipe.make (a_system_id)
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

	evaluate_post_analysis (an_expression: XM_XPATH_EXPRESSION) is
			-- perform evaluation on `an_expression'.
		require
			expression_analyzed_without_error: an_expression /= Void and then not an_expression.is_error
		local
			a_context: XM_XPATH_CONTEXT
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
				an_item: XM_XPATH_ITEM
		do
			create a_context.make (context_item, 0)
			a_sequence_iterator := an_expression.iterator (a_context)
			
			if a_sequence_iterator.is_error then
				is_error := True
				internal_error_value := a_sequence_iterator.error_value
			else
				from
					a_sequence_iterator.start
					if a_sequence_iterator.is_error then -- can happen due to mapping iterators
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
					if a_sequence_iterator.is_error then -- can happen due to mapping iterators
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
