class BB

feature

	f: STRING
		note
			option: "instance_free"
		local
			i: INTEGER
		do
				-- It's OK to have a qualified call
				-- from a instance-free feature
				-- if it does not involve an unqualified
				-- call to a non-instance-free feature.
			i := 5
			Result := i.out
		end

end
