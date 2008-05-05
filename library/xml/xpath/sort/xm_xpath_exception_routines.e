indexing

	description:

"[
		Routines for handling exceptioms within the XPath and XSLT libraries.
		Note that no exceptions actually leak out to the interface.
		This class is necessary as not all XPath atomic values are comparable.
		XSLT requires raising error XTDE1030 when this happens.
		The problem is that although XM_XPATH_ATOMIC_VALUE has a routine `are_comparable'
		as a pre-condition for routine `three_way_comparison', this is not checked
		by {DS_SORTER}.sort.
		So instead {XM_XPATH_ATOMIC_COMPARER}.less_than will make the check prior
		to calling `three_way_comparison', and raise an exception if the check fails.
		This exception will then be caught by routine `perform_sorting' of classes
		XM_XSLT_SORTED_NODE_ITERATOR and XM_XSLT_SORTED_ITERATOR, which will set the
		XTDE1030 error condition.
		This class provides for sharing the common features between these classes.
]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXCEPTION_ROUTINES

inherit

	ANY

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

feature -- Access

	Not_comparable_exception: STRING is "Not comparable"
			-- Exception error text for non-comparable atomic values

feature -- Status report

	is_non_comparable_exception: BOOLEAN is
			-- Is the exception a signal that two atomic values are not comparable?
		do
			Result := Exceptions.is_developer_exception_of_name (Not_comparable_exception)
		end

feature -- Basic operations

	raise_non_comparable_exception is
			-- Signal two atomic values are not comparable.
		do
			Exceptions.raise (Not_comparable_exception)
		end

end

