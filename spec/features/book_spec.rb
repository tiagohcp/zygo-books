require 'rails_helper'

feature "Books", type: :feature do
  let!(:book) { Fabricate(:book) }

  scenario 'Mostra mensagem - Bem-Vindo' do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo')
  end

  scenario 'Verificar exibição de livro' do
    visit(root_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.description)
    expect(page).to have_content(book.author)
  end
end
