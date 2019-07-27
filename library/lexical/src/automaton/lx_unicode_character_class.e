note

	description:

		"Classes of Unicode characters"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_UNICODE_CHARACTER_CLASS

inherit

	LX_SYMBOL_CLASS

create

	make_unicode

feature -- Access

	symbol_classes: detachable DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]
			-- Unions (outer list) of the concatenations (inner lists) of symbol (bytes) classes
			-- corresponding to the current Unicode character set when the characters are encoded
			-- in UTF-8.
			-- Void if not determined yet.

feature -- Setting

	set_symbol_classes (a_symbol_classes: like symbol_classes)
			-- Set `symbol_classes' to `a_symbol_classes'.
		require
			symbol_classes_not_empty: a_symbol_classes /= Void implies not a_symbol_classes.is_empty
			no_void_symbol_class_concanetation: a_symbol_classes /= Void implies not a_symbol_classes.has_void
			no_empty_symbol_class_concatenation: a_symbol_classes /= Void implies not a_symbol_classes.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.is_empty)
			no_void_symbol_class: a_symbol_classes /= Void implies not a_symbol_classes.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.has_void)
		do
			symbol_classes := a_symbol_classes
		ensure
			symbol_classes_set: symbol_classes = a_symbol_classes
		end

invariant

	symbol_classes_not_empty: attached symbol_classes as l_symbol_classes implies not l_symbol_classes.is_empty
	no_void_symbol_class_concanetation: attached symbol_classes as l_symbol_classes implies not l_symbol_classes.has_void
	no_empty_symbol_class_concatenation: attached symbol_classes as l_symbol_classes implies not l_symbol_classes.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.is_empty)
	no_void_symbol_class: attached symbol_classes as l_symbol_classes implies not l_symbol_classes.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.has_void)

end
