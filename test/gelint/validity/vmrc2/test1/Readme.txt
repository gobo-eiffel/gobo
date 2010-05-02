VALIDITY VMRC

ETL2 p.191, ETR p.43:
----------------------------------------------------------------------
It is valid for a class D to be a repeated descendant of a class A if
and only if D satifies the following two conditions for every feature
f of A:
1. If the Repeated Inheritance rule implies that f will be shared in
   D, then all the inherited versions of f are the same feature.
2. If the Repeated Inheritance rule implies that f will be replicated
   in D and f is potentially ambiguous, then the Select subclause of
   exactly one of the Parent parts of D lists the corresponding
   version of f, under its final D name.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
BB is a repeated descendant of CC and feature CC.f is replicated,
but it is not listed in the Select subclause of any of the two
parents of BB. Validity VMRC-2 is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     FAILED    Arbitrarily selected CC2.f2.
Halstenbach 3.2:       OK
gelint:                OK
----------------------------------------------------------------------


TEST CLASSES:
----------------------------------------------------------------------
class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			!! b
			b.f1
			b.f2
			c := b
			c.f
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC1

	CC2

end -- class BB
----------------------------------------------------------------------
class CC

feature

	f
		do
			print ("CC%N")
		end

end -- class CC
----------------------------------------------------------------------
class CC1

inherit

	CC
		rename
			f as f1
		redefine
			f1
		end

feature

	f1
		do
			print ("CC1%N")
		end

end -- class CC1
----------------------------------------------------------------------
class CC2

inherit

	CC
		rename
			f as f2
		redefine
			f2
		end

feature

	f2
		do
			print ("CC2%N")
		end

end -- class CC2
----------------------------------------------------------------------
