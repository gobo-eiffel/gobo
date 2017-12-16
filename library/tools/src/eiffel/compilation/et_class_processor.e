note

	description:

		"Eiffel class processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_PROCESSOR

inherit

	ET_AST_PROCESSOR
		rename
			make as make_ast_processor
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new processor for given classes.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			current_class := tokens.unknown_class
			system_processor := a_system_processor
		ensure
			system_processor_set: system_processor = a_system_processor
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

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Setting

	set_current_class (a_class: like current_class)
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
		ensure
			current_class_set: current_class = a_class
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

invariant

	current_class_not_void: current_class /= Void
	system_processor_not_void: system_processor /= Void

end
