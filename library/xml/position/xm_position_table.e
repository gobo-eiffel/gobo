-- very slow implementation for now, needs improvement
class
   XM_POSITION_TABLE
creation
   make
feature {ANY}
   make is
      do
	 !! table.make
      end

feature {ANY}
   put (pos: XM_POSITION; node: XM_NODE) is
      local
	 pair: DS_PAIR [XM_POSITION, XM_NODE]
      do
	 !! pair.make (pos, node)
	 table.put_last (pair)
      end
   
   has (node: XM_NODE): BOOLEAN is
      local
	 cs: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
      do
	 from
	    cs := table.new_cursor
	    cs.start
	 until
	    cs.off or Result = True
	 loop
	    if
	       cs.item.second = node
	     then
	       Result := True
	    else
	       cs.forth
	    end
	 end
      end
   
   item (node: XM_NODE): XM_POSITION is
      require
	 has_node: has (node)
      local
	 cs: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
      do
	 from
	    cs := table.new_cursor
	    cs.start
	 until
	    cs.off or Result /= Void
	 loop
	    if
	       cs.item.second = node
	     then
	       Result := cs.item.first
	    else
	       cs.forth
	    end
	 end
      ensure
	 result_not_void: Result /= Void
      end
   
feature {NONE}
   
   table: DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]]
end -- class XM_POSITION_TABLE
   

   
