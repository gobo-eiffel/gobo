note

	description:

		"Eiffel labeled actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LABELED_ACTUAL_PARAMETER

inherit

	ET_ACTUAL_PARAMETER
		undefine
			is_last_entity
		redefine
			named_parameter_with_type
		end

	ET_ENTITY_DECLARATION
		rename
			name as label
		end

create

	make

feature {NONE} -- Initialization

	make (a_label: like label_item; a_type: like declared_type)
			-- Create a new labeled actual generic parameter.
		require
			a_label_not_void: a_label /= Void
			a_type_not_void: a_type /= Void
		do
			label_item := a_label
			declared_type := a_type
		ensure
			label_set: label_item = a_label
			declared_type_set: declared_type = a_type
		end

feature -- Access

	type: ET_TYPE
			-- Type of `actual_parameter'
		do
			Result := declared_type.type
		end

	label: ET_IDENTIFIER
			-- Label of `actual_parameter';
			-- Useful when part of a labeled tuple, Void if no label
		do
			Result := label_item.identifier
		end

	label_item: ET_LABEL
			-- Name (possibly followed by a comma)

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

	named_parameter (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- Same as current actual parameter but its type
			-- replaced by its named type
		local
			a_named_type: ET_NAMED_TYPE
			a_parameter: like Current
		do
			a_named_type := type.named_type (a_context)
			if a_named_type = type then
				Result := Current
			else
				create a_parameter.make (label_item, a_named_type)
				Result := a_parameter
			end
		end

	named_parameter_with_type (a_type: ET_NAMED_TYPE): ET_ACTUAL_PARAMETER
			-- Same as current actual parameter but its type
			-- replaced by `a_type'
		local
			a_parameter: like Current
		do
			if a_type = type then
				Result := Current
			else
				create a_parameter.make (label_item, a_type)
				Result := a_parameter
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := label_item.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := label_item.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := declared_type.last_leaf
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := declared_type.break
		end

feature -- Status report

	named_parameter_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named parameter of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			Result := type.named_parameter_has_class (a_class, a_context)
		end

feature -- Type processing

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_LABELED_ACTUAL_PARAMETER
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		local
			a_parameter: like Current
		do
			if a_type = type then
				Result := Current
			else
				create a_parameter.make (label_item, a_type)
				Result := a_parameter
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_labeled_actual_parameter (Current)
		end

invariant

	label_item_not_void: label_item /= Void
	declared_type_not_void: declared_type /= Void

end
