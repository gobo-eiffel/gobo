class AA

create

	make

feature

	make
		local
			b: TYPE [ANY]
		do
			b := {AA}
			inspect b
			when {like Current} then
			else
			end
			print ("Failed")
		end

end
