-- Special stack for lalr1_parser.
-- Has direct access to all elements relative to top element.

indexing
	author: "Andreas Auras"

class PARSER_STACK [G]

creation
	make

feature {ANY}

	make (n: INTEGER) is
		-- create stack with initial space for 'n' elements.
	require
		good_size: n > 0
	do
		!!an_array.make(1,n)
	end -- make

	count: INTEGER	-- number of items in stack

    infix "@", item (i: INTEGER): G is
          -- The element relative at 'i' under the top of the stack.
		  -- 'i' = 0 is the element at the top of the stack.
        require
			not_empty: not empty
			valid_index: i <= 0 and i > -count
        do
            Result := an_array.item (count + i)
        end -- item

	put (v: G) is
			-- push `v' into stack.
	do
		count := count + 1;
		an_array.force(v, count)

		debug
			if count > max_count then
				max_count := count
			end
		end
	end -- put

    remove (n: INTEGER) is
		-- remove 'n' elements from the top of the stack.
	require
		valid_count: n >= 0 and n <= count
	local
		i: INTEGER
		void_value: G
	do
		from
			i := 0
		until
			i = n
		loop
			an_array.put(void_value, count)
			count := count - 1
			i := i + 1
		end
	end -- remove

	empty: BOOLEAN is
		-- is stack empty?
	do
		Result := count = 0
	end -- empty

	max_count: INTEGER	-- maximum count stack has reached
						-- Only valid when debug is on.

feature {NONE}

	an_array: ARRAY[G]		-- array to store items

end -- class PARSER_STACK

--|-------------------------------------------------------------------
--| iss_yacc V1.0    : A yacc parser generator for Eiffel
--|
--| Copyright (C) 1995-1997 Halstenbach ACT GMBH
--| Breidenbrucherstr 2
--| D - 51674 Wiehl
--| Tel +49 2261 99020      Fax +49 2261 990299
--| Customer support e-mail <support@halstenbach.de>
--| All rights reserved. Duplication and distribution prohibited.
--|-------------------------------------------------------------------
