note

	description:

		"Implementation in the Bridge Pattern, %
		%with a reference back to its interface."

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DP_CALLBACK_IMPLEMENTATION

obsolete

	"[090423] This class does not work well in void-safe mode. Please stop using it."

inherit

	DP_IMPLEMENTATION
		redefine
			can_implement,
			implement
		end

feature {DP_INTERFACE} -- Status report

	can_implement (an_interface: DP_INTERFACE): BOOLEAN is
			-- Can current implementation implement `an_interface'?
		do
			Result := (interface = Void or else interface = an_interface)
		end

feature {DP_INTERFACE} -- Setting

	implement (an_interface: DP_INTERFACE) is
			-- Tell current implementation to implement `an_interface'?
		do
			interface := an_interface
		ensure then
			implemented: interface = an_interface
		end

feature {DP_INTERFACE} -- Implementation

	interface: detachable DP_INTERFACE
			-- Interface

invariant

	bidirectional: attached interface as l_interface implies l_interface.implementation = Current

end
