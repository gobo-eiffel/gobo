note

	description:

		"Objects that compare text strings according to case order"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CASE_ORDER_COMPARER

inherit

	KL_PART_COMPARATOR [XM_XPATH_ITEM]

	ST_UNICODE_CHARACTER_CLASS_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_comparer: like comparer; a_upper_first: BOOLEAN)
			-- Initialize `Current'.
		require
			a_comparer_not_void: a_comparer /= Void
		do
			is_upper_first := a_upper_first
			comparer := a_comparer
		ensure
			is_upper_first_set: is_upper_first = a_upper_first
			comparer_set: comparer = a_comparer
		end

feature -- Access

	is_upper_first: BOOLEAN
			-- Are Upper case letters sorted before lower case?

feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN
			-- Is `u' considered less than `v'?
			-- Not efficient.
		local
			l_first, l_second: STRING
			l_finished, l_first_upper, l_first_lower, l_second_upper, l_second_lower: BOOLEAN
			l_first_code, l_second_code, l_index, l_first_count, l_second_count, l_count: INTEGER
		do
			l_first := u.string_value
			l_second := v.string_value
			if l_first /= l_second then
				if l_second.is_empty then
					Result := False
				elseif l_first.is_empty then
					Result := True
				else
					from
						l_first_count := l_first.count
						l_second_count := l_second.count
						l_count := l_first_count.min (l_second_count)
						l_index := 1
					until
						l_finished or l_index > l_count
					loop
						l_first_code := l_first.item_code (l_index)
						l_second_code := l_second.item_code (l_index)
						if l_first_code = l_second_code then
							l_index := l_index + 1
						else
							l_first_lower := is_lower_case (l_first_code)
							l_first_upper := is_upper_case (l_first_code)
							l_second_lower := is_lower_case (l_second_code)
							l_second_upper := is_upper_case (l_second_code)
							if l_first_upper and l_second_lower then
								Result := is_upper_first
								l_finished := True
							elseif l_first_lower and l_second_upper then
								Result := not is_upper_first
								l_finished := True
							else
								Result := comparer.less_than (create {XM_XPATH_STRING_VALUE}.make (l_first.substring (l_index, l_index)),
									create {XM_XPATH_STRING_VALUE}.make (l_second.substring (l_index, l_index)))
								l_finished := True
							end
						end
					end
					if not l_finished then
						Result := l_first_count < l_second_count
					end
				end
			end
		end

feature {NONE} -- Implementation

	comparer: KL_PART_COMPARATOR [XM_XPATH_ITEM]
			-- Base comparer for when there

invariant

	comparer_not_void: comparer /= Void

end

