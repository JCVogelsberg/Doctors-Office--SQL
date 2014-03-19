require 'pg'
require 'pry'

class Doctor
  attr_reader :name, :specialty

  def initialize(attributes)
    @name = attributes['name']
    @specialty = attributes['specialty']
  end

  def self.all
    database = PG.connect({:dbname => 'doctor_office_test'})
    results = database.exec("SELECT * FROM doctors;")
    doc_array = []
    results.each do |x|
      name = x['name']
      doc_array << Doctor.new({'name' => 'Bill West', 'specialty' => 'endocrinologist'})
    end
    doc_array[0]
  end

  def save
    DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}');")
  end


  def ==(another)
    self.name == another.name
  end

end













