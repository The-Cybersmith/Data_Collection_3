class Threat < ApplicationRecord
  #This file was generated by "bin/rails generate model Threat name:string email:string severity:string"
  class Threat < ApplicationRecord
    # Name restrictions.
    validates :name, uniqueness: false, length: {minimum: 2}
    # Email restrictions.
    validates :email, uniqueness: false, format: { with: URI::MailTo::EMAIL_REGEXP}
    # Severity Restriction
    validates :severity, inclusion: {in: Globals::ModelConstraints::Severities}
  end
end