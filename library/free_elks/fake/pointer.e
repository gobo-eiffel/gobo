expanded class POINTER

feature

	infix "+" (offset: INTEGER): POINTER is
			-- Pointer moved by an offset of `offset' bytes.
		do
			Result := c_offset_pointer (Current, offset)
		end

	c_offset_pointer (p: POINTER; o: INTEGER): POINTER is
			-- Pointer moved by an offset of `o' bytes from `p'.
		external
			"C inline"
		alias
			"R = ((char *)$p)+$o;"
		end

end
