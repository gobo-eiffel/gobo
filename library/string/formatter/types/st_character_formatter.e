indexing

	description:

		"Character formatter with justify actions"

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class ST_CHARACTER_FORMATTER

inherit

	ST_ABSTRACT_FORMATTER

creation

	make

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: DS_CELL [CHARACTER] is
		once
			create Result.make ('%U')
		end

	is_value (a_value: ANY): BOOLEAN is
			-- Is `a_value' a character cell.
		local
			a_cell: DS_CELL [CHARACTER]
		do
			a_cell ?= a_value
			Result := a_cell /= Void
		end
		
feature -- Output

	output: STRING is
			-- Formatted `value'
		do
			create Result.make (0)
			Result.append_character (value.item)
			justify (Result)
		end

end
