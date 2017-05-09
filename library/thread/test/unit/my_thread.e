class MY_THREAD

inherit

	THREAD

create

	make_with_agent

feature {NONE} -- Initialization

	make_with_agent (a_agent: PROCEDURE)
			-- Create a new thread object which with execute
			-- `a_agent' when launched.
		require
			a_agent_not_void: a_agent /= Void
		do
			action := a_agent
			make
		ensure
			action_set: action = a_agent
		end
		
feature -- Access

	action: PROCEDURE
			-- Action to be executed when current thread is launched

feature -- Basic operations

	execute
			-- <Precursor>
		do
			action.call ([])
		end

invariant

	action_not_void: action /= Void

end
