note

	description:

		"Eiffel built-in conversion expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"

class ET_CONVERT_BUILTIN_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_feature: like convert_feature; e: like expression)
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

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_convert_builtin_expression (Current)
		end

invariant

	type_not_void: type /= Void

end
