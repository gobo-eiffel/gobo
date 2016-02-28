note

	description:

		"Eiffel conversion-to expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_TO_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION
		redefine
			process
		end

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		rename
			target as expression
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression; a_feature: like convert_feature)
			-- Create a new conversion expression.
		require
			e_not_void: e /= Void
			a_feature_not_void: a_feature /= Void
		do
			expression := e
			convert_feature := a_feature
		ensure
			expression_set: expression = e
			convert_feature_set: convert_feature = a_feature
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name
		do
			Result := convert_feature.name
		ensure then
			definition: Result = convert_feature.name
		end

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments
		do
		ensure then
			no_arguments: Result = Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_convert_to_expression (Current)
		end

end
