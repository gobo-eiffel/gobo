indexing

    description:

        "manages GEANT_ATTRIBUTEs. This class is used by GEANT_ELEMENT"

    library:    "geant/xml"
    author:     "Sven Ehrke"
    copyright:  "Copyright (c) 2000, Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"

class GEANT_ATTRIBUTE_HANDLER
feature -- creation
make is
	do
		!!attributes.make(0)
	end

feature -- attributes
set_attribute(a_attribute : GEANT_ATTRIBUTE) is
	-- appends a_attribute to the internal list if it is not part of the list yet
	--!!WRONG otherwise a_attribute replaces the old GEANT_ATTRIBUTE assigned to
	-- a_attribute.name
	require
		valid_attribute : a_attribute /= void
		-- unique_attribute: not attributes.has(a_attribute)
	do
		attributes.force_last(a_attribute)
	end

add_attributes(a_attributes : GEANT_ATTRIBUTE_LIST) is
	-- adds all attributes to the current element
	local
		i	: INTEGER
		attr: GEANT_ATTRIBUTE
	do
		from i := 1 until i > a_attributes.count loop
	        attr := a_attributes.item(i)
			set_attribute(attr)

       		i := i + 1
		end
	end


get_attributevalue_by_name(a_attribute_name : UC_STRING) : UC_STRING is
	require
		valid_attribute_name :	a_attribute_name /= void and then
								a_attribute_name.count > 0
	local
		attr	: GEANT_ATTRIBUTE
	do
		attr := get_attribute_by_name(a_attribute_name)
		Result := attr.value
	ensure
		valid_result	: Result /= void
	end

get_attribute_by_name(a_attribute_name : UC_STRING) : GEANT_ATTRIBUTE is
    require
        valid_attribute_name :	a_attribute_name /= void and then
								a_attribute_name.count > 0
	do
		Result := try_to_get_attribute_by_name(a_attribute_name)

	ensure
		attribute_found : Result /= void
	end

try_to_get_attribute_by_name(a_attribute_name : UC_STRING) : GEANT_ATTRIBUTE is
    require
        valid_attribute_name : a_attribute_name /= void and then a_attribute_name.count > 0
	local
		i		: INTEGER
		attr	: GEANT_ATTRIBUTE
		found	: BOOLEAN
	do
	-- implementation notes:
	-- loop over all attributes to find the right one.
	-- usually a hashtable is used for these kind of things and
	-- actually the attributes have been in one in the XML_HANDLER
	-- But: since an element usually just has a few attributes looping
	-- does not matter here.

		from i := 1 until found or else i > attributes.count loop
			attr := attributes.item(i)

			if attr.name.is_equal(a_attribute_name) then
				Result := attr
				found := true
			end
			i := i + 1
		end	-- loop

	end

has_attribute(a_attribute_name : UC_STRING) : BOOLEAN is
	do
	Result := try_to_get_attribute_by_name(a_attribute_name) /= void
	end

feature -- ID
has_ID : BOOLEAN is
	do
		Result := try_to_get_attribute_by_name(C_ID) /= void
	end

get_ID : UC_STRING is
	require
		has_ID
	do
		Result := get_attributevalue_by_name(C_ID)
	end

feature -- IDREF
has_IDREF : BOOLEAN is
	do
		Result := try_to_get_attribute_by_name(C_IDREF) /= void
	end

get_IDREF : UC_STRING is
	require
		has_IDREF
	do
		Result := get_attributevalue_by_name(C_IDREF)
	end

attributes	: DS_ARRAYED_LIST [GEANT_ATTRIBUTE]


feature -- attributes and setters

feature {NONE} -- internal
C_ID			: UC_STRING is once !!Result.make_from_string("ID") end
C_IDREF			: UC_STRING is once !!Result.make_from_string("IDREF") end

end


