indexing

	description:

		"Imported string formatting routines"

	library: "Gobo Eiffel Formatter Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class

	GF_FORMAT_ROUTINES

inherit

	GF_SHARED_FORMATTER
		export
			{NONE} all
		end

feature -- Status

	is_correct_format_and_parameters (a_format: STRING; a_para: ARRAY [ANY]): BOOLEAN is
			-- Is `a_format' a correct format string and are all
			-- parameters in `a_para', 1) are used in `format', 2) have the
			-- correct type, 3) are not void?
		do
			Result := formatter.is_correct_format_and_parameters (a_format, a_para)
		end

feature -- Access

	format (a_format: STRING; a_para: ARRAY [ANY]): STRING is
			-- String with parameters in `a_format' replaced by
			-- parameters in `a_para'
		require
			parameters_valid: is_correct_format_and_parameters (a_format, a_para)
		do
			Result := formatter.format (a_format, a_para)
		ensure
			format_not_void: Result /= Void
		end

end
