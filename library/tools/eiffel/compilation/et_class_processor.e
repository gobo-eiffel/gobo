note

	description:

		"Eiffel class processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_PROCESSOR

inherit

	ET_AST_PROCESSOR
		redefine
			make
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature {NONE} -- Initialization

	make
			-- Create a new processor for given classes.
		do
			current_class := tokens.unknown_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Class being processed

	current_universe: ET_UNIVERSE
			-- Universe to which `current_class' belongs
		do
			Result := current_class.universe
		ensure
			current_universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
		do
			Result := current_class.current_system
		ensure
			current_system_not_void: Result /= Void
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := current_system.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

invariant

	current_class_not_void: current_class /= Void

end
