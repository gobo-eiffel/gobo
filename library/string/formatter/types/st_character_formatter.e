indexing

	description:

		"Character formatter with justify actions"

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	ST_CHARACTER_FORMATTER


inherit

	ST_ABSTRACT_FORMATTER


creation

	make


feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: CHARACTER_REF is
		once
			create Result
			Result.set_item ('%U')
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
