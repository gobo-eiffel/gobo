class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			inspect b
			when {BB}.f then
				print ("b is {BB}.f: True%N")
			else
				print ("b is {BB}.f: False%N")
			end
			inspect b.twin
			when {BB}.f then
				print ("b.twin is {BB}.f: True%N")
			else
				print ("b.twin is {BB}.f: False%N")
			end
		end
		
end
