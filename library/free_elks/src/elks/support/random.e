note
	description: "[
		Pseudo-random number sequence, linear congruential method
		
		This class is adapted from work in "Discrete-Event System Simulation"
		by Jerry Banks & John S. Carson, II
		Prentice-Hall International Series in
		Industrial and Systems Engineering 1984
		Example 7.12 p 266 which is from
		IMSL Scientific Subroutine Package [1978],
		written in Fortran for IBM 360/370 computers.

		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	names: random;
	date: "$Date$"
	revision: "$Revision$"

class RANDOM inherit

	COUNTABLE_SEQUENCE [INTEGER]
		redefine
			has
		end

	ITERATION_CURSOR [INTEGER]

inherit {NONE}

	DOUBLE_MATH
		export
			{NONE} all
		end

create
	make, set_seed

feature -- Initialization

	make
			-- Initialize structure using a default seed.
		do
			set_seed (default_seed)
			start
		ensure
			seed_set: seed = default_seed
		end

	set_seed (s: INTEGER)
			-- Initialize sequence using `s' as the `seed'.
		require
			non_negative: s >= 0
		do
			seed := s
			last_result := seed
			last_item := 0
		ensure
			seed_set: seed = s
		end

feature -- Access

	default_seed: INTEGER
			-- Default value 123,457;
			-- may be redefined for a new generator.
		once
			Result := 123_457
		end

	modulus: INTEGER
			-- Default value 2^31 -1 = 2,147,483,647;
			-- may be redefined for a new generator.
		once
			Result := 2_147_483_647
		end

	multiplier: INTEGER
			-- Default value 7^5 = 16,807;
			-- may be redefined for a new generator.
		once
			Result := 16_807
		end

	increment: INTEGER
			-- Default value 0;
			-- may be redefined for a new generator.
		once
			Result := 0
		end

	seed: INTEGER
			-- Seed for sequence.

	next_random (n: INTEGER): INTEGER
			-- Next random number after `n'
			-- in pseudo-random order
		require
			in_range: (n < modulus) and (n >= 0)
		do
			Result := randomize (n)
		ensure
			in_range: (Result < modulus) and (Result >= 0)
		end

	has (n: INTEGER): BOOLEAN
			-- Will `n' be part of the random number sequence?
		do
			Result := (n < modulus) and (n >= 0)
		ensure then
			only_: Result = (n < modulus and n >= 0)
		end

	i_th (i: INTEGER): INTEGER
			-- The `i'-th random number
		local
			count: INTEGER
		do
			if i >= last_item then
				-- No need to start from beginning
				Result := last_result
				count := last_item
			else
				-- Start from scratch
				Result := seed
			end
			from
			until
				count = i
			loop
				Result := randomize (Result)
				count := count + 1
			end
			last_result := Result
			last_item := i
		ensure then
			in_range: (Result < modulus) and (Result >= 0)
		end

	real_item: REAL_32
			-- The current random number as a real between 0 and 1
		do
			Result := item.to_real / modulus.to_real
		end

	double_item: REAL_64
			-- The current random number as a double between 0 and 1
		do
			Result := item.to_double / dmod
		end

	real_i_th (i: INTEGER): REAL_32
			-- The `i'-th random number as a real between 0 and 1
		require
			positive_argument: i > 0
		do
			Result := i_th (i).to_real / modulus.to_real
		end

	double_i_th (i: INTEGER): REAL_64
			-- The `i'-th random number as a double between 0 and 1
		require
			positive_argument: i > 0
		do
			Result := i_th (i).to_double / dmod
		end

feature -- Iteration

	new_cursor: RANDOM
			-- <Precursor>
		do
			create Result.set_seed (seed)
			Result.start
		end

feature {NONE} -- Implementation

	randomize (xn: INTEGER): INTEGER
			-- Next item
		do
			Result := double_mod (dmul * xn + dinc, dmod).truncated_to_integer
		end

	double_mod (x, m: REAL_64): REAL_64
			-- `x' modulo `m'
		do
			Result := x - (floor (x / m) * m)
		end

	last_item: INTEGER
			-- Last `item' requested
			--| this can be used for optimising
			--| calls to item.

	last_result: INTEGER
			-- Value from last call to `item'

	dmod: REAL_64
			-- Double value for modulus
		once
			Result := modulus
		end

	dmul: REAL_64
			-- Double value for multiplier
		once
			Result := multiplier
		end

	dinc: REAL_64
			-- Double value for increment
		once
			Result := increment
		end

invariant
	non_negative_seed: seed >= 0
	non_negative_increment: increment >= 0
	positive_multiplier: multiplier > 0
	modulus_constraint: modulus > 1

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
