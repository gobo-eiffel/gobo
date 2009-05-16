indexing

	description:

		"Comparators for ordering options"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_OPTION_COMPARATOR

inherit

	KL_COMPARATOR [AP_OPTION]

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	less_than (u, v: AP_OPTION): BOOLEAN is
			-- Is `u' considered less than `v'?
		local
			u_string, v_string: STRING
			l_long_form: ?STRING
		do
			if u.has_long_form then
				l_long_form := u.long_form
				check 
					u_has_long_form : l_long_form /= Void
				end
				u_string := l_long_form
			else
				u_string := u.short_form.out
			end
			if v.has_long_form then
				l_long_form := v.long_form
				check 
					v_has_long_form: l_long_form /= Void
				end
				v_string := l_long_form
			else
				v_string := v.short_form.out
			end
			Result := STRING_.three_way_comparison (u_string, v_string) = -1
		end

end
