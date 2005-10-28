class PLATFORM

feature

	Real_bits: INTEGER is
		do
			Result := 32
		end

	Pointer_bits: INTEGER is
		do
			Result := 32
		end

	Integer_bits: INTEGER is
		do
			Result := 32
		end

	Double_bits: INTEGER is
		do
			Result := 64
		end

	Character_bits: INTEGER is
		do
			Result := 8
		end

	Boolean_bits: INTEGER is
		do
			Result := 32
		end

	Real_bytes: INTEGER is
		do
			Result := 4
		end

	Pointer_bytes: INTEGER is
		do
			Result := 4
		end

	Integer_bytes: INTEGER is
		do
			Result := 4
		end

	Double_bytes: INTEGER is
		do
			Result := 8
		end

	Character_bytes: INTEGER is
		do
			Result := 1
		end

	Boolean_bytes: INTEGER is
		do
			Result := 4
		end

	Maximum_character_code: INTEGER is
		do
			Result := 255
		end

	Minimum_character_code: INTEGER is
		do
			Result := 0
		end

	Maximum_integer: INTEGER is
		do
			Result := 2147483647
		end

	Minimum_integer: INTEGER is -2147483648

	is_dotnet: BOOLEAN is
		do
			Result := False
		end

end
