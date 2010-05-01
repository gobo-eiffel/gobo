note

	description:

		"Eiffel conversion-from expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_FROM_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION
		undefine
			is_never_void
		redefine
			process
		end

	ET_CREATION_EXPRESSION

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_feature: like convert_feature; e: like expression) is
			-- Create a new conversion expression.
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
			-- Creation type

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
			Result := expression
		ensure then
			defintion: Result = expression
		end

	type_position: ET_POSITION is
			-- Position of `type';
			-- Because the type does not appear explicitly in the class text,
			-- use the position of `expression' instead.
		do
			Result := expression.position
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_from_expression (Current)
		end

end
