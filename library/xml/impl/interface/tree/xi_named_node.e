indexing

	description:

		"common anchestor for xml-nodes"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

deferred class XI_NAMED_NODE

inherit

	XI_NODE

feature {ANY} -- Access

	name: UC_STRING is
			-- name of node
		deferred
		end

	ns_prefix: UC_STRING is
		deferred
		end

	namespace: UC_STRING is
		deferred
		end

feature {ANY} -- Element change

	set_name (n: UC_STRING) is
		require
			n_not_void: n /= Void
		deferred
		end

	set_namespace (n: UC_STRING) is
		deferred
		end

	set_prefix (n: UC_STRING) is
		deferred
		end

invariant

	name_not_void: name /= Void

end -- XI_NAMED_NODE

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
