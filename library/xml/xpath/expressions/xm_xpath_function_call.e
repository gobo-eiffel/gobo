indexing

	description:

		"Objects that call XPath system-defined and user-defined functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_FUNCTION_CALL

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions
		end

feature -- Access

	supplied_argument_count: INTEGER is
			-- Number of actual arguments supplied in the function call
		do
			Result := arguments.count
		ensure
			positive_result: Result >= 0
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			Result := arguments
		end

	name: STRING is
			-- Function name
		deferred
		ensure
			Name_not_void: Result /= Void and then Result.count > 0
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indent (a_level))
			std.error.put_string ("function ")
			std.error.put_string (name)
			std.error.put_new_line
			from
				arguments.start
			variant
				arguments.count + 1 - arguments.index				
			until
				arguments.after
			loop
				arguments.item_for_iteration.display (a_level + 1, a_pool)
				arguments.forth
			end
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
		local
			result_expression: XM_XPATH_FUNCTION_CALL
		do
			result_expression := clone (Current)
			result_expression.set_arguments (simplify_arguments)
			Result := result_expression
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions;
			-- This also calls pre_evaluate to evaluate the function
			--  if all the arguments are constant;
			-- Functions that do not require this behavior
			--  can override the pre_evaluate routine.
		local
			fixed_values: BOOLEAN
			a_value: XM_XPATH_VALUE
			an_argument: XM_XPATH_EXPRESSION
			result_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			a_result_expression: XM_XPATH_FUNCTION_CALL
		do
			a_result_expression := clone (Current)
			result_arguments := clone (arguments)
			from
				fixed_values := True -- until we find otherwise
				result_arguments.start
			variant
				result_arguments.count + 1 - result_arguments.index
			until
				result_arguments.after
			loop
				an_argument := result_arguments.item_for_iteration.analyze (a_context)
				result_arguments.replace_at (an_argument)
				a_value ?= an_argument
				if a_value = Void then fixed_values := False end
				result_arguments.forth
			end

			a_result_expression.set_arguments (result_arguments)
			a_result_expression.check_arguments (a_context)

			-- Now, if any of the arguments has a static type error,
			--  then `Current' as a whole has too.
			
			if a_result_expression.is_static_type_error then
				Result := a_result_expression -- Marked in error
			elseif fixed_values then
				Result := a_result_expression.pre_evaluate (a_context) -- May or may not be in error
			else
				Result := a_result_expression -- No error, but needs run-time evaluation
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for `Current'
		local
			an_expression:  XM_XPATH_EXPRESSION
			result_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			an_argument: XM_XPATH_EXPRESSION
			a_result_expression: XM_XPATH_FUNCTION_CALL
		do
			an_expression := an_offer.accept (Current)
			if an_expression = Void then
				if an_offer.action = Unordered then
					Result := Current					
				else
					result_arguments := clone (arguments)
					from
						result_arguments.start
					variant
						result_arguments.count + 1 - result_arguments.index
					until
						result_arguments.after
					loop
						an_argument := result_arguments.item_for_iteration.promote (an_offer)
						result_arguments.replace_at (an_argument)
						result_arguments.forth
					end
					a_result_expression ?= an_expression
						check
							promoted_expression_not_void: a_result_expression /= Void
						end
					a_result_expression.set_arguments (result_arguments)
					Result := a_result_expression
				end
			else
				Result := an_expression
			end
		end

feature -- Evaluation

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Pre-evaluate `Current' at compile time.
			-- Functions that do not allow pre-evaluation,
			--  or that need access to context information,
			--  can redefine this routine.
		require
			no_type_error: not is_static_type_error
			context_not_void: a_context /= Void
		do
			Result := eagerly_evaluate (Void)
		ensure
			evaluated: Result /= Void
		end

feature {XM_XPATH_FUNCTION_CALL, XM_XPATH_EXPRESSION_PARSER} -- Restricted

	set_arguments (args: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Set all arguments.
		require
			arguments_not_void: args /= Void
		do
			arguments := args
		ensure
			arguments_set: arguments = args
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		require
			no_type_error: not is_static_type_error
			context_not_void: a_context /= Void
		deferred
		ensure
			maybe_type_error: True
		end

feature {NONE} -- Implementation

	arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actual parameters

	simplify_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Simplify `arguments'
		local
			result_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			from
				result_arguments := clone (arguments)
				result_arguments.start
			variant
				result_arguments.count + 1 - result_arguments.index
			until
				result_arguments.after
			loop
				result_arguments.replace_at (result_arguments.item_for_iteration.simplify)
				result_arguments.forth
			end
			Result := result_arguments
		ensure
			simplified_arguments_not_void: Result /= Void
		end

	check_argument_count (a_minimum_count, a_maximum_count: INTEGER): INTEGER is
			-- Check number of arguments
		require
			positive_minimum_count: a_minimum_count >= 0
			positive_maximum_count: a_maximum_count >= 0
		local
			a_message: STRING
		do
			-- TODO - need to add location information in messages
			Result := supplied_argument_count
			if a_minimum_count = a_maximum_count and then a_minimum_count /= Result then
				is_static_type_error := True
			a_message := STRING_.appended_string ("Function ", name)
			a_message := STRING_.appended_string (a_message, " must have ")
			a_message := STRING_.appended_string (a_message, a_minimum_count.out)
			a_message := STRING_.appended_string (a_message, plural_arguments_text (a_minimum_count))
			set_last_static_type_error (a_message)
			elseif Result < a_minimum_count then
				a_message := STRING_.appended_string ("Function ", name)
				a_message := STRING_.appended_string (a_message, " must have at least")
				a_message := STRING_.appended_string (a_message, a_minimum_count.out)
				a_message := STRING_.appended_string (a_message, plural_arguments_text (a_minimum_count))
				set_last_static_type_error (a_message)
			elseif Result > a_maximum_count then
				a_message := STRING_.appended_string ("Function ", name)
				a_message := STRING_.appended_string (a_message, " must have at most")
				a_message := STRING_.appended_string (a_message, a_maximum_count.out)
				a_message := STRING_.appended_string (a_message, plural_arguments_text (a_maximum_count))
				set_last_static_type_error (a_message)
			end
		ensure
			Correct_number_or_static_error: not is_static_type_error implies Result = supplied_argument_count
		end

	plural_arguments_text (a_count: INTEGER): STRING is
			-- Singular of plural arguments text
		require
			positive_count: a_count >= 0
		do
			if a_count = 1 then
				Result := " argument"
			else
				Result := " arguments"
			end
		ensure
			plural_arguments_text_not_void: Result /= Void
		end

invariant

	arguments_not_void: arguments /= Void

end
