indexing

	description:

		".NET name and signature equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_SIGNATURE_TESTER

inherit

	KL_EQUALITY_TESTER [ET_DOTNET_FEATURE]
		redefine
			test
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new tester.
		do
		end

feature -- Status report

	test (v, u: ET_DOTNET_FEATURE): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- Do they have the same .NET name and the same signature?
		local
			l_arguments, other_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type, other_type: ET_TYPE
			l_class_impl, other_class_impl: ET_CLASS
			i, nb: INTEGER
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			elseif v.dotnet_name.same_string (u.dotnet_name) then
				Result := True
				l_type := v.type
				other_type := u.type
				l_class_impl := v.implementation_class
				other_class_impl := u.implementation_class
				if l_type = Void then
					if other_type /= Void then
						Result := False
					end
				elseif other_type = Void then
					Result := False
				elseif not l_type.same_syntactical_type (other_type, other_class_impl, l_class_impl) then
					Result := False
				end
				l_arguments := v.arguments
				other_arguments := u.arguments
				if l_arguments = Void or else l_arguments.is_empty then
					if other_arguments /= Void and then not other_arguments.is_empty then
						Result := False
					end
				elseif other_arguments = Void or else other_arguments.count /= l_arguments.count then
					Result := False
				else
					nb := l_arguments.count
					from i := 1 until i > nb loop
						if not l_arguments.formal_argument (i).type.same_syntactical_type (other_arguments.formal_argument (i).type, other_class_impl, l_class_impl) then
							Result := False
							i := nb + 1
						else
							i := i + 1
						end
					end
				end
			end
		end

end
