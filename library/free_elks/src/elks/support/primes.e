note
	description: "Prime number properties"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	names: primes;
	date: "$Date$"
	revision: "$Revision$"

class PRIMES inherit

	COUNTABLE_SEQUENCE [INTEGER]
		rename
			has as is_prime
		redefine
			is_prime
		end

feature -- Access

	Smallest_prime: INTEGER = 2

	Smallest_odd_prime: INTEGER = 3

	higher_prime (n: INTEGER): INTEGER
			-- Lowest prime greater than or equal to `n'
		do
			if n <= Smallest_prime then
				Result := Smallest_prime
			else
					check
						n > Smallest_prime
					end
				from
					if n \\ Smallest_prime = 0 then
							-- Make sure that `Result' is odd
						Result := n + 1
					else
						Result := n
					end
				until
					is_prime (Result)
				loop
					Result := Result + Smallest_prime
				end
			end
		ensure
			instance_free: class
		end

	lower_prime (n: INTEGER): INTEGER
			-- Greatest prime lower than or equal to `n'
		require
			argument_big_enough: n >= Smallest_prime
		do
			if n = Smallest_prime then
				Result := Smallest_prime
			else
					-- `n' > Smallest_prime
				from
					if n \\ Smallest_prime = 0 then
							-- make sure that `Result' is odd
						Result := n - 1
					else
						Result := n
					end
				until
					is_prime (Result)
				loop
					Result := Result - Smallest_prime
				end
			end
		ensure
			instance_free: class
		end

	all_lower_primes (n: INTEGER): ARRAY [BOOLEAN]
			-- Array of `n' boolean values, where the
			-- value at index `i' is true if and only if
			-- `i' is prime.
		local
			i, j: INTEGER
		do
				-- All odd numbers except 1 are candidates
			from
				create Result.make_filled (False, 1, n)
				i := 3
			until
				i > n
			loop
				Result.put (True, i)
				i := i + Smallest_prime
			end
				-- `Smallest_prime' is the lowest prime number
			if n >= Smallest_prime then
				Result.put (True, Smallest_prime)
			end
				-- Remove all multiples of primes
			from
				i := Smallest_odd_prime
			until
				i * i > n
			loop
				if Result.item (i) then
					from
						j := i * i
					until
						j > n
					loop
						Result.put (False, j)
						j := j + Smallest_prime * i
					end
				end
				i := i + Smallest_prime
			end
		ensure
			instance_free: class
		end

	is_prime (n: INTEGER): BOOLEAN
			-- Is `n' a prime number?
		local
			divisor: INTEGER
		do
			if n <= 1 then
				Result := False
			elseif n = Smallest_prime then
				Result := True
			elseif n \\ Smallest_prime /= 0 then
				from
					divisor := Smallest_odd_prime
				until
					(n \\ divisor = 0) or else (divisor * divisor >= n)
				loop
					divisor := divisor + Smallest_prime
				end
				if divisor * divisor > n then
					Result := True
				end
			end
		ensure then
			instance_free: class
		end

	i_th (i: INTEGER): INTEGER
			-- The `i'-th prime number
		local
			candidates: ARRAY [BOOLEAN]
			found: INTEGER
			l_values: like internal_precomputed_primes
		do
			l_values := internal_precomputed_primes
				-- Might looks strange that we check for Voidness of `l_values'
				-- but it happens that computation of `internal_precomputed_values'
				-- calls `approximated_i_th' and its post-condition call us back.
				-- In this case only, we use the slow implementation to find the `i-th'
				-- element.
			if l_values /= Void and then i <= l_values.upper then
				Result := l_values.item (i)
			else
				candidates := all_lower_primes (approximated_i_th (i))
				from
					Result := 2; found := 1
				invariant
					-- Between 1 and `Result' there are `found' primes.
				until
					found = i
				loop
					Result := Result + 1
					if candidates.item (Result) then
						found := found + 1
					end
				variant
					i * i - Result
				end
			end
		ensure then
			instance_free: class
		end

feature {NONE} -- Implementation

	precomputed_primes_count: INTEGER = 200
			-- Number of precomputed prime numbers.

	internal_precomputed_primes: ARRAY [INTEGER]
			-- First `Precomputed_primes_count' prime numbers.
		local
			candidates: ARRAY [BOOLEAN]
			i, pos: INTEGER
		once
			from
				candidates := all_lower_primes (approximated_i_th (Precomputed_primes_count))
				create Result.make_filled (0, 1, Precomputed_primes_count)
				pos := 1
				i := 1
			until
				pos > Precomputed_primes_count
			loop
				if candidates.item (i) then
					Result.put (i, pos)
					pos := pos + 1
				end
				i := i + 1
			end
		ensure
			instance_free: class
			internal_precomputed_primes_not_void: Result /= Void
			lower_valid: Result.lower = 1
			upper_valid: Result.upper = Precomputed_primes_count
		end

	approximated_i_th (n: INTEGER): INTEGER
			-- Approximation of `n'-th prime number.
		require
			n_positive: n > 0
		local
			l_double_math: DOUBLE_MATH
			ln_n, ln_ln_n: REAL_64
		do
			if n >= 13 then
					-- Using math formula from J. Massias and G. Robin,
					-- "Bornes effectives pour certaines fonctions concernant les nombres premiers,"
					-- J. Théorie Nombres Bordeaux, 8 (1996) 215-242.  MR 97g:11099:
					-- n (ln n + ln (ln n) - 1 + 1.8 ln (ln n) / ln n)
				create l_double_math
				ln_n := l_double_math.log (n)
				ln_ln_n := l_double_math.log (ln_n)
				Result := (n * (ln_n + ln_ln_n - 1 + 1.8 * ln_ln_n / ln_n)).truncated_to_integer
			else
				Result := n * n
			end
		ensure
			instance_free: class
			approximation_valid: i_th (n) <= Result
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
