indexing

	description:

		"Xace universe parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_UNIVERSE_PARSER

inherit

	ET_XACE_SYSTEM_PARSER
		rename
			last_system as last_universe,
			new_system as new_universe
		redefine
			last_universe, new_universe
		end

creation

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory, make_standard

feature -- Access

	last_universe: ET_XACE_UNIVERSE
			-- Universe being parsed

feature {NONE} -- Xace AST factory

	new_universe (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_UNIVERSE is
			-- New class universe build from `an_element'
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
		do
			an_error_handler := new_eiffel_error_handler
			a_factory := new_eiffel_ast_factory
			create Result.make_with_factory (Void, a_factory, an_error_handler)
			fill_system (Result, an_element, a_position_table)
			Result.mount_libraries
		end

feature {NONE} -- Eiffel AST factory

	new_eiffel_ast_factory: ET_AST_FACTORY is
			-- New Eiffel AST factory
		do
			if eiffel_ast_factory /= Void then
				Result := eiffel_ast_factory
			else
				create Result.make
			end
		ensure
			eiffel_ast_factory_not_void: Result /= Void
		end

	new_eiffel_error_handler: ET_ERROR_HANDLER is
			-- New Eiffel error handler for Eiffel parser
		do
			if eiffel_error_handler /= Void then
				Result := eiffel_error_handler
			else
				create Result.make_standard
			end
		ensure
			eiffel_error_handler_not_void: Result /= Void
		end

feature -- Configuration

	eiffel_ast_factory: ET_AST_FACTORY
			-- Return this AST factory in `new_eiffel_ast_factory'
			-- if not void

	eiffel_error_handler: ET_ERROR_HANDLER
			-- Return this error handler in `new_eiffel_error handler'
			-- if not void

feature -- Configuration setting

	set_eiffel_ast_factory (a_factory: like eiffel_ast_factory) is
			-- Set `eiffel_ast_factory' to `a_factory'.
		do
			eiffel_ast_factory := a_factory
		ensure
			eiffel_ast_factory_set: eiffel_ast_factory = a_factory
		end

	set_eiffel_error_handler (a_handler: like eiffel_error_handler) is
			-- Set `eiffel_error_handler' to `a_handler'.
		do
			eiffel_error_handler := a_handler
		ensure
			eiffel_error_handler_set: eiffel_error_handler = a_handler
		end

end
