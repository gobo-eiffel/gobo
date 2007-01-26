indexing

	description:

		"Objects that maintain template-matching rules (one set for each mode)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RULE_MANAGER

inherit

	XM_XSLT_MODE_CONSTANTS

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create mode_for_default_mode.make
			create mode_map.make_map (5)
			create priority_ranks.make_equal
		end

feature -- Access

	mode_fingerprints: DS_LINKED_LIST [INTEGER] is
			-- Fingerprints of non-default modes
		local
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_MODE, INTEGER]
		do
			create Result.make
			l_cursor := mode_map.new_cursor
			from l_cursor.start until l_cursor.after loop
				Result.put_last (l_cursor.key)
				l_cursor.forth
			end
		ensure
			result_not_void: result /= Void
			correct_count: Result.count = mode_map.count
		end

	mode (a_mode_name_code: INTEGER): XM_XSLT_MODE is
			-- Mode corresponding to `a_mode_name_code:'
		require
			mode_registered: is_mode_registered (a_mode_name_code)
		local
			a_node_key: INTEGER
		do
			if a_mode_name_code = Default_mode then
				Result := mode_for_default_mode
			elseif a_mode_name_code = All_modes then
				Result := omni_mode
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)
				Result := mode_map.item (a_node_key)
			end
		ensure
			mode_not_void: Result /= Void
		end

	last_found_template: XM_XSLT_COMPILED_TEMPLATE
			-- Last template found by `find_template_rule' or `find_imported_template_rule' or `find_next_match_handler'

	find_template_rule (a_node: XM_XPATH_NODE; a_mode: XM_XSLT_MODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Template rule registered for a particular node in a specific mode.
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			mode_to_use: XM_XSLT_MODE
			a_rule_value: XM_XSLT_RULE_VALUE
		do
			last_found_template := Void
			if a_mode = Void then
				mode_to_use := mode_for_default_mode
			else
				mode_to_use := a_mode
			end
			debug ("XSLT template rules")
				std.error.put_string ("Looking for a rule to match ")
				if a_node.parent = Void then
					std.error.put_string (" parentless node ")
					std.error.put_string (a_node.node_name)
				else
					std.error.put_string (a_node.parent.node_name)
					std.error.put_string ("/")
					std.error.put_string (a_node.node_name)
				end
				std.error.put_string (", with fingerprint of ")
				std.error.put_string (a_node.fingerprint.out)
				std.error.put_new_line
			end
			mode_to_use.match_rule (a_node, a_context)
			a_rule_value := mode_to_use.last_matched_rule
			if a_rule_value /= Void and not a_context.transformer.is_error then
				debug ("XSLT template rules")
					std.error.put_string ("Found a match%N")
				end
				check
					template_rule: a_rule_value.is_template
					-- Rule manager is only used with template rules
				end
				last_found_template := a_rule_value.as_template
			end
		end

	find_imported_template_rule (a_node: XM_XPATH_NODE; a_mode: XM_XSLT_MODE; a_minimum_precedence, a_maximum_precedence: INTEGER;  a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Template rule registered for a particular node in a specific mode, within a given precedence range.
			-- (Used to support xsl:apply-imports.)
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			mode_to_use: XM_XSLT_MODE
			a_rule_value: XM_XSLT_RULE_VALUE
		do
			last_found_template := Void
			if a_mode = Void then
				mode_to_use := mode_for_default_mode
			else
				mode_to_use := a_mode
			end
			mode_to_use.match_imported_rule (a_node, a_minimum_precedence, a_maximum_precedence, a_context)
			a_rule_value := mode_to_use.last_matched_rule
			if a_rule_value /= Void and not a_context.transformer.is_error then
				check
					template_rule: a_rule_value.is_template
					-- Rule manager is only used with template rules
				end
				last_found_template := a_rule_value.as_template
			end
		end

	find_next_match_handler (a_node: XM_XPATH_NODE; a_mode: XM_XSLT_MODE; a_current_template: XM_XSLT_COMPILED_TEMPLATE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Next template rule registered for a particular node in a specific mode, following `a_current_template'
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
			current_template_not_void: a_current_template /= Void
		local
			mode_to_use: XM_XSLT_MODE
			a_rule_value: XM_XSLT_RULE_VALUE
		do
			last_found_template := Void
			if a_mode = Void then
				mode_to_use := mode_for_default_mode
			else
				mode_to_use := a_mode
			end
			mode_to_use.match_next_rule (a_node, a_current_template, a_context)
			a_rule_value := mode_to_use.last_matched_rule
			if a_rule_value /= Void and not a_context.transformer.is_error then
				check
					template_rule: a_rule_value.is_template
					-- Rule manager is only used with template rules
				end
				last_found_template := a_rule_value.as_template
			end
		end

feature -- Status report
	
	is_mode_registered (a_mode_name_code: INTEGER): BOOLEAN is
			-- Is a mode registered for `a_mode_name_code'?
		local
			a_node_key: INTEGER		
		do
			if a_mode_name_code = Default_mode then
				Result := True
			elseif a_mode_name_code = All_modes then
				Result := omni_mode /= Void
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)
				Result := mode_map.has (a_node_key)
			end
		end

feature -- Element change

	register_mode (a_mode_name_code: INTEGER) is
			-- Register a mode for `a_mode_name_code'.
		require
			mode_not_registered: not is_mode_registered (a_mode_name_code)
		local
			a_node_key: INTEGER
			a_mode: XM_XSLT_MODE
		do
			if a_mode_name_code = All_modes then
				create omni_mode.make
				omni_mode.set_name ("#all")
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)

				-- When creating a specific mode, copy all the rules currently held
            --  in `omni_mode', as these apply to all modes

				if omni_mode /= Void then
					create a_mode.make_with_copy (omni_mode)
				else
					create a_mode.make
				end
				if a_mode_name_code /= Default_mode then
					a_mode.set_name (shared_name_pool.display_name_from_name_code (a_mode_name_code))
				end
				mode_map.force (a_mode, a_node_key)
				debug ("XSLT template rules")
					std.error.put_string ("Registered mode ")
					std.error.put_string (a_mode.name)
					std.error.put_new_line
				end
			end
		ensure
			mode_registered: is_mode_registered (a_mode_name_code)
		end

	set_handler_with_default_priority (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_mode: XM_XSLT_MODE; a_precedence: INTEGER) is
			-- Set handler for `a_pattern' using it's default priority.
		require
			pattern_not_void: a_pattern /= Void
			handler_not_void: a_handler /= Void and then a_handler.is_template
			mode_not_void: a_mode /= Void
		local
			a_union_pattern: XM_XSLT_UNION_PATTERN
		do

			-- For a union pattern, register the parts separately

			a_union_pattern ?= a_pattern
			if a_union_pattern /= Void then
				set_handler_with_default_priority (a_union_pattern.left_hand_side, a_handler, a_mode, a_precedence)
				set_handler_with_default_priority (a_union_pattern.right_hand_side, a_handler, a_mode, a_precedence)
			else
				set_handler (a_pattern, a_handler, a_mode, a_precedence, a_pattern.default_priority)
			end
		end
				
	set_handler (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_mode: XM_XSLT_MODE; a_precedence: INTEGER; a_priority: MA_DECIMAL) is
			-- Set handler for `a_pattern'.
		require
			pattern_not_void: a_pattern /= Void
			is_template_handler: a_handler /= Void and then a_handler.is_template
			mode_not_void: a_mode /= Void
			priority_not_void: a_priority /= Void
		local
			a_union_pattern: XM_XSLT_UNION_PATTERN
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_MODE, INTEGER]
		do

			-- For a union pattern, register the parts separately

			a_union_pattern ?= a_pattern
			if a_union_pattern /= Void then
				set_handler (a_union_pattern.left_hand_side, a_handler, a_mode, a_precedence, a_priority)
				set_handler (a_union_pattern.right_hand_side, a_handler, a_mode, a_precedence, a_priority)
			else
				a_mode.add_rule (a_pattern, a_handler, a_precedence, a_priority)
				rank_priority (a_priority)

				-- If adding a rule to the omni_mode (mode='all'),
				--  then add it to all the other modes as well

				if a_mode = omni_mode then
					mode_for_default_mode.add_rule (a_pattern, a_handler,  a_precedence, a_priority)

					from
						a_cursor := mode_map.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						a_cursor.item.add_rule (a_pattern, a_handler,  a_precedence, a_priority)
						a_cursor.forth
					end
				end
			end
		end

	rank_all_rules is
			-- Set `priority_rank' for every rule in every mode.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_MODE, INTEGER]
		do
			rank_mode (mode_for_default_mode)
			if omni_mode /= Void then rank_mode (omni_mode) end
			from
				a_cursor := mode_map.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				rank_mode (a_cursor.item)
				a_cursor.forth
			end
		end

	rank_mode (a_mode: XM_XSLT_MODE) is
			-- Set `priority_rank' for every rule in `a_mode'
		require
			mode_not_void: a_mode /= Void
		local
			an_index: INTEGER
			a_rule: XM_XSLT_RULE
			a_priority: MA_DECIMAL
		do
			from
				an_index := a_mode.rule_dictionary.lower
			variant
				a_mode.rule_dictionary.count + 1 - an_index
			until
				an_index > a_mode.rule_dictionary.upper
			loop
				a_rule := a_mode.rule_dictionary.item (an_index)
				from
				until
					a_rule = Void
				loop
					a_priority := a_rule.priority
					priority_ranks.start
					priority_ranks.search_forth (a_priority)
					check
						priority_found: not priority_ranks.off
						-- `set_handler' always calls `rank_priority' to guarantee this
					end
					a_rule.set_priority_rank (priority_ranks.index)
					a_rule := a_rule.next_rule
				end
				an_index := an_index + 1
			end
		end

feature {NONE} -- Implementation

	mode_for_default_mode: XM_XSLT_MODE
			-- Mode for node handlers with default mode

	omni_mode: XM_XSLT_MODE
			-- Mode for node handlers that specify mode="all"

	mode_map: DS_HASH_TABLE [XM_XSLT_MODE, INTEGER]
			-- Map of fingerprints to non-default modes

	priority_ranks: DS_LINKED_LIST [MA_DECIMAL]
			-- Rule priorities sorted in increasing order;
			-- Hence, a rule's priority_rank is the position of it's priority within this list

	rank_priority (a_priority: MA_DECIMAL) is
			-- Rank `a_priority' by inserting it into `priority_ranks' maintaining an ascending order.
		require
			priority_not_void: a_priority /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [MA_DECIMAL]
			found: BOOLEAN
			a_decimal: MA_DECIMAL
		do
			from
				a_cursor := priority_ranks.new_cursor; a_cursor.start
			variant
				priority_ranks.count + 1 - a_cursor.index
			until
				found or else a_cursor.after
			loop
				a_decimal := a_cursor.item
				if a_decimal.is_equal (a_priority) then
					found := True
				elseif a_decimal > a_priority then
					found := True
					a_cursor.put_left (a_priority)
				end
				a_cursor.forth
			end
			if not found then
				priority_ranks.put_last (a_priority)
			end
		ensure
			priority_present: priority_ranks.has (a_priority)
		end

invariant

	mode_map_not_void: mode_map /= Void
	default_mode_not_void: mode_for_default_mode /= Void
	priority_ranks_not_void: priority_ranks /= Void

end
	
