indexing

    description:

        "supports handling of list of attributes"

    library:    "geant/xml"
    author:     "Sven Ehrke"
    copyright:  "Copyright (c) 2000, Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"

class GEANT_ATTRIBUTE_LIST
	inherit DS_ARRAYED_LIST [GEANT_ATTRIBUTE]
	rename make as ds_arrayed_list_make
	end

creation
	make_from_hashtable, make_from_ds_bilinear

feature -- creation
make_from_hashtable(a_attributes : DS_HASH_TABLE[UC_STRING, UC_STRING]) is
  local
    cursor  : DS_HASH_TABLE_CURSOR[UC_STRING, UC_STRING]
    attr    : GEANT_ATTRIBUTE

  do
	ds_arrayed_list_make(10)
    from
      cursor := a_attributes.new_cursor
      cursor.start
    until
      cursor.after
    loop
      !!attr.make(cursor.key, cursor.item)
      force_last(attr)
      cursor.forth
    end
  cursor.finish

  end

make_from_ds_bilinear(a_attributes : DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
	local
	    cs: DS_BILINEAR_CURSOR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
	    attr    : GEANT_ATTRIBUTE
	do
	ds_arrayed_list_make(10)
  	 from
	    cs := a_attributes.new_cursor
  	    cs.start
  	 until
  	    cs.off
	 loop
		!!attr.make(cs.item.first.first, cs.item.second)
		force_last(attr)

  	    cs.forth
  	 end
	end



feature -- development
show is
  local
    attr    : GEANT_ATTRIBUTE
    i       : INTEGER
  do
   	 from i := 1 until i > count loop
        attr := item(i)
        print(attr.name + "=" + "%"" + attr.value + "%"%N")
        i := i + 1
   	  end
	end

ucs_empty			: UC_STRING is once !!Result.make_from_string("") end

end -- class GEANT_ATTRIBUTE_LIST

