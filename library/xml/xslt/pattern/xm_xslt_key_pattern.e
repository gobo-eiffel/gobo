indexing

	description:

		"XSLT key patterns (of the form key(key-name, key-value))"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_PATTERN

inherit

	XM_XSLT_PATTERN
		redefine
			type_check, sub_expressions
		end

	XM_XPATH_NAME_UTILITIES

create

	make
	
feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_name_code: INTEGER; a_key: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			key_not_void: a_key /= Void
			static_context_not_void: a_static_context /= Void
		do
			key_fingerprint := fingerprint_from_name_code (a_name_code)
			key_expression := a_key
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			key_set: key_expression = a_key
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

feature -- Access

	key_fingerprint: INTEGER
			-- Name-pool fingerprint

	key_expression: XM_XPATH_EXPRESSION
			-- The expression

	original_text: STRING is
			-- Original text
		do
			Result :=  ("key()")
		end

	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_ANY_NODE_TEST} Result.make
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (key_expression, 1)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type-check the pattern;
		do
			key_expression.check_static_type (a_context, a_context_item_type)
			if key_expression.was_expression_replaced then
				key_expression := key_expression.replacement_expression
			end
			if key_expression.is_error then
				set_error_value (key_expression.error_value)
			end
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- TODO: This function is not 100% pure, as it may cause
			--  an index to be built for a key, but this is only a 
			--  performance-affecting side effect.
			-- In addition, an iterator is created over `key_expression',
			--  and this might uncover an error.
		local
			a_doc: XM_XPATH_DOCUMENT
			a_key_value: XM_XPATH_STRING_VALUE
			a_key: STRING
			a_km: XM_XSLT_KEY_MANAGER
			finished: BOOLEAN
			an_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			nodes: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			a_doc := a_node.document_root
			if a_doc = Void then
				Result := False
			else
				a_km := a_context.transformer.key_manager
				key_expression.create_iterator (a_context)
				an_iter := key_expression.last_iterator
				if an_iter.is_error then
					set_error_value (an_iter.error_value)
				else
					from
						an_iter.start
					until
						finished or else an_iter.is_error or else an_iter.after
					loop
						a_key := an_iter.item.string_value
						create a_key_value.make (a_key)
						a_km.generate_keyed_sequence (key_fingerprint, a_doc, a_key_value, a_context)
						if not a_context.transformer.is_error then
							nodes := a_km.last_key_sequence
							from
								nodes.start
							until
								finished or else nodes.is_error or else nodes.after
							loop
								if nodes.item.is_same_node (a_node) then
									Result := True
									finished := True
								end
								nodes.forth
							end
						end
						an_iter.forth
					end
					if nodes.is_error then
						set_error_value (nodes.error_value)
					elseif an_iter.is_error then
						set_error_value (an_iter.error_value)
					end					
				end
			end
		end

invariant

	key_expression_not_void: key_expression /= Void

end
	
