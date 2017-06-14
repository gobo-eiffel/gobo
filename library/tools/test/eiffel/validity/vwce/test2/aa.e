class AA

create

	make

feature

	make
		local
			s: detachable STRING
		do
			s := "gobo"
			if True then
				f (s)
			else
				f ("bar")
			end
				-- Check that the type of the conditional expression
				-- is considered as attached.
			f (if True then s else "bar" end)
		end
		
	f (s: attached STRING)
		do
			print (s)
		end
		
end
