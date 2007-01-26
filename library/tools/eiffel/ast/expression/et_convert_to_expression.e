indexing

	description:

		"Eiffel conversion-to expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_TO_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION
		redefine
			process
		end

	ET_FEATURE_CALL_EXPRESSION
		rename
			target as expression
		end

create

	make

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := convert_feature.name
		ensure then
			definition: Result = convert_feature.name
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		do
		ensure then
			no_arguments: Result = Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_to_expression (Current)
		end

end
