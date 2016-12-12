class AA

create

	make

feature

	make
		local
			t: TYPE [ANY]
		do
			t := {THIS_TYPE_DOES_NOT_EXIST}
		end

end
