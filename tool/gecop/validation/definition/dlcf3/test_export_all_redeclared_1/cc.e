class CC

inherit

	BB
		export
			{ZZ} all
		redefine
			f
		end

	ANY

feature {YY}

	f (s: STRING)
		do
			print (s)
		end

end
