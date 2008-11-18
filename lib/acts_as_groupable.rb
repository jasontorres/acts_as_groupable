module Groupable #:nodoc:

  def self.included(base)
    base.extend ClassMethods  
  end

  module ClassMethods
    def acts_as_groupable
      has_and_belongs_to_many :groups
      include Groupable::InstanceMethods
    end
  end
  
  module InstanceMethods
    def join_group(group)
      groups << group
    end
    
    def leave_group(group)
      groups.find(group).destroy
    end
  end
      
end

ActiveRecord::Base.send(:include, Groupable)