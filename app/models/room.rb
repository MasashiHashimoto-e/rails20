class Room < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    belongs_to :user
    has_many :reservations, dependent: :destroy


    validates :name,presence: true
    validates :introduction,presence: true
    validates :price,presence: true, numericality:{greater_than_or_equal_to: 1}
    validates :address,presence: true

    def self.ransackable_attributes(auth_object = nil)
      ["name", "address","introduction"]
  end

  def self.ransackable_associations(auth_object = nil)
      ["reservations", "user"]
  end
end
