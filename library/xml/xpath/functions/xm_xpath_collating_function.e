indexing

	description:

		"Objects that support XPath functions which take a collator as an argument"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_COLLATING_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			evaluate_item
		redefine
			pre_evaluate
		end

feature -- Access

	collator (an_argument_number: INTEGER; a_context: XM_XPATH_CONTEXT; use_default_collator: BOOLEAN): ST_COLLATOR is
			-- Collator to be used
		require
			context_not_void: a_context /= Void
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_string_value: XM_XPATH_STRING_VALUE
		do
			if arguments.count >= an_argument_number then
				arguments.item (an_argument_number).evaluate_item (a_context)
				an_atomic_value ?= arguments.item (an_argument_number).last_evaluated_item
				check
					atomic_value: an_atomic_value /= Void
					-- it's statically typed as a string
				end
				a_string_value ?= an_atomic_value.primitive_value
				check
					string_value: a_string_value /= Void
					-- it's statically typed as a string
				end
				Result := a_context.collation (a_string_value.string_value)
			elseif use_default_collator then
				Result := a_context.default_collation
			else

				-- We use the Unicode codepoint collator

				Result := a_context.unicode_codepoint_collator
			end
		end

feature -- Evaluation

	-- Since collations aren't avaialble statically: (maybe we can change this?)

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (Current)
		end

end
	
