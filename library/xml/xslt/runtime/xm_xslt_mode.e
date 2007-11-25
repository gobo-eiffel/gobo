indexing

	description:

		"Objects that use a set of rules to implement an XSLT mode"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_MODE

inherit

	XM_XSLT_SHARED_NO_NODE_TEST
		export {NONE} all end

	MA_DECIMAL_CONSTANTS
		export {NONE} all end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XSLT_CONFIGURATION_CONSTANTS

create

	make, make_stripper, make_with_copy

feature {NONE} -- Initialization

	make is
			-- Create default rules.
		do
			create rule_dictionary.make (1, Number_of_buckets + Document_node + 1)
		end


	make_stripper is
			-- Create mode for stripper rules.
		do
			make
			is_stripper := True
		end

	make_with_copy (other: XM_XSLT_MODE) is
			-- Create by copying rules from `other'.
		require
			other_mode_not_void: other /= Void
		local
			an_index: INTEGER
			a_rule, a_new_rule: XM_XSLT_RULE
			a_rule_dictionary: ARRAY [XM_XSLT_RULE]
		do
			create rule_dictionary.make (1, Number_of_buckets + Document_node + 1)
			from
				a_rule_dictionary := other.rule_dictionary
				an_index := 1
			variant
				a_rule_dictionary.count + 1 - an_index
			until
				an_index > a_rule_dictionary.count
			loop
				a_rule := a_rule_dictionary.item (an_index)
				if a_rule /= Void then
					create a_new_rule.make_with_copy (a_rule)
					rule_dictionary.put (a_new_rule, an_index)
				end
				an_index := an_index +1
			end
			most_recent_rule := other.most_recent_rule
		end

feature -- Access

	last_matched_rule: XM_XSLT_RULE
			-- Result of last call to `match_rule' or `match_imported_rule' or `match_next_rule'

	match_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Find handler for `a_node'
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			l_key, l_specific_precedence: INTEGER
			l_rule, l_specific_rule: XM_XSLT_RULE
			l_specific_priority: INTEGER
			l_finished: BOOLEAN
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_matched_rule := Void
			l_new_context := possible_new_context (a_context)
			l_key := rule_key (a_node.fingerprint, a_node.node_type)
			l_specific_precedence := -1
			l_specific_priority := -1

			-- Search the specific list for this node type / node name.

			if l_key /= Any_node + 1 then
				from
					l_rule := rule_dictionary.item (l_key)
				until
					l_finished or else l_rule = Void
				loop

					-- If we already have a match, and the precedence or priority of this
            	--  rule is lower, quit the search for a second match.

					if l_specific_rule /= Void and then (l_rule.precedence  < l_specific_precedence or else
						(l_rule.precedence = l_specific_precedence and then l_rule.priority_rank < l_specific_priority)) then
							l_finished := True
					else
						l_rule.pattern.match (a_node, l_new_context.new_pattern_context)
						if l_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
						elseif l_rule.pattern.last_match_result then
														
							-- Is this a second match?

							if l_specific_rule /= Void then
								if l_rule.precedence = l_specific_precedence and then l_rule.priority_rank = l_specific_priority then
									report_ambiguity (a_node, l_specific_rule, l_rule, l_new_context.transformer)
									l_finished := True
								end
							end
							l_specific_rule := l_rule
							l_specific_precedence := l_rule.precedence
							l_specific_priority := l_rule.priority_rank
							if l_new_context.transformer.recovery_policy = Recover_silently then
								l_finished := True -- Find the first; they are in priority order.
							end
						end
						l_rule := l_rule.next_rule
					end
				end
			end	
			-- Search the general list.
			if not l_new_context.transformer.is_error then
				match_general_rule (a_node, l_new_context, l_specific_rule, l_specific_precedence, l_specific_priority)
			end
		ensure
			Maybe_no_rule_matches: last_matched_rule = Void xor last_matched_rule /= Void
		end

	match_imported_rule (a_node: XM_XPATH_NODE; a_minimum_precedence, a_maximum_precedence: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Find handler for `a_node' within specified precedence range
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			l_key: INTEGER
			l_rule, l_specific_rule, a_general_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
		do
			last_matched_rule := Void
			l_key := rule_key (a_node.fingerprint, a_node.node_type)

			-- Search the specific list for this node type / node name.

			if l_key /= Any_node + 1 then
				from
					l_rule := rule_dictionary.item (l_key)
				until
					l_finished or else l_rule = Void
				loop
					if l_rule.precedence >= a_minimum_precedence and then l_rule.precedence <= a_maximum_precedence then
						l_rule.pattern.match (a_node, a_context.new_pattern_context)
						if l_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
							l_finished := True
						elseif l_rule.pattern.last_match_result then
							l_specific_rule := l_rule

							-- Find the first; they are in priority order.

							l_finished := True
						else
							l_rule := l_rule.next_rule
						end
					else
						l_rule := l_rule.next_rule
					end
				end
			end

			-- Search the general list.

			if not a_context.transformer.is_error then
				from
					l_finished := False
					l_rule := rule_dictionary.item (Any_node + 1)
				until
					l_finished or else l_rule = Void
				loop
					if l_rule.precedence >= a_minimum_precedence and then l_rule.precedence <= a_maximum_precedence then
						l_rule.pattern.match (a_node, a_context.new_pattern_context)
						if l_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
							l_finished := True
						elseif l_rule.pattern.last_match_result then
							a_general_rule := l_rule
							
							-- Find the first; they are in priority order.
							
							l_finished := True
						else
							l_rule := l_rule.next_rule
						end
					else
						l_rule := l_rule.next_rule
					end
				end

				if l_specific_rule /= Void and then a_general_rule = Void then
					last_matched_rule := l_specific_rule
				elseif l_specific_rule = Void and then a_general_rule /= Void then
					last_matched_rule := a_general_rule
				elseif l_specific_rule /= Void and then a_general_rule /= Void then
					if l_specific_rule.precedence > a_general_rule.precedence or else
						(l_specific_rule.precedence = a_general_rule.precedence and then
						 l_specific_rule.priority_rank > a_general_rule.priority_rank) then
						last_matched_rule := l_specific_rule
					else
						last_matched_rule := a_general_rule
					end
				end
			end
		ensure
			Maybe_no_rule_matches: True
		end

	match_next_rule (a_node: XM_XPATH_NODE; a_current_rule: XM_XSLT_RULE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Find handler for `a_node' within specified precedence range
		require
			a_node_not_void: a_node /= Void
			a_context_not_void: a_context /= Void
			a_current_rule_not_void: a_current_rule /= Void
		local
			l_key: INTEGER
			l_rule, l_specific_rule, l_general_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
			l_specific_precedence: INTEGER
			l_specific_priority: INTEGER
		do
			last_matched_rule := Void
			l_key := rule_key (a_node.fingerprint, a_node.node_type)
			l_specific_precedence := -1
			l_specific_priority := Platform.Minimum_integer
			-- First search the specific list.
			if l_key /= Any_node + 1 then
				from
					l_rule := rule_dictionary.item (l_key)
				until
					l_finished or l_rule = Void
				loop
					-- skip the current template - we want the next match
					if l_rule /= a_current_rule then
						-- skip the rule unles it's a later match than current template
						if l_rule.precedence > a_current_rule.precedence or
							(l_rule.precedence = a_current_rule.precedence and
								(l_rule.priority_rank > a_current_rule.priority_rank or
									(l_rule.priority_rank = a_current_rule.priority_rank and l_rule.sequence_number >= a_current_rule.sequence_number)
								)
							) then
							-- skip
						else
							-- quit searching when finding second match
							if l_specific_rule /= Void then
								if l_rule.precedence < l_specific_precedence or
									(l_rule.precedence = l_specific_precedence and l_rule.priority_rank < l_specific_priority) then
									l_finished := True
								end
							end
							if not l_finished then
								l_rule.pattern.match (a_node, a_context.new_pattern_context)
								if l_rule.pattern.is_error then
									a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
									l_finished := True
								elseif l_rule.pattern.last_match_result then
									-- is this a second match?
									if l_specific_rule /= Void then
										if l_rule.precedence = l_specific_precedence and l_rule.priority_rank = l_specific_priority then
											report_ambiguity (a_node, l_specific_rule, l_rule, a_context.transformer)
										end
										l_finished := True
									end
									l_specific_rule := l_rule
									l_specific_precedence := l_rule.precedence
									l_specific_priority := l_rule.priority_rank
									if a_context.transformer.recovery_policy = Recover_silently then
										l_finished := True
									end 
								end
							end
						end
					end
					l_rule := l_rule.next_rule
				end
			end

			from
				l_finished := False
				l_rule := rule_dictionary.item (Any_node + 1)
			until
				l_finished or l_rule = Void
			loop
				-- skip the current template - we want the next match
				if l_rule /= a_current_rule then
					-- skip the rule unless it's a later match than current template
					if l_rule.precedence > a_current_rule.precedence or
						(l_rule.precedence = a_current_rule.precedence and
							(l_rule.priority_rank > a_current_rule.priority_rank or
								(l_rule.priority_rank = a_current_rule.priority_rank and l_rule.sequence_number >= a_current_rule.sequence_number)
							)
						) then
						-- skip
					else
						if l_rule.precedence < l_specific_precedence or
							(l_rule.precedence = l_specific_precedence and l_rule.priority_rank < l_specific_priority) then
							l_finished := True
						end
						if not l_finished then
							l_rule.pattern.match (a_node, a_context.new_pattern_context)
							if l_rule.pattern.is_error then
								a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
								l_finished := True
							elseif l_rule.pattern.last_match_result then
								-- is this a second match?
								if l_general_rule /= Void then
									if l_rule.precedence = l_general_rule.precedence and l_rule.priority_rank = l_general_rule.priority_rank then
										report_ambiguity (a_node, l_general_rule, l_rule, a_context.transformer)
									end
									l_finished := True
								else
									l_general_rule := l_rule
									if a_context.transformer.recovery_policy = Recover_silently then
										l_finished := True
									end
								end
							end
						end
					end
				end
				l_rule := l_rule.next_rule
			end
			last_matched_rule := general_or_specific_rule (a_node, a_context, l_specific_rule, l_general_rule)
		ensure
			Maybe_no_rule_matches: True
		end
			
	name: STRING is
			-- Name
		do
			if internal_name = Void then
				Result := "#default"
			else
				Result := internal_name
			end
		ensure
			name_not_void: Result /= Void
		end

feature -- Status report

	is_default_mode: BOOLEAN is
			-- Is `Current' the default mode?
		do
			Result := internal_name = Void
		end

	is_stripper: BOOLEAN
			-- Is `Current' being used for the space stripper?

feature -- Element change

	set_name (a_name: STRING) is
			-- Set name.
		require
			name_not_void: a_name /= Void
		do
			internal_name := a_name
		ensure
			name_set: internal_name = a_name
		end

	add_rule (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_precedence: INTEGER; a_priority: MA_DECIMAL) is
			-- Add a rule to handle `a_pattern'.
		require
			pattern_not_void: a_pattern /= Void
			handler_not_void: a_handler /= Void
		local
			l_key, l_sequence_number: INTEGER
			l_rule, l_new_rule, l_previous_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
		do

			-- Ignore a pattern that will never match, e.g. "@comment"

			if a_pattern /= xslt_empty_item then

				-- For fast lookup, we maintain one list for each element name for patterns that can only
				--  match elements of a given name, one list for each node type for patterns that can only
				--  match one kind of non-element node, and one generic list.
				-- Each list is sorted in precedence/priority order so we find the highest-priority rule first

				l_key := rule_key (a_pattern.fingerprint, a_pattern.node_kind)
				
				-- This logic is designed to ensure that when a union pattern contains multiple branches
				-- with the same priority, next-match doesn't select the same template twice (override20_047/_048)

				if most_recent_rule /= Void then
					if a_handler = most_recent_rule.handler then
						l_sequence_number := most_recent_rule.sequence_number
					else
						l_sequence_number := most_recent_rule.sequence_number + 1
					end
				end
				create l_new_rule.make (a_pattern, a_handler, a_precedence, a_priority, l_sequence_number)
				most_recent_rule := l_new_rule
				l_rule := rule_dictionary.item (l_key)
				if l_rule = Void then
					rule_dictionary.put (l_new_rule, l_key)
				else

					-- Insert the new rule into this list before others of the same precedence/priority

					from
						l_previous_rule := Void
					until
						l_finished or else l_rule = Void
					loop
						if l_rule.precedence < a_precedence or else
							(l_rule.precedence = a_precedence and then l_rule.priority <= a_priority) then
							l_new_rule.set_next_rule (l_rule)
							if l_previous_rule = Void then
								rule_dictionary.put (l_new_rule, l_key)
							else
								l_previous_rule.set_next_rule (l_new_rule)
							end
							l_finished := True
						else
							l_previous_rule := l_rule
							l_rule := l_rule.next_rule
						end
					end

					if l_rule = Void then
						l_previous_rule.set_next_rule (l_new_rule)
						l_new_rule.set_next_rule (Void)
					end
				end
			end
		end

feature {XM_XSLT_MODE, XM_XSLT_RULE_MANAGER} -- Restricted
	
	rule_dictionary: ARRAY [XM_XSLT_RULE]
			-- Rule dictionary

feature {XM_XSLT_MODE} -- Local

	most_recent_rule: XM_XSLT_RULE
			-- Rule most recently added to `Current'

feature {NONE} -- Implementation

	Number_of_buckets: INTEGER is 101
			-- Hash factor

	internal_name: STRING
			-- Mode name

	rule_key (a_fingerprint, a_node_kind: INTEGER): INTEGER is
			-- Rule dictionary index
		do
			if a_node_kind = Element_node then
				if a_fingerprint = - 1 then
					Result := Any_node + 1 -- the generic list
				else
					Result := Document_node + (a_fingerprint \\ Number_of_buckets) + 1
				end
			else
				Result := a_node_kind + 1
			end
		end

	report_ambiguity (a_node: XM_XPATH_NODE; a_rule, another_rule: XM_XSLT_RULE; a_transformer: XM_XSLT_TRANSFORMER)	is
			-- Report an ambiguity;
			--  that is, the situation where two rules of the same
			--  precedence and priority match the same node.
		require
			node_not_void: a_node /= Void
			transformer_not_void: a_transformer /= Void
			rules_not_void: a_rule /= Void and then another_rule /= Void
		local
			a_pattern, another_pattern: XM_XSLT_PATTERN
			a_message, l_path, l_code: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do

			-- Don't report an error if the conflict is between two branches of the same.union pattern,
			--  or two strip-space or two preserve-space rules.

			if is_stripper and a_rule.handler.as_boolean = another_rule.handler.as_boolean then
				-- no ambiguity - either rule will do
			elseif a_rule.handler /= another_rule.handler then
				a_pattern := a_rule.pattern
				another_pattern := another_rule.pattern
				if is_stripper then
					l_path := "xsl:strip-space"
				else
					l_path := a_node.path
				end
				a_message := STRING_.concat ("Ambiguous rule match for ", l_path)
				a_message := STRING_.appended_string (a_message, "%NMatches both %"")
				a_message := STRING_.appended_string (a_message, a_pattern.original_text)
				a_message := STRING_.appended_string (a_message, " on line ")
				a_message := STRING_.appended_string (a_message, a_pattern.line_number.out)
				a_message := STRING_.appended_string (a_message, " of ")
				a_message := STRING_.appended_string (a_message, a_pattern.system_id)
				a_message := STRING_.appended_string (a_message, "%Nand %"")
				a_message := STRING_.appended_string (a_message, another_pattern.original_text)
				a_message := STRING_.appended_string (a_message, " on line ")
				a_message := STRING_.appended_string (a_message, another_pattern.line_number.out)
				a_message := STRING_.appended_string (a_message, " of ")
				a_message := STRING_.appended_string (a_message, another_pattern.system_id)
				if is_stripper then
					l_code := "XTRE0270"
				else
					l_code := "XTRE0540"
				end
				create an_error.make_from_string (a_message, Xpath_errors_uri, l_code, Dynamic_error)
				a_transformer.report_recoverable_error (an_error)
			end
		end

	match_general_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT; a_specific_rule: XM_XSLT_RULE; a_specific_precedence: INTEGER; a_specific_priority: INTEGER) is
			-- Find rule on general list
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			l_rule, l_general_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
		do
			from
				l_rule := rule_dictionary.item (Any_node + 1)
			until
				l_finished or else l_rule = Void
			loop
				if l_rule.precedence < a_specific_precedence or else
					(l_rule.precedence = a_specific_precedence and then l_rule.priority_rank < a_specific_priority) then

					-- no point in looking at a lower priority rule than the one we've got

					l_finished := True
				else
					l_rule.pattern.match (a_node, a_context.new_pattern_context)
					if l_rule.pattern.is_error then
						a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
						l_finished := True
					elseif l_rule.pattern.last_match_result then
						
						-- Is it a second match?

						if l_general_rule /= Void then
							if l_rule.precedence = l_general_rule.precedence and then l_rule.priority_rank = l_general_rule.priority_rank then
								report_ambiguity (a_node, l_rule, l_general_rule, a_context.transformer)
								l_finished := True
							end
						else
							l_general_rule := l_rule
							if a_context.transformer.recovery_policy = Recover_silently then l_finished := True end 
						end
					end
				end
				l_rule := l_rule.next_rule
			end
			if not a_context.transformer.is_error then
				last_matched_rule := general_or_specific_rule (a_node, a_context, a_specific_rule, l_general_rule)
			end
		ensure
			Maybe_no_rule_matches: True
		end

	general_or_specific_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT; a_specific_rule, a_general_rule: XM_XSLT_RULE): XM_XSLT_RULE is
			-- Chosen rule between `a_specific_rule' and `a_general_rule'
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		do
			if a_specific_rule /= Void and then a_general_rule = Void then
				Result := a_specific_rule
			elseif a_specific_rule = Void and then a_general_rule /= Void then
				Result := a_general_rule
			elseif a_specific_rule /= Void and then a_general_rule /= Void then
				if a_specific_rule.precedence = a_general_rule.precedence and then
					a_specific_rule.priority_rank = a_general_rule.priority_rank then
					-- This situation is exceptional: we have a "specific" pattern and
					-- a "general" pattern with the same priority. We have to select
					-- the one that was added last.
					if a_specific_rule.sequence_number > a_general_rule.sequence_number then
						Result := a_specific_rule
					else
						Result := a_general_rule
					end
					if a_context.transformer.recovery_policy /= Recover_silently then
						report_ambiguity (a_node, a_specific_rule, a_general_rule, a_context.transformer)
					end
				elseif a_specific_rule.precedence > a_general_rule.precedence or
					(a_specific_rule.precedence = a_general_rule.precedence and then a_specific_rule.priority_rank >= a_general_rule.priority_rank) then
					Result := a_specific_rule
				else
					Result := a_general_rule
				end
			else
				Result := Void
			end
		ensure
			Maybe_no_rule_matches: True
		end
	
	possible_new_context (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XSLT_EVALUATION_CONTEXT is
			-- New context, if any pattern might use local variables
		require
			major_context_not_void: a_context /= Void and then not a_context.is_minor
		local
			pattern_slots: INTEGER
		do
			pattern_slots := a_context.transformer.executable.largest_pattern_stack_frame
			if pattern_slots > 0 then
				Result := a_context.new_context
				Result.open_sized_stack_frame (pattern_slots)
			else
				Result := a_context
			end
		ensure
			context_not_void: Result /= Void
		end

invariant

	rule_dictionary_not_void: rule_dictionary /= Void

end
	
