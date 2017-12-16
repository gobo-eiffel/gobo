class AA

create

	make

feature

	make
		local
			c: ANY
			s: detachable STRING
		do
			if attached {STRING [ANY]} s as b and then True then
				c := b
			end
		end

end
