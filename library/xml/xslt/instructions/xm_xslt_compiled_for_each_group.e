indexing

	description: "Objects that represent an xsl:for-each-group,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_FOR_EACH_GROUP

inherit
	
	XM_XSLT_INSTRUCTION

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

creation

	make, make_with_pattern

feature {NONE} -- Initialization

	make (a_select_expression, a_key_expression: XM_XPATH_EXPRESSION; an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]; a_collation_name: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			key_expression_not_void: a_key_expression /= Void
			expression_algorithm: an_algorithm = Group_by_algorithm  or an_algorithm = Group_adjacent_algorithm
			sort_keys: some_sort_keys /= Void
		do
			select_expression := a_select_expression
			key_expression := a_key_expression
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			collation_name := a_collation_name
			instruction_name := "for-each-group"
			create children.make (0)
		ensure
			select_expression_set: select_expression = a_select_expression
			key_expression_set: key_expression = a_key_expression
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
			collation_name_set: collation_name = a_collation_name
		end

	make_with_pattern (a_select_expression: XM_XPATH_EXPRESSION; a_key_pattern: XM_XSLT_PATTERN; an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			key_pattern_not_void: a_key_pattern /= Void
			pattern_algorithm: an_algorithm = Group_starting_with_algorithm  or an_algorithm = Group_ending_with_algorithm
			sort_keys: some_sort_keys /= Void
		do
			select_expression := a_select_expression
			key_pattern := a_key_pattern
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			instruction_name := "for-each-group"
			create children.make (0)
		ensure
			select_expression_set: select_expression = a_select_expression
			key_pattern_set: key_pattern = a_key_pattern
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {NONE} -- Implementation

	algorithm: INTEGER
			-- Grouping algoritm

	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

	key_expression: XM_XPATH_EXPRESSION
			-- Key for Group_by or Group_adjacent

	key_pattern: XM_XSLT_PATTERN
			-- Key for Group_starting/ending_with

	sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			--Sort keys

	collation_name: XM_XPATH_EXPRESSION
			-- Collation name

invariant

	select_expression_not_void: select_expression /= Void
	key: key_expression /= Void xor key_pattern /= Void
	sort_keys: sort_keys /= Void
	algorithm: algorithm >= Group_by_algorithm and then algorithm <= Group_ending_with_algorithm
	collation: algorithm >= Group_starting_with_algorithm implies collation_name = Void

end
	
