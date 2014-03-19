require 'pg'
require 'pry'


class Patient
  attr_reader :name, :birthday, :doctor_id

  def initialize(attributes)
    @name = attributes['name']
    @birthday = attributes['birthday']

  end

  def self.all
    database = PG.connect({:dbname => 'doctor_office_test'})
    results = database.exec("SELECT name, birthday::date FROM patients;")
    patient_array = []
    results.each do |result|
      name = result['name']
      #binding.pry
      patient_array << Patient.new(result)
    end
    patient_array[0]
  end

  def ==(another)
    self.name == another.name && self.birthday == another.birthday
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@birthday}') RETURNING id;")
  end

  # def id
  #   @id = id
  # end

end
