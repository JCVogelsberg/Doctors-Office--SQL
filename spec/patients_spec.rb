require 'spec_helper'

describe Patient do
  describe 'initialize' do
    it 'initializes with a patient name and birthday' do
      test_patient = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient.should be_an_instance_of Patient
    end

    it 'tells you a patients name' do
      test_patient = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient.name.should eq ('Sam Jones')
    end

    it 'tells you a patients birthday' do
      test_patient = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient.birthday.should eq ('1969-12-01')
    end

    # it 'tells you a patients doctor_id' do
    #   test_patient = Patient.new('Sam Jones', '1969-12-01')
    #   test_patient.id.should be_an_instance_of Fixnum
    # end

    it 'is the same patient if it has the same name AND birthday' do
      test_patient1 = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient2 = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-02'})
      test_patient1.should_not eq test_patient2
    end

    it 'is the same patient if it has the same name and birthday' do
      test_patient1 = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient2 = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient1.should eq test_patient2
    end

    it 'will save a patient to the database' do
      test_patient = Patient.new({'name' => 'Sam Jones', 'birthday' => '1969-12-01'})
      test_patient.save
      Patient.all.should eq test_patient
    end
  end
end




