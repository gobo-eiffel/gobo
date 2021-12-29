note

	description:

	"[
		Eiffel iteration cursors, of the form `@i`, associated with the
		iteration item `i`, as in `across table as i all @i.key.is_valid end`.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ITERATION_CURSOR

inherit

	ET_EXPRESSION
		redefine
			is_never_void,
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make (a_item_name: like item_name)
			-- Create a new iteration cursor associated with iteration item `a_item_name'.
		require
			a_item_name_not_void: a_item_name /= Void
		do
			at_symbol := tokens.at_symbol
			item_name := a_item_name
		ensure
			item_name_set: item_name = a_item_name
		end

feature -- Access

	at_symbol: ET_SYMBOL
			-- '@' symbol

	item_name: ET_IDENTIFIER
			-- Iteration item name
			-- (`i` in `across list as i loop ... end`)

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := at_symbol.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := at_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := item_name
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := item_name.is_instance_free
		end

feature -- Setting

	set_at_symbol (a_at_symbol: like at_symbol)
			-- Set `at_symbol' to `a_at_symbol'.
		require
			a_at_symbol_not_void: a_at_symbol /= Void
		do
			at_symbol := a_at_symbol
		ensure
			at_symbol_set: at_symbol = a_at_symbol
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_iteration_cursor (Current)
		end

invariant

	at_symbol_not_void: at_symbol /= Void
	item_name_not_void: item_name /= Void

end
