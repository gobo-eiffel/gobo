expanded class DD

create

	default_create

feature

	name: detachable STRING

	set_name (a_name: like name)
		do
			name := a_name
		end

end
