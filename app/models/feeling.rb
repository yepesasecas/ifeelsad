class Feeling < ActiveRecord::Base
  belongs_to :country
  
  scope :with_message, -> { where("message != '' and message != ' '").order(:created_at) }
end
