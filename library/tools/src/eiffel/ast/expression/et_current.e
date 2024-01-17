note

	description:

		"Eiffel current entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

class ET_CURRENT

inherit

	ET_EXPRESSION
		undefine
			first_position,
			last_position,
			break
		redefine
			is_current,
			is_never_void,
			is_instance_free
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

	is_current: BOOLEAN = True
			-- Is current expression the 'Current' entity (possibly parenthesized)?

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := False
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
