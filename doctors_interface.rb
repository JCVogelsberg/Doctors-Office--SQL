require 'pg'
require './lib/doctors'
require './lib/patients'

DB = PG.connect({:dbname => doctor_office})

def welcome_screen

end
