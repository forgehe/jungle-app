require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(
        first_name: "richard",
        last_name: "neat",
        email: "neato@gmail.com",
        password: "neatpass",
        password_confirmation: "neatpass")
    }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      # p subject
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end
  
    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
     
      # p subject.errors.full_messages
    end
  
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end


    it "is not valid with an existing email" do
      described_class.create(
        first_name: "richard0",
        last_name: "neat0",
        email: "neato@gmail.com",
        password: "neatpass0",
        password_confirmation: "neatpass0")
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
  
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without a password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid without a password under 8 chars" do
      subject.password = "neatpa"
      subject.password_confirmation = "neatpa"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      described_class.create(
        first_name: "richard",
        last_name: "neat",
        email: "neato@gmail.com",
        password: "neatpass",
        password_confirmation: "neatpass")
    end

    it "is valid with valid attributes" do
      input = described_class.authenticate_with_credentials("neato@gmail.com", "neatpass")
      expect(input).to_not be_nil
    end
    
    it "is returns nil with wrong credentials" do
      input = described_class.authenticate_with_credentials("NOTneato@gmail.com", "NOTneatpass")
      expect(input).to be_nil
    end
    
    it "is returns nil with wrong credentials" do
      input = described_class.authenticate_with_credentials("neato@gmail.com", "NOTneatpass")
      expect(input).to be_nil
    end

    it "is returns user with spaces" do
      input = described_class.authenticate_with_credentials("  neato@gmail.com        ", "neatpass")
      expect(input).to be_nil
    end

    it "is returns user with wrong case" do
      input = described_class.authenticate_with_credentials("NEATO@gmail.com", "neatpass")
      expect(input).to be_nil
    end
  end
end
