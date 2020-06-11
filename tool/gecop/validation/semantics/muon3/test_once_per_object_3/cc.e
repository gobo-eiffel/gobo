class CC

inherit

	THREAD
		rename
			make as make_thread
		end

create

	make

feature
	
	make (a_b: BB)
		do
			b := a_b
			make_thread
		end
		
	execute
		do
			b.f
		end

	b: BB
	
end
