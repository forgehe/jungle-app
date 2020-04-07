require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    # category = Category.new(name: "Chairs")
    # product = Product.new(:name => "Chair", :price => 20, :quantity => 2, :category => category)
    subject {
      described_class.new(
        name: "Chair",
        price: 2000,
        quantity: 2,
        category: Category.new(name: "neato"))
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
      p subject
    end
  
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end
  
    it "is not valid without a price_cents" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
      expect(subject.errors.full_messages).to include("Price is not a number")
      expect(subject.errors.full_messages).to include("Price cents is not a number")
     
      # p subject.errors.full_messages
    end
  
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end
  
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  
  end
end

