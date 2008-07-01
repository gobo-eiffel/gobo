indexing

	description:

		"Eiffel built-in conversion expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_BUILTIN_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_feature: like convert_feature; e: like expression) is
			-- Create a new built-in conversion expression.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			e_not_void: e /= Void
		do
			type := a_type
			convert_feature := a_feature
			expression := e
		ensure
			type_set: type = a_type
			convert_feature_set: convert_feature = a_feature
			expression_set: expression = e
		end

feature -- Access

	type: ET_TYPE
			-- Conversion type

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_builtin_expression (Current)
		end

invariant

	type_not_void: type /= Void

end
