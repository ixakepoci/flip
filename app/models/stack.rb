class Stack < ActiveRecord::Base
	has_many :cards, dependent: :destroy
	attr_accessible :user_id, :name, :description
  	belongs_to :user
  	default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true
  	validates :name, presence: true
end
