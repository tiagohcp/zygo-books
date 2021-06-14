require 'rails_helper'

feature "Dashboards", type: :feature do
  scenario 'Mostra mensagem - Bem-Vindo' do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo')
  end
end
