class Registry < ApplicationRecord
  include AASM

  validates_presence_of :name, :location
  validates_uniqueness_of :name, scope: :location


  has_and_belongs_to_many :coordinators
  has_many :enrollments, dependent: :destroy
  has_many :participants, through: :enrollments
  
  aasm :column => 'status' do
    state :open, initial: true
    state :closed
  end
end
