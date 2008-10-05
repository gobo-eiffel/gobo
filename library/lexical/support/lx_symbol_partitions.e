indexing

	description:

		"Equivalence classes of integer symbols; some of them %
		%possibly belonging to none of the equivalence classes"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_SYMBOL_PARTITIONS

inherit

	LX_EQUIVALENCE_CLASSES
		redefine
			make,
			initialize,
			put,
			add
		end

create

	make

feature {NONE} -- Initialization

	make (min, max: INTEGER) is
			-- Make structure to allow creation of a set of partitions
			-- for symbols within bounds `min'..`max'.
		do
			create symbols.make (min, max)
			precursor (min, max)
		end

feature -- Initialization

	initialize is
			-- Prepare structure to allow creation of a
			-- set of equivalence classes for symbols
			-- within bounds `lower'..`upper'.
			-- [This feature can be called to reset structure
			-- as it was after `make' creation procedure call.]
		do
			precursor
			symbols.clear_all
		end

feature -- Access

	symbols: ARRAY [BOOLEAN]
			-- Set of symbols that belong to one of the partitions;
			-- The entry at index `i' is False if symbol `i' belongs
			-- to none of the partitions

feature -- Status report

	has (symbol: INTEGER): BOOLEAN is
			-- Does `symbol' belong to one of the partition?
		require
			valid_symbol: valid_symbol (symbol)
		do
			Result := symbols.item (symbol)
		end

feature -- Element change

	put (symbol: INTEGER) is
			-- Create equivalence class for single `symbol'
			-- and record `symbol' as member of a partition.
		do
			symbols.put (True, symbol)
			precursor (symbol)
		ensure then
			has_symbol: has (symbol)
		end

	add (symbol_class: LX_SYMBOL_CLASS) is
			-- Update partition set based on `symbol_class'
			-- and record `symbol_class''s symbols as members
			-- of a partition.
		local
			i, j, nb, max, symbol: INTEGER
			symbol_table: ARRAY [BOOLEAN]
		do
			precursor (symbol_class)
			nb := symbol_class.count
			symbol_table := symbols
			if symbol_class.negated then
				j := lower - 1
				max := upper
				from
					i := 1
				until
					i > nb
				loop
					symbol := symbol_class.item (i)
					from
						j := j + 1
					until
						j >= symbol
					loop
						symbol_table.put (True, j)
						j := j + 1
					end
					i := i + 1
				end
				from
					j := j + 1
				until
					j > max
				loop
					symbol_table.put (True, j)
					j := j + 1
				end
			else
				from
					i := 1
				until
					i > nb
				loop
					symbol_table.put (True, symbol_class.item (i))
					i := i + 1
				end
			end
		end

invariant

	symbols_not_void: symbols /= Void
	symbols_lower: symbols.lower = lower
	symbols_upper: symbols.upper = upper

end
