indexing

	description: "Singleton accessor class for GF_SCIENTIFIC_FORMAT."
	thanks: "Thanks to Design Patterns and Contracts."

	library: "Gobo Eiffel Formatter Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_FORMAT


feature {NONE} -- Only visible to inheriting class

	is_correct_format_and_parameters (a_format: STRING; a_para: ARRAY [ANY]): BOOLEAN is
			-- Is `a_format' a correct format string and are all
			-- parameters in `a_para', 1) are used in `format', 2) have the
			-- correct type, 3) are not void?
		do
			Result := the_format.is_correct_format_and_parameters (a_format, a_para)
		end

	format (a_format: STRING; a_para: ARRAY [ANY]): STRING is
			-- String with parameters in `a_format' replaced by
			-- parameters in `a_para'
		require
			parameters_valid: is_correct_format_and_parameters (a_format, a_para)
		do
			Result := the_format.format (a_format, a_para)
		end

	the_format: GF_SCIENTIFIC_FORMAT is
			-- The unique formatter instance
		once
			create Result.make
		ensure
			format_not_void: Result /= Void
		end

	is_the_format_real_singleton: BOOLEAN is
			-- Do multiple calls to `singleton' return the same result?
		do
			Result := the_format = the_format
		ensure
			definition: the_format = the_format
		end


invariant

	accessing_real_singleton: is_the_format_real_singleton

end
