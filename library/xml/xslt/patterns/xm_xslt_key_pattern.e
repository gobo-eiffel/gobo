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
			type_check
		end

creation

	make
	
feature {NONE} -- Initialization

	make (a_name_code: INTEGER; a_key: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			key_not_void: a_key /= Void
		do
			key_fingerprint := a_name_code \\ bits_20
			key_expression := a_key
		ensure
			key_set: key_expression = a_key
		end

feature -- Access

	key_fingerprint: INTEGER
			-- Name-pool fingerprint

	key_expression: XM_XPATH_EXPRESSION
			-- The expression

	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_ANY_NODE_TEST} Result.make
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Type-check the pattern;
		do
			key_expression.analyze (a_context)
			if key_expression.was_expression_replaced then
				key_expression := key_expression.replacement_expression
			end
			if key_expression.is_error then
				set_error_value (key_expression.error_value)
			end
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
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
				a_km := a_transformer.key_manager

				-- TODO: allow keys of any data type; atomize the supplied value

				an_iter := key_expression.iterator (a_transformer.new_xpath_context)

				from
						check
							before: an_iter.before
						end
					an_iter.forth
				until
					finished or else an_iter.after
				loop
					a_key := an_iter.item.string_value
					create a_key_value.make (a_key)
					nodes := a_km.sequence_by_key (key_fingerprint, a_doc, a_key_value, a_transformer)
					if not a_transformer.is_error then
						from
							check
								before: nodes.before
							end
							nodes.forth
						until
							finished or else nodes.after
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
			end
		end

feature {NONE} -- Implementation

	bits_20: INTEGER is 1048576 
			-- 0x0fffff

invariant

	key_expression_not_void: key_expression /= Void

end
	
