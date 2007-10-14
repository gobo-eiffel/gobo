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
			sequence_number := other.sequence_number
		end

feature -- Access

	last_matched_rule: XM_XSLT_RULE_VALUE
			-- Result of last call to `match_rule' or `match_imported_rule' or `match_next_rule'

	match_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Find handler for `a_node'
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		local
			a_key, a_specific_precedence: INTEGER
			a_rule, a_specific_rule: XM_XSLT_RULE
			a_specific_priority: INTEGER
			finished: BOOLEAN
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_matched_rule := Void
			a_new_context := possible_new_context (a_context)
			a_key := rule_key (a_node.fingerprint, a_node.node_type)
			a_specific_precedence := -1
			a_specific_priority := -1

			-- Search the specific list for this node type / node name.

			if a_key /= Any_node + 1 then
				from
					a_rule := rule_dictionary.item (a_key)
				until
					finished or else a_rule = Void
				loop

					-- If we already have a match, and the precedence or priority of this
            	--  rule is lower, quit the search for a second match.

					if a_specific_rule /= Void and then (a_rule.precedence  < a_specific_precedence or else
						(a_rule.precedence = a_specific_precedence and then a_rule.priority_rank < a_specific_priority)) then
							finished := True
					else
						a_rule.pattern.match (a_node, a_new_context)
						if a_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (a_rule.pattern.error_value)
						elseif a_rule.pattern.last_match_result then
														
							-- Is this a second match?

							if a_specific_rule /= Void then
								if a_rule.precedence = a_specific_precedence and then a_rule.priority_rank.is_equal (a_specific_priority) then
									report_ambiguity (a_node, a_specific_rule, a_rule, a_new_context.transformer)
									finished := True
								end
							end
							a_specific_rule := a_rule
							a_specific_precedence := a_rule.precedence
							a_specific_priority := a_rule.priority_rank
							if a_new_context.transformer.recovery_policy = Recover_silently then
								finished := True -- Find the first; they are in priority order.
							end
						end
						a_rule := a_rule.next_rule
					end
				end

				-- Search the general list.

				if not a_new_context.transformer.is_error then
					match_general_rule (a_node, a_new_context, a_specific_rule, a_specific_precedence, a_specific_priority)
				end
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
			a_key: INTEGER
			a_rule, a_specific_rule, a_general_rule: XM_XSLT_RULE
			finished: BOOLEAN
		do
			last_matched_rule := Void
			a_key := rule_key (a_node.fingerprint, a_node.node_type)

			-- Search the specific list for this node type / node name.

			if a_key /= Any_node + 1 then
				from
					a_rule := rule_dictionary.item (a_key)
				until
					finished or else a_rule = Void
				loop
					if a_rule.precedence >= a_minimum_precedence and then a_rule.precedence <= a_maximum_precedence then
						a_rule.pattern.match (a_node, a_context)
						if a_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (a_rule.pattern.error_value)
							finished := True
						elseif a_rule.pattern.last_match_result then
							a_specific_rule := a_rule

							-- Find the first; they are in priority order.

							finished := True
						else
							a_rule := a_rule.next_rule
						end
					else
						a_rule := a_rule.next_rule
					end
				end
			end

			-- Search the general list.

			if not a_context.transformer.is_error then
				from
					finished := False
					a_rule := rule_dictionary.item (Any_node + 1)
				until
					finished or else a_rule = Void
				loop
					if a_rule.precedence >= a_minimum_precedence and then a_rule.precedence <= a_maximum_precedence then
						a_rule.pattern.match (a_node, a_context)
						if a_rule.pattern.is_error then
							a_context.transformer.report_recoverable_error (a_rule.pattern.error_value)
							finished := True
						elseif a_rule.pattern.last_match_result then
							a_general_rule := a_rule
							
							-- Find the first; they are in priority order.
							
							finished := True
						else
							a_rule := a_rule.next_rule
						end
					else
						a_rule := a_rule.next_rule
					end
				end

				if a_specific_rule /= Void and then a_general_rule = Void then
					last_matched_rule := a_specific_rule.handler
				elseif a_specific_rule = Void and then a_general_rule /= Void then
					last_matched_rule := a_general_rule.handler
				elseif a_specific_rule /= Void and then a_general_rule /= Void then
					if a_specific_rule.precedence > a_general_rule.precedence or else
						(a_specific_rule.precedence = a_general_rule.precedence and then
						 a_specific_rule.priority > a_general_rule.priority) then
						last_matched_rule := a_specific_rule.handler
					else
						last_matched_rule := a_general_rule.handler
					end
				end
			end
		ensure
			Maybe_no_rule_matches: True
		end

	match_next_rule (a_node: XM_XPATH_NODE; a_current_template: XM_XSLT_COMPILED_TEMPLATE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Find handler for `a_node' within specified precedence range
		require
			a_node_not_void: a_node /= Void
			a_context_not_void: a_context /= Void
			a_current_template_not_void: a_current_template /= Void
		local
			l_key: INTEGER
			l_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
			l_current_priority: INTEGER
			l_current_precedence, l_current_sequence_number: INTEGER
			l_handler: XM_XSLT_RULE_VALUE
			l_template: XM_XSLT_COMPILED_TEMPLATE
		do
			last_matched_rule := Void
			l_key := rule_key (a_node.fingerprint, a_node.node_type)
			l_current_sequence_number := -1
			l_current_precedence := -1
			l_current_priority := -1
			-- First find the rule corresponding to the current handler.
			from
				l_rule := rule_dictionary.item (l_key)
			until
				l_finished or l_rule = Void
			loop
				l_handler := l_rule.handler
				if l_handler.is_template then
					l_template := l_handler.as_template
				else
					l_template := Void
				end
				if l_template /= Void and then l_template = a_current_template then
					l_current_precedence := l_rule.precedence
					l_current_priority := l_rule.priority_rank
					l_current_sequence_number := l_rule.sequence_number
					l_finished := True
				else
					l_rule := l_rule.next_rule
				end
			end
			if l_rule = Void and then l_key /= Any_node + 1 then
				from
					l_rule := rule_dictionary.item (Any_node + 1)
				until
					l_finished or l_rule = Void
				loop
					l_handler := l_rule.handler
					if l_handler.is_template then
						l_template := l_handler.as_template
					else
						l_template := Void
					end
					if l_template /= Void and then l_template = a_current_template then
						l_current_precedence := l_rule.precedence
						l_current_priority := l_rule.priority_rank
						l_current_sequence_number := l_rule.sequence_number
						l_finished := True
					else
						l_rule := l_rule.next_rule
					end
				end
			end
			if l_rule /= Void then
				match_proper_next_rule (a_node, l_key, a_context, l_current_priority, l_current_precedence, l_current_sequence_number, l_handler)
			end
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
			a_key: INTEGER
			a_rule, a_new_rule, a_previous_rule: XM_XSLT_RULE
			finished: BOOLEAN
		do

			-- Ignore a pattern that will never match, e.g. "@comment"

			if a_pattern /= xslt_empty_item then

				-- For fast lookup, we maintain one list for each element name for patterns that can only
				--  match elements of a given name, one list for each node type for patterns that can only
				--  match one kind of non-element node, and one generic list.
				-- Each list is sorted in precedence/priority order so we find the highest-priority rule first

				a_key := rule_key (a_pattern.fingerprint, a_pattern.node_kind)
				debug ("XSLT template rules")
					if a_handler.is_template then
						std.error.put_string ("Added rule to match " + a_pattern.original_text)
						std.error.put_string (" with key " + a_key.out + ", with precedence of " + a_precedence.out)
						std.error.put_string (" and priority of " + a_priority.to_scientific_string + "%N")
						std.error.put_string ("Template fingerprint is " + a_handler.template_value.template_fingerprint.out + "%N")
						std.error.put_string ("System id is " + a_handler.template_value.system_id + "%N")
						std.error.put_string ("Line number is " + a_handler.template_value.line_number.out + "%N")
					end
				end
				create a_new_rule.make (a_pattern, a_handler, a_precedence, a_priority, sequence_number)
				sequence_number := sequence_number + 1
				a_rule := rule_dictionary.item (a_key)
				if a_rule = Void then
					rule_dictionary.put (a_new_rule, a_key)
				else

					-- Insert the new rule into this list before others of the same precedence/priority

					from
						a_previous_rule := Void
					until
						finished or else a_rule = Void
					loop
						if a_rule.precedence < a_precedence or else
							(a_rule.precedence = a_precedence and then a_rule.priority <= a_priority) then
							a_new_rule.set_next_rule (a_rule)
							if a_previous_rule = Void then
								rule_dictionary.put (a_new_rule, a_key)
							else
								a_previous_rule.set_next_rule (a_new_rule)
							end
							finished := True
						else
							a_previous_rule := a_rule
							a_rule := a_rule.next_rule
						end
					end

					if a_rule = Void then
						a_previous_rule.set_next_rule (a_new_rule)
						a_new_rule.set_next_rule (Void)
					end
				end
			end
		ensure

		end

feature {XM_XSLT_MODE, XM_XSLT_RULE_MANAGER} -- Restricted
	
	rule_dictionary: ARRAY [XM_XSLT_RULE]
			-- Rule dictionary

feature {XM_XSLT_MODE} -- Local

	sequence_number: INTEGER
			-- Sequence number for next rule to be created

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

			-- Don't report an error if the conflict is between two branches of the same.union pattern

			if a_rule.handler /= another_rule.handler then
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
			a_rule, a_general_rule: XM_XSLT_RULE
			finished: BOOLEAN
		do
			from
				a_rule := rule_dictionary.item (Any_node + 1)
			until
				finished or else a_rule = Void
			loop
				if a_rule.precedence < a_specific_precedence or else
					(a_rule.precedence = a_specific_precedence and then a_rule.priority_rank < a_specific_priority) then

					-- no point in looking at a lower priority rule than the one we've got

					finished := True
				else
					a_rule.pattern.match (a_node, a_context)
					if a_rule.pattern.is_error then
						a_context.transformer.report_recoverable_error (a_rule.pattern.error_value)
						finished := True
					elseif a_rule.pattern.last_match_result then
						
						-- Is it a second match?

						if a_general_rule /= Void then
							if a_rule.precedence = a_general_rule.precedence and then a_rule.priority_rank.is_equal (a_general_rule.priority_rank) then
								report_ambiguity (a_node, a_rule, a_general_rule, a_context.transformer)
								finished := True
							end
						else
							a_general_rule := a_rule
							if a_context.transformer.recovery_policy = Recover_silently then finished := True end 
						end
					end
				end
				a_rule := a_rule.next_rule
			end
			if not a_context.transformer.is_error then
				last_matched_rule := general_or_specific_rule (a_node, a_context, a_specific_rule, a_general_rule)
			end
		end

	match_proper_next_rule (a_node: XM_XPATH_NODE; a_key: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT; a_current_priority: INTEGER;
		a_current_precedence, a_current_sequence_number: INTEGER; a_handler: XM_XSLT_RULE_VALUE) is
			-- Find next matching rule.
		require
			a_node_not_void: a_node /= Void
			a_context_not_context: a_context /= Void
			positive_sequence_number: a_current_sequence_number >= 0
			a_handler_not_void: a_handler /= Void
		local
			l_rule, l_specific_rule: XM_XSLT_RULE
			l_specific_precedence: INTEGER
			l_specific_priority: INTEGER
			l_finished: BOOLEAN
		do
			l_specific_precedence := -1
			l_specific_priority := -1
			-- Search the specific list for this node type / node name.
			if a_key /= Any_node + 1 then
				from
					l_rule := rule_dictionary.item (a_key)
				until
					l_finished or else l_rule = Void
				loop
					-- Ignore alternate union branches
					if l_rule.handler /= a_handler then
						-- Skip this rule unless it's "below" the current rule in search order.
						if l_rule.precedence > a_current_precedence or
							(l_rule.precedence = a_current_precedence and
								(l_rule.priority_rank > a_current_priority or
									(l_rule.priority_rank.is_equal (a_current_priority) and l_rule.sequence_number >= a_current_sequence_number))) then
							-- skip rule
						else
							-- Quit the search on finding the second (recoverable error) match.
							if l_specific_rule /= Void then
								if l_rule.precedence < l_specific_precedence or
									(l_rule.precedence = l_specific_precedence and l_rule.priority_rank < l_specific_priority) then
									l_finished := True
								end
							end
							if not l_finished then
								l_rule.pattern.match (a_node, a_context)
								if l_rule.pattern.is_error then
									a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
									l_finished := True
								elseif l_rule.pattern.last_match_result then
									-- Is this a second match?
									if l_specific_rule /= Void then
										if l_rule.precedence = l_specific_precedence and then l_rule.priority_rank.is_equal (l_specific_priority) then
											l_finished := True
											report_ambiguity (a_node, l_specific_rule, l_rule, a_context.transformer)
										end
									end
								end
								if not l_finished then
									l_specific_rule := l_rule
									l_specific_precedence := l_rule.precedence
									l_specific_priority := l_rule.priority_rank
								end
							end
						end
					end
					if not l_finished then
						l_rule := l_rule.next_rule
					end
				end
			end
			-- Search the general list.
			if not a_context.transformer.is_error then
				match_next_general_rule (a_node, a_context, l_specific_rule, a_current_priority, a_current_precedence, a_current_sequence_number, a_handler)
			end
		ensure
			Maybe_no_rule_matches: True
		end

	match_next_general_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT; a_specific_rule: XM_XSLT_RULE;
	                         a_current_priority: INTEGER; a_current_precedence, a_current_sequence_number: INTEGER; a_handler: XM_XSLT_RULE_VALUE) is
			-- Next matching rule.
		require
			a_node_not_void: a_node /= Void
			a_context_not_void: a_context /= Void
			positive_sequence_number: a_current_sequence_number >= 0
			a_handler_not_void: a_handler /= Void
		local
			l_rule, l_general_rule: XM_XSLT_RULE
			l_finished: BOOLEAN
			l_specific_precedence: INTEGER
			l_specific_priority: INTEGER
		do
			if a_specific_rule /= Void then
				l_specific_precedence := -a_specific_rule.precedence
				l_specific_priority := a_specific_rule.priority_rank
			else
				l_specific_precedence := -1
				l_specific_priority := -1
			end
			from
				l_rule := rule_dictionary.item (Any_node + 1)
			until
				l_finished or else l_rule = Void
			loop
				-- Ignore alternate union branches
				if l_rule.handler /= a_handler then
					-- Skip this rule unless it's "after" the current rule in search order
					if l_rule.precedence > a_current_precedence or else
						(l_rule.precedence = a_current_precedence and then
							(l_rule.priority_rank > a_current_priority or else
								(l_rule.priority_rank.is_equal (a_current_priority) and then l_rule.sequence_number >= a_current_sequence_number))) then
						-- skip rule
					else
						if l_rule.precedence < l_specific_precedence or else
							(l_rule.precedence = l_specific_precedence and then l_rule.priority_rank < l_specific_priority) then
							l_finished := True -- no point in looking at a lower priority rule than the one we've got
						end
						if not l_finished then
							l_rule.pattern.match (a_node, a_context)
							if l_rule.pattern.is_error then
								a_context.transformer.report_recoverable_error (l_rule.pattern.error_value)
								l_finished := True
							elseif l_rule.pattern.last_match_result then
								-- Is this a second match?
								if l_general_rule /= Void then
									if l_rule.precedence = l_general_rule.precedence and then l_rule.priority_rank.is_equal (l_general_rule.priority_rank) then
										l_finished := True
										report_ambiguity (a_node, a_specific_rule, l_rule, a_context.transformer)
									end
								else
									l_general_rule := l_rule
									if a_context.transformer.recovery_policy = Recover_silently then
										l_finished := True -- Find the first; they are in priority order.
									end
								end
							end
						end
					end
				end
				if not l_finished then
					l_rule := l_rule.next_rule
				end	
			end
			if not a_context.transformer.is_error then
				last_matched_rule := general_or_specific_rule (a_node, a_context, a_specific_rule, l_general_rule)
			end
		ensure
			Maybe_no_rule_matches: True
		end

	general_or_specific_rule (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT; a_specific_rule, a_general_rule: XM_XSLT_RULE): XM_XSLT_RULE_VALUE is
			-- General or specific rule
		require
			node_not_void: a_node /= Void
			context_not_void: a_context /= Void
		do
			if a_specific_rule /= Void and then a_general_rule = Void then
				Result := a_specific_rule.handler
			elseif a_specific_rule = Void and then a_general_rule /= Void then
				Result := a_general_rule.handler
			elseif a_specific_rule /= Void and then a_general_rule /= Void then
				if a_specific_rule.precedence = a_general_rule.precedence and then
					a_specific_rule.priority.is_equal (a_general_rule.priority) then
					
					-- This situation is exceptional: we have a "specific" pattern and
					--  a "general" pattern with the same priority. We have to select
					--  the one that was added last.
					
					if a_specific_rule.sequence_number > a_general_rule.sequence_number then
						Result := a_specific_rule.handler
					else
						Result := a_general_rule.handler
					end
					if a_context.transformer.recovery_policy /= Recover_silently then
						report_ambiguity (a_node, a_specific_rule, a_general_rule, a_context.transformer)
					end
				elseif a_specific_rule.precedence > a_general_rule.precedence or else
					(a_specific_rule.precedence = a_general_rule.precedence and then a_specific_rule.priority >= a_general_rule.priority) then
					Result := a_specific_rule.handler
				else
					Result := a_general_rule.handler
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
	
