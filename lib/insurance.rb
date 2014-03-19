class Insurance

attr_reader :company_name

  def initialize(company_name)
    @company_name = company_name
  end

def self.all
    database = PG.connect({:dbname => 'doctor_office_test'})
    results = database.exec("SELECT company_name FROM insurance;")
    insurance_array = []
    results.each do |result|
      name = result['name']
      #binding.pry
      insurance_array << Insurance.new(result)
    end
    insurance_array[0]
  end

  def ==(another)
    self.company_name == another.company_name
  end

  def save
    DB.exec("INSERT INTO insurance (company_name) VALUES ('#{@company_name}');")
  end

end
