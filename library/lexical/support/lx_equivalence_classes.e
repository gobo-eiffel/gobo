indexing

	description:

		"Equivalence classes of integer symbols"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_EQUIVALENCE_CLASSES

creation

	make

feature {NONE} -- Initialization

	make (min, max: INTEGER) is
			-- Make structure to allow creation of a
			-- set of equivalence classes for symbols
			-- within bounds `min'..`max'.
		require
			valid_bounds: min <= max
		local
			cell: DS_BILINKABLE [INTEGER]
			i: INTEGER
		do
			!! storage.make (min, max)
			from i := min until i > max loop
				!! cell.make (i)
				storage.put (cell, i)
				i := i + 1
			end
			initialize
		ensure
			not_built: not built
			lower_set: lower = min
			upper_set: upper = max
		end

feature -- Initialization

	initialize is
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
			from i := lower + 1 until i > nb loop
				cell := storage.item (i)
				cell.put_left (storage.item (i - 1))
				cell.put (i)
				i := i + 1
			end
			count := 0
		ensure
			not_built: not built
		end

feature -- Access

	equivalence_class (symbol: INTEGER): INTEGER is
			-- Equivalence class number for `symbol'
		require
			valid_symbol: valid_symbol (symbol)
			built: built
		do
			Result := storage.item (symbol).item
		end

	previous_symbol (symbol: INTEGER): INTEGER is
			-- Previous symbol with same equivalence
			-- class as `symbol'
		require
			valid_symbol: valid_symbol (symbol)
			not_representative: not is_representative (symbol)
			not_built: not built
		do
			Result := storage.item (symbol).left.item
		end

	count: INTEGER
			-- Number of equivalence classes

	capacity: INTEGER is
			-- Maximum number of equivalence classes
		do
			Result := storage.count
		end

	lower: INTEGER is
			-- Smallest allowed symbol
		do
			Result := storage.lower
		end

	upper: INTEGER is
			-- Largest allowed symbol
		do
			Result := storage.upper
		end

feature -- Status report

	is_representative (symbol: INTEGER): BOOLEAN is
			-- Is `symbol' the representative
			-- of its equivalence class?
		require
			valid_symbol: valid_symbol (symbol)
		do
			Result := storage.item (symbol).left = Void
		end

	valid_symbol (a_symbol: INTEGER): BOOLEAN is
			-- Is `a_symbol' a valid symbol?
		do
			Result := storage.valid_index (a_symbol)
		end

	valid_symbol_class (symbol_class: LX_SYMBOL_CLASS): BOOLEAN is
			-- Are symbols in `symbol_class' valid?
		require
			symbol_class_not_void: symbol_class /= Void
			symbols_sorted: not symbol_class.sort_needed
		do
			Result := symbol_class.is_empty or else
				(lower <= symbol_class.first and upper >= symbol_class.last)
		end

	built: BOOLEAN is
			-- Have the equivalence classes been numbered?
		do
			Result := count /= 0
		end

feature -- Element change

	build is
			-- Build equivalence class numbers.
		local
			i, j, nb: INTEGER
			cell: DS_BILINKABLE [INTEGER]
		do
			nb := upper
			from i := lower until i > nb loop
				cell := storage.item (i)
				if cell.left = Void then
					from
						j := j + 1
						cell.put (j)
						cell := cell.right
					until
						cell = Void
					loop
						cell.put (j)
						cell := cell.right
					end
				end
				i := i + 1
			end
			count := j
		ensure
			built: built
		end

	put (symbol: INTEGER) is
			-- Create equivalence class for single `symbol'.
		require
			not_built: not built
			valid_symbol: valid_symbol (symbol)
		local
			cell, left, right: DS_BILINKABLE [INTEGER]
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

	add (symbol_class: LX_SYMBOL_CLASS) is
			-- Update equivalence classes based on `symbol_class'.
		require
			not_built: not built
			symbol_class_not_void: symbol_class /= Void
			symbols_sorted: not symbol_class.sort_needed
			valid_symbols: valid_symbol_class (symbol_class)
		local
			cell, right: DS_BILINKABLE [INTEGER]
			old_cell, new_cell: DS_BILINKABLE [INTEGER]
			i, j, k, nb: INTEGER
			stop, next_ec: BOOLEAN
			symbol: INTEGER
			flags: ARRAY [BOOLEAN]
		do
				-- Note that it doesn't matter wether or not the
				-- symbol class is negated. The same results will
				-- be obtained in either case.
			nb := symbol_class.count
			!! flags.make (lower, upper)
			from k := 1 until k > nb loop
				cell := storage.item (symbol_class.item (k))
				old_cell := cell.left
				new_cell := cell
				j := k + 1
				from right := cell.right until right = Void loop
						-- Look for the symbol in the
						-- symbol class.
					i := right.item
					from stop := False until stop or j > nb loop
						symbol := symbol_class.item (j)
						if symbol > i then
							stop := True
						elseif symbol = i and not flags.item (i) then
								-- We found an old companion of
								-- `k'-th symbol in the symbol class.
								-- Link it into the new equivalence
								-- class and flag it as having been
								-- processed.
							new_cell.put_right (right)
							new_cell := right
								-- Set flag so we don't reprocess it.
							flags.put (True, j)
								-- Get next equivalence class member.
							next_ec := True
							stop := True
						else
							j := j + 1
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
					old_cell.forget_right
				end
				new_cell.forget_right
					-- Find next symbol class member to process.
				from
					k := k + 1
				until
					k > nb or else not flags.item (k)
				loop
					k := k + 1
				end
			end
		end

feature -- Conversion

	to_table: ARRAY [INTEGER] is
			-- Array of equivalence classes, indexed by symbols
		require
			built: built
		local
			i, nb: INTEGER
		do
			!! Result.make (lower, upper)
			nb := upper
			from i := lower until i > nb loop
				Result.put (storage.item (i).item, i)
				i := i + 1
			end
		ensure
			table_not_void: Result /= Void
			table_lower_set: Result.lower = lower
			table_upper_set: Result.upper = upper
			-- forall i in `lower' .. `upper',
			-- Result.item (i) = equivalence_class (i)
		end

	to_array (l, u: INTEGER): ARRAY [INTEGER] is
			-- Slice of array equivalence classes, indexed by symbols;
			-- Entries out of bounds `lower'..`upper' are set to 0
		require
			built: built
			valid_bounds: l <= u + 1
		local
			i, nb: INTEGER
		do
			!! Result.make (l, u)
			nb := upper.min (u)
			from i := lower.max (l) until i > nb loop
				Result.put (storage.item (i).item, i)
				i := i + 1
			end
		ensure
			array_not_void: Result /= Void
			array_lower_set: Result.lower = l
			array_upper_set: Result.upper = u
			-- forall i in lower.max (l)..upper.min (u),
			--		Result.item (i) = equivalence_class (i)
			-- forall i in l..lower-1 or upper+1..u, Result.item (i) = 0
		end

feature {NONE} -- Implementation

	storage: ARRAY [DS_BILINKABLE [INTEGER]]
			-- Equivalence class numbers indexed by symbol

invariant

	storage_not_void: storage /= Void
	valid_bounds: lower <= upper
	positive_count: count >= 0
	built_definition: built = (count /= 0)

end -- class LX_EQUIVALENCE_CLASSES
