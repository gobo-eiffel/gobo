indexing

	description:

		"64 bit numbers for use as sequence numbers, or other codes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_64BIT_NUMERIC_CODE

inherit

	HASHABLE

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make, make_from_integer, make_with_offset, make_with_large_offset,
	make_from_sequence_number_with_double_offset

feature {NONE} -- Initialization

	make (a_high_word, a_low_word: INTEGER) is
			-- Establish invariant
		require
			components_positive: a_high_word >= 0 and then a_low_word >= 0
		do
			high_word := a_high_word
			low_word := a_low_word
		ensure
			high_word_set: high_word = a_high_word
			low_word_set: low_word = a_low_word
		end

	make_with_offset (a_high_word, a_low_word: INTEGER) is
			-- Establish invariant
		require
			components_positive: a_high_word >= 0 and then a_low_word >= 0 and then a_low_word + offset <= Platform.Maximum_integer
		do
			high_word := a_high_word
			low_word := a_low_word + offset
		ensure
			high_word_set: high_word = a_high_word
			low_word_set: low_word = a_low_word + offset
		end

	make_from_sequence_number_with_double_offset (a_sequence_number: XM_XPATH_64BIT_NUMERIC_CODE; an_offset: INTEGER) is
				-- Establish invariant
		require
			sequence_number_not_void: a_sequence_number /= Void
			second_offset_in_range: an_offset > 0 and then an_offset < offset
		do
			high_word := a_sequence_number.high_word
			low_word := a_sequence_number.low_word + offset + an_offset
		ensure
			high_word_set: high_word = a_sequence_number.high_word
			low_word_set: low_word = a_sequence_number.low_word + offset + an_offset
		end

	make_with_large_offset (a_high_word, a_low_word: INTEGER) is
			-- Establish invariant
		require
			components_positive: a_high_word >= 0 and then a_low_word >= 0 and then a_low_word + large_offset <= Platform.Maximum_integer
		do
			high_word := a_high_word
			low_word := a_low_word + large_offset
		ensure
			high_word_set: high_word = a_high_word
			low_word_set: low_word = a_low_word + large_offset
		end

	make_from_integer (a_low_word: INTEGER) is
			-- Establish invariant
		require
			component_positive: a_low_word >= 0
		do
			low_word := a_low_word
		ensure
			high_word_set: high_word = 0
			low_word_set: low_word = a_low_word
		end

feature -- Access

		high_word, low_word: INTEGER
			-- Component integers

		hash_code: INTEGER is
			-- Hash code value
		do
			Result := high_word.hash_code // 2 + low_word.hash_code // 2
		end
		
feature -- Comparison


	infix "<" (other: XM_XPATH_64BIT_NUMERIC_CODE): BOOLEAN is
			-- Is `Current' less than `other'?
		require
			other_exists: other /= void
		do
			if high_word < other.high_word then
				Result := True
			elseif high_word = other.high_word then
				Result := low_word < other.low_word
			end
		ensure
			asymmetric: Result implies not (other < Current)
		end

	infix ">" (other:  XM_XPATH_64BIT_NUMERIC_CODE): BOOLEAN is
			-- Is `Current' greater than 'other'?
		require
			other_exists: other /= void
		do
			if high_word > other.high_word then
				Result := True
			elseif high_word = other.high_word then
				Result := low_word > other.low_word
			end
		ensure
			definition: Result = (other < Current)
		end

	ie_equal (other:  XM_XPATH_64BIT_NUMERIC_CODE): BOOLEAN is
			-- Is `other` equal to `Current'?
		require
			other_exists: other /= void
		do
			Result := other.high_word = high_word and then other.low_word = low_word
		end

feature -- Status report

	is_positive: BOOLEAN is
			-- Is the number positive?
		do
			Result := low_word > 0 or else high_word > 0
		end

feature {NONE} -- Implementation

	offset: INTEGER is 32768
			-- 16th-bit offset

	large_offset: INTEGER is 1048576
			-- 20th-bit offset

invariant

	components_positive: high_word >= 0 and then low_word >= 0
	
end
	
