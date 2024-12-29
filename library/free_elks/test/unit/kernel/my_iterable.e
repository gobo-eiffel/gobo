class MY_ITERABLE [G]

inherit

	ITERABLE [G]
		rename
			new_cursor as new_iterator
		end

create

	make

feature

	make (a_old, a_new: G)
		do
			old_identifier := a_old
			new_identifier := a_new
		end

	new_iterator: MY_ITERATOR [G]
		do
			create Result.make (old_identifier)
		end

	new_cursor: MY_ITERATOR [G]
		do
			create Result.make (new_identifier)
		end

	old_identifier: G

	new_identifier: G

	foo: detachable G
		do
			across Current as i loop
				Result := i
			end
		end

end
