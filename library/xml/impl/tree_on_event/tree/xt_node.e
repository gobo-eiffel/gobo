indexing
   description: "common anchestor for xml-nodes";
   status:			"See notice at end of class.";
   author:			"Andreas Leitner";

class
   XT_NODE
inherit
   XI_NODE

feature {ANY} -- Access

   parent: XM_COMPOSITE
	 -- parent of this node. Only void
	 -- if this node is the root node

feature {ANY} -- Element change

   set_parent (a_parent: XM_COMPOSITE) is
	 -- make `a_parent' the new parent of this node.
      do
	 parent := a_parent
      end

end -- XT_NODE

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
