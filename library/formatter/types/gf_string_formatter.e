indexing

	description: "Format ?s."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_STRING_FORMATTER

inherit

	GF_ABSTRACT_FORMATTER


creation

	make


feature {GF_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: STRING is
		once
			Result := ""
		end


feature -- Output

	output: STRING is
			-- Formatted `value'
		do
			if value.is_empty then
				Result := ""
			else
				Result := STRING_.make_from_string (value)
				if is_precision_given then
					STRING_.keep_head (Result, precision)
				end
				justify (Result)
			end
		end

end
