indexing

	description: "I promise, this is the last singleton."

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	SINGLETON4

inherit

	DP_SINGLETON


feature {NONE} -- Singleton

	singleton: DP_SINGLETON is
			-- Yep, it's me.
		once
			Result := Current
		end

end
