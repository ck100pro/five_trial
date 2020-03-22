require 'rails_helper'

RSpec.feature 'createTimeOrder', type: :feature, js: true do
  context 'listOrderItem' do
    let!(:board) { create(:board) }

    scenario 'continuous create list' do
      visit board_path(board.id)
      click_button 'listCreateButton'
      create_order = []

      3.times do
        name = Faker::Name.name
        find('input', class: 'listTitleInput', visible: true).set(name)
        click_button 'listSendCreate'
        create_order.push(name)
      end
      
      create_order.each_with_index do |name, index|
        expect(page).to have_all_of_selectors("span#list-item-#{index}",text: name ,visible: true)
      end
    end
  end

  context 'cardOrderItem' do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, board_id: board.id) }

    scenario 'continuous create card' do
      visit board_path(board.id)
      find('span', class: 'cardCreateButton', text: '新增卡片', visible: true)
        .click
      create_order = []

      3.times {
        name = Faker::Name.name
        find('input', class: 'cardCreateInput', visible: true).set(name)
        click_button 'cardSendCreate'
        create_order.push(name)
        expect(page).to have_text(name)
      }

      create_order.reverse.each_with_index do |name, index|
        expect(page).to have_all_of_selectors("span#card-item-#{index}",text: name ,visible: true)
      end
    end
  end
end
