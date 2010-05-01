note

	description:

		"Shared formatters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_SHARED_FORMATTERS

feature -- Access

	formatter: ST_SCIENTIFIC_FORMATTER is
			-- Shared scientific formatter
		once
			Result := scientific_formatter
		ensure
			formatter_not_void: Result /= Void
		end

	scientific_formatter: ST_SCIENTIFIC_FORMATTER is
			-- Shared scientific formatter
		once
			create Result.make
		ensure
			scientific_formatter_not_void: Result /= Void
		end

end
