indexing

	description:

		"XPath sequences of atomic values and nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SEQUENCE_VALUE

inherit

	XM_XPATH_VALUE

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Any_item
		end

	item (p: INTEGER): XM_XPATH_ITEM is
			-- Item at `p'
		require
			position_strictly_positive: p > 0
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_counter: INTEGER
		do
			from
				an_iterator := iterator (Void)
				a_counter := 1
			until
				a_counter > p or else an_iterator.after
			loop
				an_iterator.forth
				an_item := an_iterator.item_for_iteration
				if a_counter = p then
					Result := an_item
				else
					a_counter := a_counter + 1
				end
			end
		ensure
			item_may_not_be_present: True -- As we do not know the lengths of sequences
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_string := STRING_.appended_string (indent (a_level), "sequence of ")
			a_string := STRING_.appended_string (a_string, type_name (item_type))
			a_string := STRING_.appended_string (a_string, " (")
			from
				an_iterator := iterator (Void)
					check
						before: an_iterator.before
					end
				an_iterator.forth
			until
				an_iterator.after
			loop
				std.error.put_string (indent (a_level + 1))
				std.error.put_string (an_iterator.item_for_iteration.string_value)
				std.error.put_new_line
				an_iterator.forth				
			end
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			-- TODO
		end

	evaluated_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context)
			if not an_iterator.before then
				Result := an_iterator.item_for_iteration
			end
		end

	evaluated_string (a_context: XM_XPATH_CONTEXT): XM_XPATH_STRING_VALUE is
			-- Evaluate as a String
		local
			a_value: XM_XPATH_STRING_VALUE
		do
			a_value ?= evaluated_item (a_context)
			if a_value = Void then
				create Result.make ("")
			else
				Result := a_value
			end
		end
end
