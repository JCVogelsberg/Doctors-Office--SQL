require 'pg'
require 'rspec'
require './lib/doctors'
require './lib/patients'
require './lib/insurance'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end

DB = PG.connect({:dbname => 'doctor_office_test'})
