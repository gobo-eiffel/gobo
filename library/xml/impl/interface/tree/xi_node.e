indexing
   description: "common anchestor for xml-nodes";
   status:			"See notice at end of class.";
   author:			"Andreas Leitner";

deferred class
   XI_NODE
inherit
   DP_IMPLEMENTATION

feature {ANY} -- Access

   parent: XM_COMPOSITE is
	 -- parent of this node. Only void
	 -- if this node is the root node
      deferred
      end


feature {ANY} -- Status


feature {ANY} -- Element change

   set_parent (a_parent: XM_COMPOSITE) is
	 -- make `a_parent' the new parent of this node.
      require
	 a_parent_not_void: a_parent /= Void
      deferred
      ensure
	 parent_set: parent = a_parent
      end

end -- class XI_NODE

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
