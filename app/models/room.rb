class Room < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    belongs_to :user

    def self.ransackable_attributes(auth_object = nil)
        ["name","introduction"] 
      end

      def self.ransackable_associations(auth_object = nil)
        ["user"] 
      end
end
