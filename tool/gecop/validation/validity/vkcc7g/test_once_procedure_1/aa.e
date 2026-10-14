class AA

create

	make

feature

	make
		local
			bf: BB
			bg: BB
			old_bf: BB
		do
			create bf.f
			old_bf := bf

			inspect bf
			when {BB}.f then
				print ("bf is {BB}.f%N")
			else
				print ("bf is not {BB}.f%N")
			end
			print ("bf ")
			print (bf.attr)
			print ("%N")

			bf.g

			print ("bf ")
			print (bf.attr)
			print ("%N")

			create bg.g

			inspect bf
			when {BB}.f then
				print ("bf is {BB}.f%N")
			when {BB}.g then
				print ("bf is {BB}.g%N")
			end
			inspect bg
			when {BB}.f then
				print ("bg is {BB}.f%N")
			when {BB}.g then
				print ("bg is {BB}.g%N")
			end
			print ("bg = bf: ")
			print (bg = bf)
			print ("%N")
			print ("bf = old_bf: ")
			print (bf = old_bf)
			print ("%N")
			print ("bg ")
			print (bg.attr)
			print ("%N")
		end
		
end
