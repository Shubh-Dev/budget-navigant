class Group < ApplicationRecord
    has_and_belongs_to_many :payments, join_table: :groups_payments, class_name: 'Payment', foreign_key: 'group_id', association_foreign_key: 'payment_id', dependent: :destroy
    belongs_to :users, class_name: 'User', foreign_key: 'user_id'

    validates :name, :icon, presence: true
end
