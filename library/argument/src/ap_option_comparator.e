note

	description:

		"Comparators for ordering options"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2017, Bernd Schoeller and others"
	license: "MIT License"

class AP_OPTION_COMPARATOR

inherit

	KL_COMPARATOR [AP_OPTION]
		redefine
			less_than
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	less_than, attached_less_than (u, v: AP_OPTION): BOOLEAN
			-- Is `u' considered less than `v'?
		local
			u_string, v_string: STRING
		do
			if attached u.long_form as l_u_long_form then
				u_string := l_u_long_form
			else
				u_string := u.short_form.out
			end
			if attached v.long_form as l_v_long_form then
				v_string := l_v_long_form
			else
				v_string := v.short_form.out
			end
			Result := STRING_.three_way_comparison (u_string, v_string) = -1
		end

end
