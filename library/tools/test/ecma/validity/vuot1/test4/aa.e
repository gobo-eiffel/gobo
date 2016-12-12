class AA

create

	make

feature

	make
		local
			s1: detachable STRING
			s2: detachable STRING
		do
			from
				s1 := "eiffel"
				s2 := "gobo"
			until
				((not attached s1 as l) or else not l.is_empty) or ((not attached s2 as l) or else l.is_empty)
			loop
					-- With ISE 6.8, the loop-compound should contain at least one
					-- instruction in order for the VEEN error to be reported.
				do_nothing
			end
		end

end
