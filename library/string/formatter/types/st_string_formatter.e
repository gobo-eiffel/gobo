indexing

	description:

		"Format ?s."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class ST_STRING_FORMATTER

inherit

	ST_ABSTRACT_FORMATTER

creation

	make

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: STRING is
		once
			Result := ""
		end

	is_value (a_value: ANY): BOOLEAN is
			-- Is `a_value' a STRING?
		local
			a_string: STRING
		do
			a_string ?= a_value
			Result := a_string /= Void
		end
		
feature -- Output

	output: STRING is
			-- Formatted `value'
		do
			if value.is_empty then
				Result := ""
			else
				Result := clone (value)
				if is_precision_given then
					Result.keep_head (precision)
				end
				justify (Result)
			end
		end

end
