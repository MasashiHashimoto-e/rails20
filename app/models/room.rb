class Room < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    belongs_to :user
    has_many :reservations, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
      ["name", "address","introduction"]
  end

  def self.ransackable_associations(auth_object = nil)
      ["reservations", "user"]
  end
end
