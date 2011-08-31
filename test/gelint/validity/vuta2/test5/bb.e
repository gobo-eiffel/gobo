class BB

feature

	f: detachable STRING
		do
			Result := "eiffel"
		ensure
			not Result.is_empty
		end
		
end
