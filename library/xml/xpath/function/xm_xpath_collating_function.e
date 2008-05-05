indexing

	description:

		"Objects that support XPath functions which take a collator as an argument"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_COLLATING_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			evaluate_item
		redefine
			pre_evaluate, check_static_type
		end

feature -- Access

	default_collation_name: STRING
			-- Default_collation_name

	collator (a_argument_number: INTEGER; a_context: XM_XPATH_CONTEXT; use_default_collator: BOOLEAN): ST_COLLATOR is
			-- Collator to be used
		require
			context_not_void: a_context /= Void
			default_collation_name_not_void: default_collation_name /= Void
		local
			l_item: XM_XPATH_ITEM
			l_collation_name: STRING
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			if arguments.count >= a_argument_number then
				create l_result.make (Void)
				arguments.item (a_argument_number).evaluate_item (l_result, a_context)
				l_item := l_result.item
				check
					atomic_value: l_item.is_atomic_value
					string_value: l_item.as_atomic_value.primitive_value.is_string_value
					-- it's statically typed as a string
				end
				l_collation_name := l_item.as_atomic_value.primitive_value.as_string_value.string_value
				if a_context.is_known_collation (l_collation_name) then
					Result := a_context.collator (l_collation_name)
					-- otherwise `Result' = `Void' and a FOCH0002 error will be reported by the caller 
				end
			elseif use_default_collator then
				Result := a_context.collator (default_collation_name)
			else

				-- We use the Unicode codepoint collator

				Result := a_context.unicode_codepoint_collator
			end
		ensure
			Maybe_unsupported_collation: True
		end

	atomic_comparer (a_argument_number: INTEGER; a_context: XM_XPATH_CONTEXT): XM_XPATH_ATOMIC_COMPARER is
			-- Atomic comparer to be used
		require
			context_not_void: a_context /= Void
			default_collation_name_not_void: default_collation_name /= Void
		local
			a_collator: ST_COLLATOR
		do
			a_collator := collator (a_argument_number, a_context, True)
			if a_collator /= Void then
				create Result.make (a_collator)
				Result.set_dynamic_context (a_context)
			end
		ensure
			Maybe_unsupported_collation: True
		end

	atomic_sort_comparer (a_argument_number: INTEGER; a_context: XM_XPATH_CONTEXT): XM_XPATH_ATOMIC_SORT_COMPARER is
			-- Atomic sort comparer to be used
		require
			context_not_void: a_context /= Void
			default_collation_name_not_void: default_collation_name /= Void
		local
			a_collator: ST_COLLATOR
		do
			a_collator := collator (a_argument_number, a_context, True)
			if a_collator /= Void then
				create Result.make (a_collator)
				Result.set_dynamic_context (a_context)
			end
		ensure
			Maybe_unsupported_collation: True
		end

feature -- Optimization
	
	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			default_collation_name := a_context.default_collation_name
		ensure then
			default_collation_name_not_void: default_collation_name /= Void
			default_collation_name_set: default_collation_name = a_context.default_collation_name
		end

feature -- Evaluation

	-- Since collations aren't avaialble statically: (maybe we can change this?)

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

end
	
