indexing

	description:

		"Eiffel class subprocessors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_SUBPROCESSOR

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_null_processor
		end

creation

	-- This class should be deferred

feature {NONE} -- Initialization

	make (a_processor: like class_processor) is
			-- Create a subprocessor to be run during
			-- `a_processor' compilation stage.
		require
			a_processor_not_void: a_processor /= Void
		do
			class_processor := a_processor
			make_null_processor (a_processor.universe)
		ensure
			class_processor_set: class_processor = a_processor
			universe_set: universe = a_processor.universe
		end

feature -- Access

	class_processor: ET_CLASS_PROCESSOR
			-- Associated class processor

	current_class: ET_CLASS is
			-- Class where the type appears
		do
			Result := class_processor.current_class
		ensure
			definition: Result = class_processor.current_class
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			class_processor.set_fatal_error (a_class)
		end

invariant

	class_processor_not_void: class_processor /= Void

end
