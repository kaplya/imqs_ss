# The Journal Framework
# 
# There can be many kinds of journals (e.g. Inventory Journal, Ledger Journal, Asset Journal, etc.), but all of them have something 
# in common, they have lines, they can be posted, checked, or something else. 
# This framework describes such behaviour.
module AF
	class Journal
	  @journal
	  attr_accessor :journal

	  def self.make journal
	  	case journal.Class
	  	when InventJournal then obj = AF::InventJournal 
	  		
	  	end

	  	return obj
	  end

	  def post
	  	self.post_now if self.can_post?
	  end


	end

	class InventJournal < Journal
	  def can_post?

	  end
	end

end

