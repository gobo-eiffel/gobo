indexing

	description:

		"Format booleans, ?b and ?B."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_BOOLEAN_FORMATTER

inherit

	ST_ABSTRACT_FORMATTER
		rename
			make as make_abstract_formatter
		end

creation

	make

feature {NONE} -- Initialization

	make (an_is_lowercase_output: BOOLEAN) is
			-- Initialize.
		do
			make_abstract_formatter
			is_lowercase_output := an_is_lowercase_output
			if is_lowercase_output then
				lowercase_index := output_values.lower
			else
				lowercase_index := output_values.lower + 2
			end
		ensure
			is_lowercase_output_set: is_lowercase_output = an_is_lowercase_output
		end

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: BOOLEAN_REF is
		once
			create Result
			Result.set_item (True)
		end

feature -- Access

	is_lowercase_output: BOOLEAN
			-- Should `output' return lowercase strings for a Boolean value?

feature -- Output

	output: STRING is
			-- Formatted `value'
		local
			value_index: INTEGER
		do
			if value.item then
				value_index := 1
			end
			Result := clone (output_values.item (lowercase_index + value_index))
			justify (Result)
		ensure then
			lowercase: is_lowercase_output implies Result.is_equal (Result.as_lower)
		end

feature {NONE} -- Implementation

	output_values: ARRAY [STRING] is
			-- Possible values returned by `output'
		once
			Result := <<"false", "true", "False", "True">>
		ensure
			four_values: Result.count = 4
		end

	lowercase_index: INTEGER
			-- Index into `output_values', used to speed-up `value' lookups

invariant

	lowercase_index_is_output_values_index: lowercase_index = output_values.lower or lowercase_index = output_values.lower + 2

end
