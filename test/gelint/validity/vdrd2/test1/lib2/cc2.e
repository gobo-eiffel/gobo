class CC2

inherit

	BB1
		redefine
			 d
		end

create

	make

feature

	d: like Current
			-- detachable CC2

end
