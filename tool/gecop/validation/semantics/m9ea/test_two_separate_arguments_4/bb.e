class BB

create

	make

feature

	make
		do
		end

	f (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling BB.f%N")
		end

end
