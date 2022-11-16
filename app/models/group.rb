class Group < ApplicationRecord
    has_and_belongs_to_many :payments, dependent: :destroy
    belongs_to :user 

    validates :name, :icon, presence: true
    validates :name, uniqueness: true
    validates :description, length: { maximum: 255 }

    def total_amount
        return payments.sum(:amount)
    end

    def most_recent_group_payment
        return payments.order(created_at: :desc).first
    end

    def most_ancient_group_payment
        return payments.order(created_at: :asc).first
    end
end
