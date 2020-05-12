class Conversation < ApplicationRecord
  has_many :messages

  before_validation :set_name
  validates_uniqueness_of :name
  validates_presence_of :name, :user1_id, :user2_id

  def set_name
    self.name = channel_name
  end
  def channel_name
      return "#{user1_id}_#{user2_id}" if user1_id < user2_id
      "#{user2_id}_#{user1_id}"
  end
end
