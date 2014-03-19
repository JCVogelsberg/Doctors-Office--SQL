require 'spec_helper'

describe Insurance do
  describe "initialize" do
    it "is an instance of the Insurance class" do
      test_insurance = Insurance.new('Red Shield')
      test_insurance.should be_an_instance_of Insurance
    end

    it "initializes with an insurance company name" do
      test_insurance = Insurance.new('Red Shield')
      test_insurance.company_name.should eq 'Red Shield'
    end

    it "is the same if the insurance company name is the same" do
      test_insurance1 = Insurance.new('Red Shield')
      test_insurance2 = Insurance.new('Red Shield')
      test_insurance1.should eq test_insurance2
    end

    it 'will save an insurance company to the database' do
      test_insurance = Insurance.new({'company_name' => 'Red Shield'})
      test_insurance.save
      Insurance.all.should eq test_insurance
    end
  end
end
