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

	-- TODO: need to add a white-space stripper

feature -- Access

	static_context: XM_XPATH_STATIC_CONTEXT
			-- Static context

	context_node: XM_XPATH_NODE
			-- Initial context node

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

	is_evaluation_in_error: BOOLEAN
			-- Did last call to `evaluate' end in error?

	error_value: XM_XPATH_ERROR_VALUE is
			-- Error result from last call to `evaluate'
		require
			evaluation_error: is_evaluation_in_error
		do
			Result := internal_error_value
		ensure
			error_value_not_void: Result /= Void
		end

feature -- Element change
	
	build_context (a_source_uri: STRING) is
			-- Create a new static_context by parsing `a_source_uri'
		require
			valid_uri: a_source_uri /= Void -- and then ... for now - is a relative file uri - TODO
		local
			input_stream: KL_TEXT_INPUT_FILE
		do
			create input_stream.make (a_source_uri)
			input_stream.open_read
			if input_stream.is_open_read then
				parser.parse_from_stream (input_stream)
				if tree_pipe.error.has_error then
					was_build_error := True
					internal_error_message := tree_pipe.error.last_error
				else
					context_node := tree_pipe.document
					document := context_node.document_root
					create {XM_XPATH_STAND_ALONE_CONTEXT} static_context.make (document.name_pool, True) -- TODO - make warnings a parameter?
				end
			else
				was_build_error := True
				internal_error_message := "Failed to open input source"
			end
		ensure
			built: not was_build_error implies static_context /= Void and then document /= Void and then context_node /= Void
		end

	set_static_context (a_static_context: XM_XPATH_STATIC_CONTEXT) is
			-- Set the static context for compiling XPath expressions.
			-- This provides control over the environment in which the expression is compiled.
			-- For example it allows namespace prefixes to be declared,
			--  variables to be bound and functions to be defined.
			-- For most purposes, the static* context can be defined
			--  by providing and tailoring an instance of `XM_XPATH_STAND_ALONE_CONTEXT'.
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_set: static_context = a_static_context
		end

	-- TODO: set_context_node

feature -- Evaluation

	evaluate (an_expression_text: STRING) is
			-- Evaluate `an_expression' against `context_node'.
		require
			expression_not_void: an_expression_text /= Void
			static_context_not_void: static_context /= Void
			context_node_not_void: context_node /= Void
		local
			an_expression: XM_XPATH_EXPRESSION
			a_controller: XM_XPATH_CONTROLLER
			a_context: XM_XPATH_CONTEXT
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_expression := Expression_factory.make_expression (an_expression_text, static_context)
			if an_expression = Void then
				is_evaluation_in_error := True
				internal_error_value := Expression_factory.error_value
			else
				an_expression.analyze (static_context)
				if an_expression.is_error then
					is_evaluation_in_error := True
					internal_error_value := an_expression.last_error
				else
					if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
					create a_controller
					a_context := a_controller.new_xpath_context
					a_sequence_iterator := an_expression.iterator (a_context)
					from
						a_sequence_iterator.start
						create evaluated_items.make
					until
						a_sequence_iterator.after
					loop
						evaluated_items.put_last (a_sequence_iterator.item_for_iteration)
						-- TODO: add check for evaluation error
						a_sequence_iterator.forth
					end
				end
			end
		ensure
			error_or_item_list: -- TODO
		end

feature {NONE} -- Implementation

	document: XM_XPATH_DOCUMENT
			-- Document node against which XPath is evaluated

	is_space_stripped: BOOLEAN
			-- Do we strip white space?

	make_parser is
		local
			entity_resolver: XM_FILE_EXTERNAL_RESOLVER
		do
			create entity_resolver.make
			create parser.make
			parser.set_resolver (entity_resolver)
			create tree_pipe.make
			parser.set_callbacks (tree_pipe.start)
			parser.set_dtd_callbacks (tree_pipe.emitter)
			parser.set_string_mode_mixed -- do we want to make this a parameter?
		end

	internal_error_message: STRING
			-- Error message from `build_context'

	internal_error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to `evaluate'

	parser: XM_EIFFEL_PARSER
			-- Gobo XML parser

	tree_pipe: XM_XPATH_TINYTREE_CALLBACKS_PIPE
			-- Tree builder

invariant

				build_error_implies_error_message: was_build_error implies error_message /= Void

end
