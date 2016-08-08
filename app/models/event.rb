class Event < ActiveRecord::Base
	belongs_to :audience
	mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  validates :event_start_date, presence: true
  validates :event_finish_date, presence: true
  self.per_page = 3
end
