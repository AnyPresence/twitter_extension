class Outage
  include Mongoid::Document
  include Mongoid::Timestamps
  include AP::TwitterExtension::Twitter
  
  # Field definitions
  
  field :"_id", as: :id, type: String

  field :"title", type: String

  field :"num_affected", type: Integer

  field :"latitude", type: Float

  field :"longitude", type: Float
     
  def save
    super
    Rails.logger.info "sending tweet. object id: #{self.id}"
    twitter_perform(self)
  end
end
