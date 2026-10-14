class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f (1)
			inspect b
			when {BB}.f (2) then
				print ("b is {BB}.f (2): True%N")
			else
				print ("b is {BB}.f (2): False%N")
			end
			inspect b.twin
			when {BB}.f (3) then
				print ("b.twin is {BB}.f (3): True%N")
			else
				print ("b.twin is {BB}.f (3): False%N")
			end
		end
		
end
