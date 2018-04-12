require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title, content, tag_list" do
    book = Book.new(
      title:'TEST',
      content: 'content_test',
      tag_list:'vehicle',)
    expect(book).to be_valid
  end
  it "is invalid without a title" do
    book = Book.new(title: nil)
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")    
  end
  it "is invalid with a duplicate title" do
    Book.create(
      title: 'DIC',
      content: 2000,
      tag_list: 'vehicle')
    book = Book.new(
      title: 'DIC',
      content: 3000,
      tag_list: vehicle,)
    book.valid?
    expect(book.errors[:title]).to include("has already been taken")
  end
  it "is invalid with title is 30 or more characters" do
    book = Book.new(title: 'a' * 31)
    book.valid?
    expect(book.errors[:title]).to include("is too long (maximum is 30 characters)")
  end
end