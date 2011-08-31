class BB

create

	make
	
feature
	
	make
		do
			yyy := "yyy"
		end
		
	xxx: detachable STRING assign set_xxx
	
	set_xxx (x: attached STRING)
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
