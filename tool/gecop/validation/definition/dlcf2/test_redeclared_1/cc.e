class CC

inherit

	BB
		redefine
			f
		end

feature {ZZ}

	f (s: STRING)
		do
			print (s)
		end
		
end
