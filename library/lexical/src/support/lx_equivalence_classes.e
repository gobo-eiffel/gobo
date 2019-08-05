note

	description:

		"Equivalence classes of integer symbols"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_EQUIVALENCE_CLASSES

create

	make

feature {NONE} -- Initialization

	make (min, max: INTEGER)
			-- Make structure to allow creation of a
			-- set of equivalence classes for symbols
			-- within bounds `min'..`max'.
		require
			min_large_enough: min >= 0
			max_large_enough: max >= min
		local
			l_cell: DS_BILINKABLE [INTEGER]
			i: INTEGER
		do
			create l_cell.make (min)
			create storage.make_filled (l_cell, min, max)
			from
				i := min + 1
			until
				i > max
			loop
				create l_cell.make (i)
				storage.put (l_cell, i)
				i := i + 1
			end
			initialize
		ensure
			not_built: not built
			lower_set: lower = min
			upper_set: upper = max
		end

feature -- Initialization

	initialize
			-- Prepare structure to allow creation of a
			-- set of equivalence classes for symbols
			-- within bounds `lower'..`upper'.
			-- [This feature can be called to reset structure
			-- as it was after `make' creation procedure call.]
		local
			i, nb: INTEGER
			cell: DS_BILINKABLE [INTEGER]
		do
			nb := upper
			storage.item (lower).put (lower)
			from
				i := lower + 1
			until
				i > nb
			loop
				cell := storage.item (i)
				cell.put_left (storage.item (i - 1))
				cell.put (i)
				i := i + 1
			end
			new_upper := new_lower - 1
		ensure
			not_built: not built
		end

feature -- Access

	equivalence_class (symbol: INTEGER): INTEGER
			-- Equivalence class number for `symbol'
		require
			valid_symbol: valid_symbol (symbol)
			built: built
		do
			Result := storage.item (symbol).item
		ensure
			equivalence_class_large_enough: Result >= new_lower
			equivalence_class_small_enough: Result <= new_upper
			smaller_symbol: Result <= symbol
		end

	previous_symbol (symbol: INTEGER): INTEGER
			-- Previous symbol with same equivalence
			-- class as `symbol'
		require
			valid_symbol: valid_symbol (symbol)
			not_representative: not is_representative (symbol)
			not_built: not built
		do
			check
					-- See implementation of `is_representative'.
				not_representative: attached storage.item (symbol).left as l_left
			then
				Result := l_left.item
			end
		end

	count: INTEGER
			-- Number of equivalence classes

	capacity: INTEGER
			-- Maximum number of equivalence classes
		do
			Result := storage.count
		end

	lower: INTEGER
			-- Smallest allowed symbol
		do
			Result := storage.lower
		ensure
			lower_large_enough: Result >= 0
		end

	upper: INTEGER
			-- Largest allowed symbol
		do
			Result := storage.upper
		ensure
			upper_large_enough: Result >= lower
		end

	new_lower: INTEGER
			-- Smallest equivalence class
		do
			Result := lower
		ensure
			same_lower: Result = lower
		end

	new_upper: INTEGER
			-- Largest equivalence class

feature -- Status report

	is_representative (symbol: INTEGER): BOOLEAN
			-- Is `symbol' the representative
			-- of its equivalence class?
		require
			valid_symbol: valid_symbol (symbol)
		do
			Result := storage.item (symbol).left = Void
		ensure
			definition: Result = (storage.item (symbol).left = Void)
		end

	valid_symbol (a_symbol: INTEGER): BOOLEAN
			-- Is `a_symbol' a valid symbol?
		do
			Result := storage.valid_index (a_symbol)
		end

	valid_symbol_class (symbol_class: LX_SYMBOL_CLASS): BOOLEAN
			-- Are symbols in `symbol_class' valid?
		require
			symbol_class_not_void: symbol_class /= Void
		do
			Result := lower <= symbol_class.lower and upper >= symbol_class.upper
		end

	built: BOOLEAN
			-- Have the equivalence classes been numbered?
		do
			Result := new_upper >= new_lower
		ensure
			definition: Result = (new_upper >= new_lower)
		end

feature -- Element change

	build
			-- Build equivalence class numbers.
		local
			i, j, nb: INTEGER
			cell: DS_BILINKABLE [INTEGER]
			l_right: detachable DS_BILINKABLE [INTEGER]
		do
			nb := upper
			from
				i := lower
				j := lower
			until
				i > nb
			loop
				cell := storage.item (i)
				if cell.left = Void then
					from
						cell.put (j)
						l_right := cell.right
					until
						l_right = Void
					loop
						l_right.put (j)
						l_right := l_right.right
					end
					j := j + 1
				end
				i := i + 1
			end
			new_upper := j - 1
		ensure
			built: built
		end

	put (symbol: INTEGER)
			-- Create equivalence class for single `symbol'.
		require
			not_built: not built
			valid_symbol: valid_symbol (symbol)
		local
			cell: DS_BILINKABLE [INTEGER]
			left, right: detachable DS_BILINKABLE [INTEGER]
		do
			cell := storage.item (symbol)
			left := cell.left
			right := cell.right
			if left /= Void and right /= Void then
				left.put_right (right)
				cell.forget_right
				cell.forget_left
			elseif right /= Void then
				right.forget_left
				cell.forget_right
			elseif left /= Void then
				left.forget_right
				cell.forget_left
			end
		end

	add (symbol_class: LX_SYMBOL_CLASS)
			-- Update equivalence classes based on `symbol_class'.
		require
			not_built: not built
			symbol_class_not_void: symbol_class /= Void
			valid_symbols: valid_symbol_class (symbol_class)
		local
			l_min, l_max: INTEGER
			cell: DS_BILINKABLE [INTEGER]
			right: detachable DS_BILINKABLE [INTEGER]
			old_cell: detachable DS_BILINKABLE [INTEGER]
			new_cell: DS_BILINKABLE [INTEGER]
			i: INTEGER
			stop, next_ec: BOOLEAN
			l_symbol: INTEGER
			l_other_symbol: INTEGER
			flags: DS_HASH_SET [INTEGER]
		do
				-- Note that it doesn't matter whether or not the
				-- symbol class is negated. The same results will
				-- be obtained in either case.
			if not symbol_class.is_empty then
				l_min := symbol_class.lower
				l_max := symbol_class.upper
				create flags.make ((l_max - l_min + 1).min (512))
				from
					l_symbol := l_min
				until
					l_symbol > l_max
				loop
						-- Find next symbol class member to process.
					if symbol_class.added (l_symbol) and then not flags.has (l_symbol) then
						cell := storage.item (l_symbol)
						old_cell := cell.left
						new_cell := cell
						l_other_symbol := l_symbol + 1
						from
							right := cell.right
						until
							right = Void
						loop
								-- Look for the symbol in the
								-- symbol class.
							i := right.item
							from
								stop := False
							until
								stop or l_other_symbol > l_max
							loop
								if not symbol_class.added (l_other_symbol) then
									l_other_symbol := l_other_symbol + 1
								elseif l_other_symbol > i then
									stop := True
								elseif l_other_symbol = i and not flags.has (l_other_symbol) then
										-- We found an old companion of
										-- `k'-th symbol in the symbol class.
										-- Link it into the new equivalence
										-- class and flag it as having been
										-- processed.
									new_cell.put_right (right)
									new_cell := right
										-- Set flag so we don't reprocess it.
									flags.force (l_other_symbol)
										-- Get next equivalence class member.
									next_ec := True
									stop := True
								else
									l_other_symbol := l_other_symbol + 1
								end
							end
							if not next_ec then
									-- Symbol is not in symbol class.
									-- Put it in the old equivalence class.
								if old_cell = Void then
									right.forget_left
								else
									old_cell.put_right (right)
								end
								old_cell := right
							else
								next_ec := False
							end
							right := right.right
						end
						if cell.left /= Void or else old_cell /= cell.left then
							cell.forget_left
							if old_cell /= Void then
								old_cell.forget_right
							end
						end
						new_cell.forget_right
						l_symbol := l_symbol + 1
					else
						l_symbol := l_symbol + 1
					end
				end
			end
		end

feature -- Conversion

	to_table: ARRAY [INTEGER]
			-- Array of equivalence classes, indexed by symbols
		require
			built: built
		local
			i, nb: INTEGER
		do
			create Result.make_filled (0, lower, upper)
			nb := upper
			from
				i := lower
			until
				i > nb
			loop
				Result.put (storage.item (i).item, i)
				i := i + 1
			end
		ensure
			table_not_void: Result /= Void
			table_lower_set: Result.lower = lower
			table_upper_set: Result.upper = upper
--			forall i in `lower' .. `upper', Result.item (i) = equivalence_class (i)
		end

	to_array (l, u: INTEGER): ARRAY [INTEGER]
			-- Slice of array equivalence classes, indexed by symbols;
			-- Entries out of bounds `lower'..`upper' are set to 0
		require
			built: built
			valid_bounds: l <= u + 1
		local
			i, nb: INTEGER
		do
			create Result.make_filled (0, l, u)
			nb := upper.min (u)
			from
				i := lower.max (l)
			until
				i > nb
			loop
				Result.put (storage.item (i).item, i)
				i := i + 1
			end
		ensure
			array_not_void: Result /= Void
			array_lower_set: Result.lower = l
			array_upper_set: Result.upper = u
--			forall i in lower.max (l)..upper.min (u), Result.item (i) = equivalence_class (i)
--			forall i in l..lower-1 or upper+1..u, Result.item (i) = 0
		end

feature {NONE} -- Implementation

	storage: ARRAY [DS_BILINKABLE [INTEGER]]
			-- Equivalence class numbers indexed by symbol

invariant

	storage_not_void: storage /= Void
	no_void_cell: not {KL_ARRAY_ROUTINES [DS_BILINKABLE [INTEGER]]}.has_void (storage)
	valid_bounds: lower <= upper
	new_upper_small_enough: new_upper <= upper

end
