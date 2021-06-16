require 'rails_helper'

feature "Books", type: :feature do

  let!(:book1) { Fabricate(:book, title: 'First Book', description: 'First Description', author: 'Abcd') }
  let!(:book2) { Fabricate(:book, title: 'Second Book', description: 'Second Description', author: 'Qwert') }

  scenario 'show message - Wellcome' do
    visit(root_path)
    expect(page).to have_content('Wellcome')
  end

  scenario 'should render a book' do
    visit(root_path)
    expect(page).to have_content(book1.title)
    expect(page).to have_content(book1.description)
    expect(page).to have_content(book1.author)
  end
  
  scenario 'should render all books' do
    visit(root_path)
    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
  end

  scenario 'should have label - Filters' do
    visit(root_path)
    expect(page).to have_content('Filters')
  end

  scenario 'should have label - Title / Description' do
    visit(root_path)
    expect(page).to have_content('Title / Description')
  end

  scenario 'should have label - Author' do
    visit(root_path)
    expect(page).to have_content('Author')
  end

  scenario 'should have button to filter' do
    visit(root_path)
    expect(page).to have_button('Filter')
  end

  scenario 'should have link to clear filters' do
    visit(root_path)
    expect(page).to have_link('Clear')
  end

  scenario 'should have link to order filters' do
    visit(root_path)
    expect(page).to have_link('Order by Title')
  end

end
