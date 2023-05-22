class Coordinator < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  has_and_belongs_to_many :registries
  has_many :enrollments, dependent: :destroy
  has_many :participants, through: :enrollments

end
