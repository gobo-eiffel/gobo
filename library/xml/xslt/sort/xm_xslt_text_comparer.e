note

	description:

		"Objects that compare text strings"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEXT_COMPARER

inherit

	KL_PART_COMPARATOR [XM_XPATH_ITEM]


create

	make, make_from_collator

feature {NONE} -- Initialiaztion

	make (a_comparer: KL_PART_COMPARATOR [XM_XPATH_ITEM])
			-- Establish invariant.
		require
			comparer_not_void: a_comparer /= Void
		do
			comparer := a_comparer
		ensure
			comparer_set: comparer = a_comparer
		end

	make_from_collator (a_collator: ST_COLLATOR)
			-- Establish invariant
		require
			collator_not_void: a_collator /= Void
		do
			collator := a_collator
		ensure
			collator_set: collator = a_collator
		end

feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN
			-- Is `u' considered less than `v'?
		local
			s1, s2: STRING
		do
			if attached collator as l_collator then
				s1 := u.string_value
				s2 := v.string_value
				Result := l_collator.less_than (s1, s2)
			else
				check attached comparer as l_comparer then
					Result := l_comparer.less_than (u, v)
				end
			end
		end

feature {NONE} -- Implementation

	collator: detachable ST_COLLATOR
			-- Collator used to perform string comparisons

	comparer: detachable KL_PART_COMPARATOR [XM_XPATH_ITEM]
			-- Comparator used to perform string comparisons

invariant

	collator_or_comparer: collator /= Void xor comparer /= Void

end
