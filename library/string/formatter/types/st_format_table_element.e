indexing

	description: "Base class for typechar or picture formatters."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	ST_FORMAT_TABLE_ELEMENT


creation

	make


feature -- Initialization

	make (a_fmt: ST_ABSTRACT_FORMATTER) is
			-- Initialize
		require
			formatter_not_void: a_fmt /= Void
		do
			fmt := a_fmt
		ensure
			format_set: fmt = a_fmt
		end


feature -- Access

	fmt: ST_ABSTRACT_FORMATTER
			-- The formatter


invariant

	formatter_not_void: fmt /= Void

end
