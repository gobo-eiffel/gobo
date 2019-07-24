note

	description:

		"Templates are a special type of proto. If a transition %
		%table is homogeneous or nearly homogeneous (all transitions %
		%go to the same destination) then the odds are good that %
		%future states will also go to the same destination state %
		%on basically the same symbol set. These homogeneous states %
		%are so common when dealing with large rule sets that they %
		%merit special attention. If the transition table were %
		%simply made into a proto, then (typically) each subsequent, %
		%similar state will differ from the proto for two %
		%out-transitions. One of these out-transitions will be that %
		%symbol on which the proto does not go to the common %
		%destination, and one will be that symbol on which the %
		%state does not go to the common destination. Templates, %
		%on the other hand, go to the common state on every %
		%transition symbol, and therefore cost only one difference"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TEMPLATE_LIST

inherit

	DS_LINKED_LIST [LX_TRANSITION_TABLE [LX_DFA_STATE]]
		rename
			make as make_list,
			put as list_put
		export
			{NONE}
				list_put,
				put_first,
				put_last,
				put_left,
				put_right,
				force,
				force_first,
				force_last,
				force_left,
				force_right,
				extend,
				extend_first,
				extend_last,
				extend_left,
				extend_right,
				append,
				append_first,
				append_last,
				append_left,
				append_right
		end

create

	make

feature {NONE} -- Initialization

	make (meta_equiv: like meta_equiv_classes)
			-- Create a new list of templates used for
			-- construction of compressed DFA tables.
		do
			make_list
			meta_equiv_classes := meta_equiv
		ensure
			meta_equiv_classes_set: meta_equiv_classes = meta_equiv
		end

feature -- Access

	meta_equiv_classes: detachable LX_EQUIVALENCE_CLASSES
			-- Meta equivalence classes which are sets of classes
			-- with identical transitions out of templates;
			-- Void if meta equivalence classes are not to be used

	equiv_template (template: like first): like first
			-- Conversion of `template' using the meta equivalence
			-- class number in place of transition label
		require
			template_not_void: template /= Void
			meta_equiv_classes_built: attached meta_equiv_classes as l_meta_equiv_classes implies l_meta_equiv_classes.built
		local
			i, j, nb: INTEGER
			target: detachable LX_DFA_STATE
		do
			if not attached meta_equiv_classes as l_meta_equiv_classes then
				Result := template
			else
				create Result.make (l_meta_equiv_classes.lower, l_meta_equiv_classes.upper)
				nb := template.upper
				from
					i := template.lower
				until
					i > nb
				loop
					if l_meta_equiv_classes.is_representative (i) then
						target := template.target (i)
						if target /= Void then
							j := l_meta_equiv_classes.equivalence_class (i)
							Result.set_target (target, j)
						end
					end
					i := i + 1
				end
			end
		end

feature -- Element change

	put (state, common_state: LX_DFA_STATE)
			-- Create a template entry based on `state',
			-- and connect the state to it.
		require
			state_not_void: state /= Void
			common_state_not_void: common_state /= Void
			transitions_not_void: state.transitions /= Void
		local
			transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]
			template: LX_TRANSITION_TABLE [LX_DFA_STATE]
			i, min_symbol, max_symbol: INTEGER
			symbol_class: LX_SYMBOL_CLASS
		do
			transitions := state.transitions
			min_symbol := transitions.lower
			max_symbol := transitions.upper
			create template.make (min_symbol, max_symbol)
			create symbol_class.make_empty
			from
				i := min_symbol
			until
				i > max_symbol
			loop
				if transitions.target (i) /= Void then
					template.set_target (common_state, i)
					symbol_class.add_character (i)
				end
				i := i + 1
			end
			put_last (template)
			if attached meta_equiv_classes as l_meta_equiv_classes then
				l_meta_equiv_classes.add (symbol_class)
			end
		end

invariant

	no_void_template: not has_void

end
