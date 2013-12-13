class Comment < ActiveRecord::Base
  attr_accessible :comment 

  belongs_to :flit
  belongs_to :user
  validate :comment, :presence => true
  has_many :likes, :as => :liker, :dependent => :destroy

    

  
end



