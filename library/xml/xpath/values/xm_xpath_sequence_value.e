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
				an_item := an_iterator.item
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

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context)
			an_iterator.start
			if an_iterator.after then
				Result := True
			else
				an_iterator.forth
				if an_iterator.after then
					Result := False
				else
					Result := True
				end
			end
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_string := STRING_.appended_string (indentation (a_level), "sequence of ")
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
				std.error.put_string (indentation (a_level + 1))
				std.error.put_string (an_iterator.item.string_value)
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
			todo ("effective-boolean-value" ,False)
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate an expression as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context)
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.last_error)
			else
				an_iterator.start
				if not an_iterator.after then
					last_evaluated_item := an_iterator.item
				end
			end
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String
		local
			a_value: XM_XPATH_STRING_VALUE
		do
			evaluate_item (a_context)
			a_value ?= last_evaluated_item
			if a_value = Void then
				create last_evaluated_string.make ("")
			else
				last_evaluated_string := a_value
			end
		end

feature  -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context)
			if not an_iterator.is_error then
				an_iterator.start
				if an_iterator.is_error or else an_iterator.after then
					create {XM_XPATH_INVALID_ITEM} Result.make (an_iterator.last_error)
				else
					an_iterator.forth
					if not an_iterator.is_error then
						Result := an_iterator.item
					else
						create {XM_XPATH_INVALID_ITEM} Result.make (an_iterator.last_error)
					end
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make (an_iterator.last_error)
			end		
		end

end
