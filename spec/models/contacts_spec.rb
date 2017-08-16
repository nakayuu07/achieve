require 'rails_helper'

describe Contact do
  it "is valid with name,content,email" do
    contact = Contact.new(name: '中村', content: '暑いです', email:'aaa@bbb')
    expect(contact).to be_valid
  end

  it "is invalid without  name,content,email" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is valid with name" do
   contact = Contact.new
   contact.valid?
   expect(contact.errors[:name]).to include("を入力してください")
 end

 it "is valid with content" do
  contact = Contact.new
  contact.valid?
  expect(contact.errors[:content]).to include("を入力してください")
 end

 it "is valid with email" do
  contact = Contact.new
  contact.valid?
  expect(contact.errors[:email]).to include("を入力してください")
 end
end
