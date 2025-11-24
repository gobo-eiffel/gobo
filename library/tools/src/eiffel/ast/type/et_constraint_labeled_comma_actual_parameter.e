note

	description:

		"Eiffel labeled actual parameters that appear in constraints of formal %
		%generic parameters. The names of the types have not been resolved yet, %
		%they may be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2014, Eric Bezault and others"
	license: "MIT License"

class ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER
		redefine
			type
		end

create

	make

feature {NONE} -- Initialization

	make (a_label: like label; a_comma: like comma; a_type: like type; a_class: like implementation_class)
			-- Create a new labeled actual parameter.
		require
			a_label_not_void: a_label /= Void
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		do
			label := a_label
			comma := a_comma
			type := a_type
			implementation_class := a_class
		ensure
			label_set: label = a_label
			comma_set: comma = a_comma
			type_set: type = a_type
			implementation_class_set: implementation_class = a_class
		end

feature -- Access

	label: ET_IDENTIFIER
			-- Label of actual parameter
			-- Useful when part of a labeled tuple, Void if no label

	comma: detachable ET_SYMBOL
			-- Comma

	type: ET_CONSTRAINT_TYPE
			-- Type

	implementation_class: ET_CLASS
			-- Class where the tuple label appears

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := label.position
		end

feature -- Conversion

	resolved_syntactical_constraint_with_type (a_type: detachable ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): detachable ET_ACTUAL_PARAMETER
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := a_parser.resolved_constraint_labeled_comma_actual_parameter (Current, a_type)
		end

invariant

	label_not_void: label /= Void
	implementation_class_not_void: implementation_class /= Void

end
