require 'rails_helper'

feature "Books", type: :feature do

  scenario 'show message - Wellcome' do
    visit(root_path)
    expect(page).to have_content('Wellcome')
  end

  let!(:book) { Fabricate(:book) }

  scenario 'should render a book' do
    visit(root_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.description)
    expect(page).to have_content(book.author)
  end

  let!(:book2) { Fabricate(:book) }
  
  scenario 'should render all books' do
    visit(root_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end
end
