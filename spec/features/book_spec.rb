require 'rails_helper'

feature "Books", type: :feature do

  let!(:book) { Fabricate(:book) }
  let!(:book2) { Fabricate(:book) }

  scenario 'show message - Wellcome' do
    visit(root_path)
    expect(page).to have_content('Wellcome')
  end

  scenario 'should render a book' do
    visit(root_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.description)
    expect(page).to have_content(book.author)
  end
  
  scenario 'should render all books' do
    visit(root_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end

  scenario 'should have label - Filters'do
    visit(root_path)
    expect(page).to have_content('Filters')
  end

end
