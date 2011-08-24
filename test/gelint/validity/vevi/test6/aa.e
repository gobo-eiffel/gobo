class AA

create

	make

feature

	make
		local
			b: detachable ANY
		do
			b := agent
				local
					a: detachable ANY
					s: attached STRING
				do
					a := s
					s := "gobo"
				end
		end
		
end
