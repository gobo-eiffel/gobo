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
			iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			counter: INTEGER
		do
			from
				iter := iterator (Void)
				counter := 1
			until
				counter > p or else iter.after
			loop
				iter.forth
				an_item := iter.item_for_iteration
				if counter = p then
					Result := an_item
				else
					counter := counter + 1
				end
			end
		ensure
			item_may_not_be_present: True -- As we do not know the lengths of sequences
		end

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
			iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_string := STRING_.appended_string (indent (level), "sequence of ")
			a_string := STRING_.appended_string (a_string, type_name (item_type))
			a_string := STRING_.appended_string (a_string, " (")
			from
				iter := iterator (Void)
					check
						before: iter.before
					end
				iter.forth
			until
				iter.after
			loop
				std.error.put_string (indent (level + 1))
				std.error.put_string (iter.item_for_iteration.string_value)
				std.error.put_new_line
				iter.forth				
			end
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Evaluation

		evaluate_item (context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item
		local
			iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			iter := iterator (context)
			if not iter.before then
				Result := iter.item_for_iteration
			end
		end

end
