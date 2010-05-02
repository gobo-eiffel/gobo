note

	description:

		"XPath sequences of atomic values and nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SEQUENCE_VALUE

inherit

	XM_XPATH_VALUE
		redefine
			is_sequence_value, as_sequence_value
		end

feature -- Access

	is_sequence_value: BOOLEAN
			-- Is `Current' a sequence value?
		do
			Result := True
		end

	as_sequence_value: XM_XPATH_SEQUENCE_VALUE
			-- `Current' seen as a sequence value
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		local
			a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_saved_iterator := last_iterator -- to preserve purity
			create_iterator (a_context)
			last_iterator.start
			if last_iterator.is_error or else last_iterator.after then
				Result := False
			else
				last_iterator.forth
				if last_iterator.is_error or else not last_iterator.after then
					Result := False
				else
					Result := True
				end
			end
			last_iterator := a_saved_iterator
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
			a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_saved_iterator := last_iterator -- to preserve purity
			a_string := STRING_.appended_string (indentation (a_level), "sequence of ")
			a_string := STRING_.appended_string (a_string, item_type.conventional_name)
			a_string := STRING_.appended_string (a_string, " (")
			from
				create_iterator (Void)
				if last_iterator.is_error then
					a_string := STRING_.appended_string (a_string, "iterator in ERROR")
				end
				last_iterator.start
				if last_iterator.is_error then
					a_string := STRING_.appended_string (a_string, "iterator in ERROR")
				end
			until
				last_iterator.is_error or else last_iterator.after
			loop
				std.error.put_string (indentation (a_level + 1))
				std.error.put_string (last_iterator.item.string_value)
				std.error.put_new_line
				last_iterator.forth
				if last_iterator.is_error then
					a_string := STRING_.appended_string (a_string, "iterator in ERROR")
				end
			end
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
			last_iterator := a_saved_iterator
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			create_iterator (a_context)
			if last_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (last_iterator.error_value))
			else
				last_iterator.start
				if not last_iterator.after then
					a_result.put (last_iterator.item) -- the assumption is cardinality is zero or one
				end
			end
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a String
		local
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			evaluate_item (l_result, a_context)
			if not l_result.item.is_string_value then
				create last_evaluated_string.make ("")
			else
				last_evaluated_string := l_result.item.as_string_value
			end
		end

feature  -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM
			-- Convert to an item
		do
			create_iterator (a_context)
			if not last_iterator.is_error then
				last_iterator.start
				if last_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} Result.make (last_iterator.error_value)
				else
					Result := last_iterator.item
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make (last_iterator.error_value)
			end
		end

end
