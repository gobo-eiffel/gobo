note

	description:

		"Eiffel conversion-to expressions to be made explicit"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPLICIT_CONVERT_TO_EXPRESSION

inherit

	ET_CONVERT_TO_EXPRESSION
		rename
			make as make_convert_to_expression
		redefine
			process
		end

	ET_EXPLICIT_CONVERT_EXPRESSION

create

	make

feature {NONE} -- Initialization

	make (e: like expression; a_feature: like convert_feature; a_source_type: like source_type; a_target_type: like target_type)
			-- Create a new conversion expression.
		require
			e_not_void: e /= Void
			a_feature_not_void: a_feature /= Void
			a_source_type_not_void: a_source_type /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			source_type := a_source_type
			target_type := a_target_type
			make_convert_to_expression (e, a_feature)
		ensure
			expression_set: expression = e
			convert_feature_set: convert_feature = a_feature
			source_type_set: source_type = a_source_type
			target_type_set: target_type = a_target_type
		end

feature -- Access

	source_type: ET_TYPE
			-- Type of `expression'

	target_type: ET_TYPE
			-- Expected type for `expression' (after conversion)

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_explicit_convert_to_expression (Current)
		end

invariant

	source_type_not_void: source_type /= Void
	target_type_not_void: target_type /= Void

end
