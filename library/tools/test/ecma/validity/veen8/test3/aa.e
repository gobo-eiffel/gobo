class AA

create

	make

feature

	make
		local
			s: detachable STRING
			b: BOOLEAN
		do
			s := ""
			b := (not attached s as l) or l.is_empty
		end

end
