indexing
   description:         "Table of XML-attributes"
   status:		"See notice at end of class."
   author:		"Andreas Leitner"

class
   XM_NAMESPACE_TABLE

inherit
   DS_HASH_TABLE [UC_STRING, UC_STRING]
      rename
	 make as make_non_equal,
	 make_equal as make
      end

creation
   make

feature {ANY} -- Access
   
   
   has_default: BOOLEAN is
	 -- has table a default namespace?
	 -- note: in any given table there must be at most one 
	 -- default namespace
      do
	 search (uc_empty)
	 Result := found
      end
   
   default_ns: UC_STRING is
	 --  default namespace
      do
	 search (uc_empty)
	 Result := found_item
      end
   
feature {ANY} -- 
   
   override_with_list (l: DS_BILINEAR [XM_NAMESPACE]) is
	 -- take the namespace declarations from l and
	 -- integrated them in this table, if `l' has
	 -- an entry with a prefix that is already in
	 -- this table, overide it with the entry from the list
      require
	 l_not_void: l /= Void
      local
	 cs: DS_BILINEAR_CURSOR [XM_NAMESPACE]
      do
	 from
	    cs := l.new_cursor
	    cs.start
	 until
	    cs.off
	 loop
	    force (cs.item.uri, cs.item.ns_prefix)
	    cs.forth
	 end
      end
   
   
feature {ANY} -- Removal
   
feature {NONE} -- Implementation
   uc_empty: UC_STRING is
      once
	 !! Result.make_from_string ("")
      end
end -- class XM_NAMESPACE_TABLE
--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------
