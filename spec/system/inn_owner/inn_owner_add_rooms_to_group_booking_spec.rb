require 'rails_helper'

describe 'Inn Owner tries to add rooms to group booking' do
  it 'and sees link in inn management page' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                    address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})


    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)

    inn.group_bookings.create!(name: 'Reunião Campus Code', start_date: 2.days.from_now.to_date, end_date: 1.week.from_now.to_date)

    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'

    expect(page).to have_content 'Reunião Campus Code'
    expect(page).to have_link 'Adicionar Quarto'
  end

  it 'and sees form fields' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                    address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})


    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)

    inn.group_bookings.create!(name: 'Reunião Campus Code', start_date: 2.days.from_now.to_date, end_date: 1.week.from_now.to_date)

    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Adicionar Quarto'

    expect(page).to have_content 'Adicionar Quarto a Reserva para Grupo'
    expect(page).to have_field 'Quarto'
    expect(page).to have_field 'Quantidade de Pessoas'
  end
end