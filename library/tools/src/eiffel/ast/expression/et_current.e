note

	description:

		"Eiffel current entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2026, Eric Bezault and others"
	license: "MIT License"

class ET_CURRENT

inherit

	ET_CURRENT_OPERAND
		undefine
			add_old_expressions,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			first_position,
			last_position,
			break
		end

	ET_EXPRESSION
		undefine
			is_current,
			is_instance_free,
			first_position,
			last_position,
			break
		redefine
			is_never_void
		end

	ET_KEYWORD
		rename
			make_current as make
		undefine
			is_current,
			is_false,
			is_true
		redefine
			process
		end

create

	make

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		do
			Result := position.line
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_current (Current)
		end

invariant

	is_current: is_current

end
