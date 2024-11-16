note

	description:

		"Eiffel conversion-from expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2024, Eric Bezault and others"
	license: "MIT License"

class ET_CONVERT_FROM_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION
		undefine
			is_never_void
		end

	ET_CREATION_EXPRESSION
		undefine
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			name,
			arguments
		end

	ET_CREATION_CALL
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_feature: like convert_feature; e: like expression)
			-- Create a new conversion expression.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			e_not_void: e /= Void
		local
			l_name: ET_IDENTIFIER
			l_position: ET_POSITION
		do
			type := a_type
			convert_feature := a_feature
			expression := e
			create l_name.make (a_feature.name.name)
			l_name.set_seed (a_feature.name.seed)
			l_position := e.position
			l_name.set_position (l_position.line, l_position.column)
			name := l_name
		ensure
			type_set: type = a_type
			convert_feature_set: convert_feature = a_feature
			expression_set: expression = e
		end

feature -- Access

	type: ET_TYPE
			-- Creation type

	creation_call: ET_CREATION_CALL
			-- Call to creation procedure
		do
			Result := Current
		ensure then
			creation_call_not_void: Result /= Void
		end

	name: ET_FEATURE_NAME
			-- Feature name

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments
		do
			Result := expression
		ensure then
			defintion: Result = expression
		end

	type_position: ET_POSITION
			-- Position of `type';
			-- Because the type does not appear explicitly in the class text,
			-- use the position of `expression' instead.
		do
			Result := expression.position
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_convert_from_expression (Current)
		end

end
