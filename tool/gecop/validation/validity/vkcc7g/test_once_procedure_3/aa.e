class AA

create

	make

feature

	make
		local
			bf: BB
			bg: BB
		do
			create bf.f

			inspect bf
			when {BB}.f then
				print ("bf is {BB}.f%N")
			else
				print ("bf is not {BB}.f%N")
			end
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
			print ("bg ")
			print (bg.attr)
			print ("%N")

			bf.g

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
			print ("bf ")
			print (bf.attr)
			print ("%N")
			print ("bg ")
			print (bg.attr)
			print ("%N")
		end
		
end
