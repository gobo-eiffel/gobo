note

	description:

		"Eiffel conversion-from expressions to be made explicit"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPLICIT_CONVERT_FROM_EXPRESSION

inherit

	ET_CONVERT_FROM_EXPRESSION
		rename
			make as make_convert_from_expression
		redefine
			process
		end

	ET_EXPLICIT_CONVERT_EXPRESSION
		undefine
			is_never_void
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_feature: like convert_feature; e: like expression; a_source_type: like source_type)
			-- Create a new conversion expression.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			e_not_void: e /= Void
			a_source_type_not_void: a_source_type /= Void
		do
			source_type := a_source_type
			make_convert_from_expression (a_type, a_feature, e)
		ensure
			type_set: type = a_type
			convert_feature_set: convert_feature = a_feature
			expression_set: expression = e
			source_type_set: source_type = a_source_type
		end

feature -- Access

	source_type: ET_TYPE
			-- Type of `expression'

	target_type: ET_TYPE
			-- Expected type for `expression' (after conversion)
		do
			Result := type
		ensure then
			definition: Result = type
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_explicit_convert_from_expression (Current)
		end

invariant

	source_type_not_void: source_type /= Void
	target_type_not_void: target_type /= Void

end
