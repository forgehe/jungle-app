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
      p subject
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
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

  end
end
