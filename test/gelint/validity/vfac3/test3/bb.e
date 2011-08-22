class BB

create

	make
	
feature
	
	make
		do
			xxx := "xxx"
			yyy := "yyy"
		end
		
	xxx: attached STRING assign set_xxx
	
	set_xxx (x: detachable STRING)
		do
		end

	yyy: attached STRING assign set_yyy
	
	set_yyy (y: attached STRING)
		do
		end

	zzz: detachable STRING assign set_zzz
	
	set_zzz (z: detachable STRING)
		do
		end
		
end
