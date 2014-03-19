require 'spec_helper'

describe Doctor do
  describe 'initialize' do
    it 'initializes with a doctor name' do
      test_doctor = Doctor.new({'name' => 'Bill West', 'specialty' => 'endocrinologist'})
      test_doctor.should be_an_instance_of Doctor
    end

    it 'returns a doctors name' do
      test_doctor = Doctor.new({'name' => 'Bill West', 'specialty' => 'endocrinologist'})
      test_doctor.name.should eq 'Bill West'
    end

    it "returns a doctor's specialty" do
      test_doctor = Doctor.new({'name' => 'Bill West', 'specialty' => 'endocrinologist'})
      test_doctor.specialty.should eq 'endocrinologist'
    end

    it "lets you save a doctor's name to the database" do
      test_doctor = Doctor.new({'name' => 'Bill West', 'specialty' => 'endocrinologist'})
      test_doctor.save
      Doctor.all.should eq test_doctor
    end
  end

end
