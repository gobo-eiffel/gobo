note

	description:
	
		"LSP symbol kind sets"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_KIND_SET

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_value_set: like value_set)
			-- Create a new symbol kind set.
		do
			value_set := a_value_set
		ensure
			value_set_set: value_set = a_value_set
		end

feature -- Access

	value_set: detachable LS_SYMBOL_KIND_LIST
			-- The symbol kind values the client supports. When this
			-- property exists the client also guarantees that it will
			-- handle values outside its set gracefully and falls back
			-- to a default value when unknown.
			--
			-- If this property is not present the client only supports
			-- the symbol kinds from `File` to `Array` as defined in
			-- the initial version of the protocol.

feature -- Field names

	value_set_name: STRING_8 = "valueSet"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_kind_set (Current)
		end

end
