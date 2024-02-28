class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :check_in ,presence:true
    validates :check_out ,presence:true
    validates :how_many_people ,presence:true, numericality:{greater_than_or_equal_to: 1}
    validate :today_check
    validate :start_end_check
    
    def today_check
        return false if check_in.blank?
        if check_in < Date.today
            errors.add(:check_in, "は今日以降の日付を選択してください")
        end
    end
    def start_end_check
        return false if check_in.blank? || check_out.blank?
        if check_out < check_in
            errors.add(:check_out, "はチェックイン日以降の日付を選択してください")
        end
    end

    def how_many_days
        (self.check_out - self.check_in).to_i
    end

    def total_price
        (how_many_people * how_many_days * room.price).to_i
    end
end
