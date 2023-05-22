class Enrollment < ApplicationRecord
  enum method_of_contact: %w{phone email} 
  
  belongs_to :participant
  belongs_to :registry
  belongs_to :coordinator
  
  validates_uniqueness_of :participant, scope: :registry

  def self.export_csv
    attributes = %w{name gender dob registry_name registry_location registry_status method_of_contact remarks}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      self.find_each do |enrollment|
        csv << [
          enrollment.participant.name, 
          enrollment.participant.gender, 
          enrollment.participant.dob, 
          enrollment.registry&.name, 
          enrollment.registry&.location, 
          enrollment.registry&.status, 
          enrollment.method_of_contact, 
          enrollment.remarks
        ]
      end
    end
  end
end
