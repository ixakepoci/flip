class Card < ActiveRecord::Base
  attr_accessible :back, :front, :stack_id
  belongs_to :stack
end
