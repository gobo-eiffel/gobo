indexing

	description:

		"Shared formatter"

	library: "Gobo Eiffel Formatter Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_SHARED_FORMATTER

feature -- Access

	formatter: ST_SCIENTIFIC_FORMAT is
			-- Formatter instance
		once
			create Result.make
		ensure
			formatter_not_void: Result /= Void
		end

end
