class AA

create

	make

feature

	make
		local
			s: detachable STRING
		do
			if s /= Void then
				f (s)
			else
				f ("gobo")
			end
				-- Check that the type of the conditional expression
				-- is considered as attached.
			f (if s /= Void then s else "gobo" end)
		end
		
	f (s: attached STRING)
		do
			print (s)
		end
		
end
