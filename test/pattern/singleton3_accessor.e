indexing

	description: "A singleton accessor."

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	SINGLETON3_ACCESSOR

feature {NONE} -- Private

	the_singleton3: SINGLETON3 is
			-- Access to a unique instance.
		once
			create Result
		end

	is_singleton3_real_singleton: BOOLEAN is
			-- Do multiple calls to `singleton' return the same result?
		do
			Result := the_singleton3 = the_singleton3
		end

invariant

	accessing_real_singleton: is_singleton3_real_singleton

end
