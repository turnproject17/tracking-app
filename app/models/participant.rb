require 'csv'
class Participant < ApplicationRecord
  validates_presence_of :name, :gender, :dob
  has_many :enrollments
  has_many :registries, through: :enrollments

  def self.aggregate_count
    ActiveRecord::Base.connection.execute("SELECT count(id) as count , date_trunc('year', participants.dob) as year FROM participants GROUP BY date_trunc('year', participants.dob)")
  end

  def self.count_by_coordinator
    ActiveRecord::Base.connection.execute("SELECT count(participants.id) as count, participants.gender , (select coordinators.email FROM coordinators where coordinators.id = enrollments.coordinator_id) as coordinator FROM participants LEFT OUTER JOIN enrollments ON enrollments.participant_id = participants.id GROUP BY coordinator, gender")
  end
end
