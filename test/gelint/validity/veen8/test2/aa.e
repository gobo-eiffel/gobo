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
			b := attached s as l and l.is_empty
		end

end
