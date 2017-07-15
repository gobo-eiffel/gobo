class AA

create

	make

feature

	make
		local
			s: ANY
		do
			s := "foo"
			if True then
				print ("gobo")
			elseif True then
				print ([1])
			else
				print (s)
			end
			print (if True then "gobo" elseif True then [1] else s end)
		end
end
