indexing

	description: "Format ?o to produce octal output"

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class

	GF_OCTAL_FORMATTER

inherit

	GF_UNSIGNED_INTEGER_FORMATTER
		redefine
			make
		end

creation

	make

feature -- Initialization

	make is
			-- Initialize.
		do
			precursor
			base := 8
		end

end
