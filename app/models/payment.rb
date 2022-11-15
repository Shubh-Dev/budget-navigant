class Payment < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_and_belongs_to_many :groups, join_table: :groups_payments, class_name: 'Group', foreign_key: 'payment_id', association_foreign_key: 'group_id', dependent: :destroy

    validates :name, :amount, presence: true
    
end
