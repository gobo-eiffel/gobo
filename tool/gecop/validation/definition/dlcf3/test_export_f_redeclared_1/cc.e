class CC

inherit

	BB
		export
			{ZZ} f
		redefine
			f
		end

feature {YY}

	f (s: STRING)
		do
			print (s)
		end

end
