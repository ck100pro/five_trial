require 'rails_helper'

RSpec.feature 'createTimeOrder', type: :feature, js: true do
  context 'listOrderItem' do
    let!(:board) { create(:board) }

    scenario 'continuous create list' do
      visit board_path(board.id)

      create_order = []

      click_button 'listCreateButton'
      3.times do
        name = Faker::Name.name
        find('input', class: 'listTitleInput', visible: true).set(name)
        click_button 'listSendCreate'
        create_order.push(name)
        sleep(1)
      end

      create_order.each_with_index do |name, index|
        expect(page).to have_selector("span#list-item-#{index}", text: name ,visible: true)
      end
    end
  end

  context 'cardOrderItem' do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, board_id: board.id) }

    scenario 'continuous create card' do
      visit board_path(board.id)

      create_order = []

      find('span', class: 'cardCreateButton', text: '新增文章', visible: true).click
      3.times do
        name = Faker::Name.name
        find('input', class: 'cardCreateInput', visible: true).set(name)
        click_button 'cardSendCreate'
        create_order.push(name)
        sleep(1)
      end
      
      create_order.reverse.each_with_index do |name, index|
        expect(page).to have_selector("span#card-item-#{index}", text: name ,visible: false)
      end
    end
  end
end
