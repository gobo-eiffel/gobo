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

	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			create {XM_XSLT_ANY_NODE_TEST} Result.make
		end

feature -- Analysis

	type_check (context: XM_XPATH_STATIC_CONTEXT): XM_XSLT_PATTERN is
			-- Type-check the pattern;
		local
			key_pattern: XM_XSLT_KEY_PATTERN
		do
			key_pattern := clone (Current)
			key_pattern.set_expression (key_expression.analyze (context))
			Result := key_pattern
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		local
			doc: XM_XPATH_DOCUMENT
			key_value: XM_XPATH_STRING_VALUE
			key: STRING
			km: XM_XSLT_KEY_MANAGER
			finished: BOOLEAN
			iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			nodes: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			doc := a_node.document_root
			if doc = Void then
				Result := False
			else
				km := a_controller.key_manager

				-- TODO: allow keys of any data type; atomize the supplied value

				iter := key_expression.iterator (a_controller.new_xpath_context)

				from
						check
							before: iter.before
						end
					iter.forth
				until
					finished or else iter.after
				loop
					key := iter.item_for_iteration.string_value
					create key_value.make (key)
					nodes := km.select_by_key (key_fingerprint, doc, key_value, a_controller)
					from
							check
								before: nodes.before
							end
						nodes.forth
					until
						finished or else nodes.after
					loop
						if nodes.item_for_iteration.is_same_node (a_node) then
							Result := True
							finished := True
						end
						nodes.forth
					end
					iter.forth
				end
			end
		end

feature {XM_XSLT_KEY_PATTERN} -- Implementation

	set_expression (exp: XM_XPATH_EXPRESSION) is
			-- Set `id_expression'.
		require
			key_expression_not_void: exp /= Void
		do
			key_expression := exp
		ensure
			key_expression_set: key_expression = exp
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Name-pool fingerprint

	key_expression: XM_XPATH_EXPRESSION
			-- The expression

	bits_20: INTEGER is 1048576 
			-- 0x0fffff

invariant

	key_expression_not_void: key_expression /= Void

end
	
