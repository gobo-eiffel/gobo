class AA

create

	make

feature

	make
		local
			b: detachable ANY
		do
			b := agent : attached STRING
				local
					a: detachable ANY
				do
					a := "gobo"
				ensure
					Result /= Void
				end
		end

end
