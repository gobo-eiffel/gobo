indexing

	description:

		"common anchestor for xml-nodes"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class XT_NAMED_NODE

inherit

	XI_NODE

	XT_NODE

feature {ANY} -- Access

	name: UC_STRING

	ns_prefix: UC_STRING

	namespace: UC_STRING

feature {ANY} -- Element change

	set_name (n: UC_STRING) is
		do
			name := n
		end

	set_namespace (n: UC_STRING) is
		do
			namespace := n
		end

	set_prefix (n: UC_STRING) is
		do
			ns_prefix := n
		end

end -- XT_NAMED_NODE

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
