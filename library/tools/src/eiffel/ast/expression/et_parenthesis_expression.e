note

	description:

	"[
		Eiffel parenthesis call expressions (call to the feature asociated with 'alias "()").
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"

class ET_PARENTHESIS_EXPRESSION

inherit

	ET_PARENTHESIS_CALL
		undefine
			parenthesis_call
		end

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		undefine
			reset
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parenthesis_expression (Current)
		end

end
