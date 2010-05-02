note

	description:

		"Objects that call XPath system-defined and user-defined functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_FUNCTION_CALL

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions, is_function_call, as_function_call
		end

feature -- Access

	arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actual parameters

	supplied_argument_count: INTEGER
			-- Number of actual arguments supplied in the function call
		do
			Result := arguments.count
		ensure
			positive_result: Result >= 0
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			Result := arguments
		end

	name: STRING
			-- Function name
		deferred
		ensure
			Name_not_void: Result /= Void and then Result.count > 0
		end

	fingerprint: INTEGER
			-- Fingerprint of `name' in `namespace_uri'

	namespace_uri: STRING
			-- Namespace uri for `name'
		deferred
		ensure
			Namespace_uri_not_void: Result /= Void
		end

	is_function_call: BOOLEAN
			-- Is `Current' an XPath function call?
		do
			Result := True
		end

	as_function_call: XM_XPATH_FUNCTION_CALL
			-- `Current' seen as an XPath function call
		do
			Result := Current
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("function ")
			if namespace_uri.count > 0 then
				std.error.put_string (namespace_uri)
				std.error.put_string ("#")
			end
			std.error.put_string (name)
			std.error.put_new_line
			a_cursor := arguments.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.display (a_level + 1)
				a_cursor.forth
			variant
				arguments.count + 1 - a_cursor.index
			end
		end

feature -- Status setting

	set_arguments (args: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Set all arguments.
		require
			arguments_not_void: args /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			arguments := args
			arguments.set_equality_tester (expression_tester)
			from
				a_cursor := arguments.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			variant
				arguments.count + 1 - a_cursor.index
			end
			compute_static_properties
		ensure
			arguments_set: arguments = args
			static_properties_computed: are_static_properties_computed
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			simplify_arguments (a_replacement)
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	simplify_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Simplify `arguments'
		require
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_argument: XM_XPATH_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			from
				l_cursor := arguments.new_cursor
				l_cursor.start
				create l_replacement.make (Void)
			until
				a_replacement.item /= Void or l_cursor.after
			loop
				l_argument := l_cursor.item
				l_argument.simplify (l_replacement)
				if l_argument.is_error then
					set_replacement (a_replacement, l_argument)
				elseif l_argument /= l_replacement.item then
					l_cursor.replace (l_replacement.item)
					adopt_child_expression (l_replacement.item)
				end
				l_cursor.forth
				l_replacement.put (Void)
			variant
				arguments.count + 1 - l_cursor.index
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_fixed_values: BOOLEAN
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			from
				l_fixed_values := True -- until we find otherwise
				l_cursor := arguments.new_cursor
				l_cursor.start
				create l_replacement.make (Void)
			until
				a_replacement.item /= Void or l_cursor.after
			loop
				l_cursor.item.check_static_type (l_replacement, a_context, a_context_item_type)
				if l_cursor.item.is_error then
					set_replacement (a_replacement, l_cursor.item)
				elseif l_cursor.item /= l_replacement.item then
					if l_replacement.item.is_error then
						set_replacement (a_replacement, l_replacement.item)
					else
						l_cursor.replace (l_replacement.item)
						adopt_child_expression (l_replacement.item)
						reset_static_properties
					end
				end
				if not l_cursor.item.is_value or l_cursor.item.depends_upon_implicit_timezone then
					l_fixed_values := False
				end
				l_cursor.forth
				l_replacement.put (Void)
			variant
				arguments.count + 1 - l_cursor.index
			end

			if a_replacement.item = Void then
				check_arguments (a_replacement, a_context)
			end
			if a_replacement.item = Void then
				if l_fixed_values then
					pre_evaluate (a_replacement, a_context) -- May or may not be in error
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_fixed_values: BOOLEAN
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			from
				l_fixed_values := True -- until we find otherwise
				l_cursor := arguments.new_cursor
				l_cursor.start
				create l_replacement.make (Void)
			until
				a_replacement.item /= Void or l_cursor.after
			loop
				l_cursor.item.optimize (l_replacement, a_context, a_context_item_type)
				if l_cursor.item.is_error then
					set_replacement (a_replacement, l_cursor.item)
				elseif l_cursor.item /= l_replacement.item then
					l_cursor.replace (l_replacement.item)
					adopt_child_expression (l_replacement.item)
					reset_static_properties
				end
				if not l_cursor.item.is_value or l_cursor.item.depends_upon_implicit_timezone then
					l_fixed_values := False
				end
				l_cursor.forth
				l_replacement.put (Void)
			variant
				arguments.count + 1 - l_cursor.index
			end

			if a_replacement.item = Void then
				check_arguments (a_replacement, a_context)
			end
			if a_replacement.item = Void then
				if l_fixed_values then
					pre_evaluate (a_replacement, a_context) -- May or may not be in error
				else
					a_replacement.put (Current)
				end
			end
		end

	promote (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: XM_XPATH_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			elseif a_offer.action /= Unordered then
				l_cursor := arguments.new_cursor
				from
					l_cursor.start
					create l_replacement.make (Void)
				until
					l_cursor.after
				loop
					l_cursor.item.promote (l_replacement, a_offer)
					if l_cursor.item /= l_replacement.item then
						l_cursor.replace (l_replacement.item)
						adopt_child_expression (l_replacement.item)
						reset_static_properties
					end
					l_replacement.put (Void)
					l_cursor.forth
				variant
					arguments.count + 1 - l_cursor.index
				end
				a_replacement.put (Current)
			else
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
			-- Functions that do not allow pre-evaluation,
			--  or that need access to context information,
			--  can redefine this routine.
		require
			no_error: not is_error
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		do
			create_iterator (a_context.new_compile_time_context)
			if last_iterator.is_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (last_iterator.error_value))
			else
				expression_factory.create_sequence_extent (last_iterator)
				set_replacement (a_replacement, expression_factory.last_created_closure)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		require
			no_error: not is_error
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		deferred
		ensure
			maybe_type_error: True
			not_necessarily_replaced: True
		end

feature {NONE} -- Implementation

	augmented_argument_count: INTEGER
			-- Number of secretly added arguments

	check_argument_count (a_minimum_count, a_maximum_count: INTEGER)
			-- Check number of arguments
		require
			positive_minimum_count: a_minimum_count >= 0
			nearly_positive_maximum_count: a_maximum_count >= -1
			no_previous_error: not is_error
		local
			a_message: STRING
			is_type_error: BOOLEAN
		do
			-- TODO - need to add location information in messages
			if a_minimum_count = a_maximum_count and then a_minimum_count /= supplied_argument_count then
				is_type_error := True
			a_message := STRING_.appended_string ("Function ", name)
			a_message := STRING_.appended_string (a_message, " must have ")
			a_message := STRING_.appended_string (a_message, (a_minimum_count - augmented_argument_count).out)
			a_message := STRING_.appended_string (a_message, plural_arguments_text ((a_minimum_count - augmented_argument_count)))
			elseif supplied_argument_count < a_minimum_count then
			is_type_error := True
				a_message := STRING_.appended_string ("Function ", name)
				a_message := STRING_.appended_string (a_message, " must have at least")
				a_message := STRING_.appended_string (a_message, (a_minimum_count - augmented_argument_count).out)
				a_message := STRING_.appended_string (a_message, plural_arguments_text ((a_minimum_count - augmented_argument_count)))
			elseif a_maximum_count > -1 and supplied_argument_count > a_maximum_count then
			is_type_error := True
				a_message := STRING_.appended_string ("Function ", name)
				a_message := STRING_.appended_string (a_message, " must have at most")
				a_message := STRING_.appended_string (a_message, (a_maximum_count - augmented_argument_count).out)
				a_message := STRING_.appended_string (a_message, plural_arguments_text ((a_maximum_count - augmented_argument_count)))
			end
			if is_type_error then
				set_last_error_from_string (a_message, Xpath_errors_uri, "XPST0017", Static_error)
			end
		ensure
			Correct_number_or_error: True
		end

	plural_arguments_text (a_count: INTEGER): STRING
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

	arguments: arguments /= Void and then arguments.equality_tester.is_equal (expression_tester)
	augmented_argument_count: augmented_argument_count = 0 or else augmented_argument_count = 1

end
