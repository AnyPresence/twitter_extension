class TweetOption < ActiveRecord::Base
  belongs_to :anypresence_extension_account
  
  validates :name, :presence => true
  validates :format, :presence => true
end
