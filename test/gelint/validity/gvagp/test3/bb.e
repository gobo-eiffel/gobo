class BB

inherit

	CC [CHARACTER]
		rename
			put as put_character,
			item as character_item
		end

	CC [STRING]
		rename
			put as put_string,
			item as string_item
		select
			put_string, string_item
		end

end -- class BB
