indexing

	description:

		"represents a XML element"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_ELEMENT
	inherit
		GEANT_COMPOSITE [GEANT_ELEMENT]
			rename make as geant_composite_make
		end

		KL_IMPORTED_STRING_ROUTINES
		end
		
		GEANT_ATTRIBUTE_HANDLER
			rename make as am_make
		end
	creation
	make

feature -- creation
make(a_name : UC_STRING) is
    require
        valid_name : a_name /= void and then a_name.count > 0
	do
	geant_composite_make
	set_name(a_name)
	am_make
	set_content(ucs_empty)
	end

feature -- DOM manipulation
add_child(a_child : like Current) is
	require
		valid_child : a_child /= void
	do
	children.force_last(a_child)
	end

feature -- queries

get_child(a_name : UC_STRING) : GEANT_ELEMENT is
	-- returns the first child element within this element with the given local name
	-- and belonging to no namespace.
	require
		valid_name : a_name /= void and then a_name.count > 0
--		existing_child : -- has_child(a_name)
	local
		i		: INTEGER
		el		: GEANT_ELEMENT
		found	: BOOLEAN
	do
		from i := 1 until i > children.count or found loop
			el := children.item(i)
			if el.name.is_equal(a_name) then
				found := true
			end

       		i := i + 1
		end

		if found then
			Result := el
		end
	end

get_children_by_name(a_name : UC_STRING) : DS_ARRAYED_LIST [GEANT_ELEMENT] is
	-- return all direct child nodes which have the name 'a_name'
	require
		valid_name : a_name /= void and then a_name.count > 0

	local
		i	: INTEGER
		c	: INTEGER
		el	: GEANT_ELEMENT
	do
		!!Result.make(children.count)
		c := 1
		from i := 1 until i > children.count loop
			el := children.item(i)
			if el.name.is_equal(a_name) then
				Result.put(el, c)
				c := c + 1
			end

       		i := i + 1
		end
	end

feature -- attributes and setters
name		: UC_STRING
set_name(a_name : UC_STRING) is
    -- assigns 'a_name' to 'name'
    -- the client is responsible to clone 'a_name' before
    -- calling this routine if that's what he likes
    require
        valid_name : a_name /= void and then a_name.count > 0
    do
        name := a_name
    end

content	: UC_STRING
set_content(a_content : UC_STRING) is
    -- assigns 'a_content' to 'content'
    -- the client is responsible to clone 'a_content' before
    -- calling this routine if that's what he likes
    require
        valid_content : a_content /= void
    do
        content := a_content
    end


feature {NONE} -- internal
ucs_empty			: UC_STRING is once !!Result.make_from_string("") end

end

