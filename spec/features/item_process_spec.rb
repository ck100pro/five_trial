require "rails_helper"

RSpec.feature "ItemProcess", type: :feature, js: true do
  scenario "create board" do
    visit root_path

    click_button "新增看板"
    fill_in "board_title", with: "測試board新增"
    click_button "建立看板"
    expect(page).to have_current_path(board_path(Board.last.id))
  end

  context "list item" do
    let!(:board) { create(:board) }

    context "list create" do
      scenario "create success" do
        visit board_path(board.id)
        number = 0
  
        click_button "listCreateButton"
        3.times {
          name = Faker::Name.name

          fill_in "listTitleInput", with: name
          click_button "listSendCreate"
          expect(List.last.title).to eq name
          expect(page.find("span#list-item-#{number}", text: name, visible: true).text).to eq name 
          expect(page).to have_text("List新增成功")
          number += 1
        }
      end
  
      scenario "create fail" do
        visit board_path(board.id)
  
        click_button "listCreateButton"
        3.times {
          fill_in "listTitleInput", with: " "
          click_button "listSendCreate"
          expect(List.last.title).not_to eq ""
          expect(page.has_css?('span#list-item-0', visible: true)).to be_falsey
          expect(page).to have_text("List新增失敗")
        }
      end
    end

    context "list update" do
      let!(:list) { create(:list, :board_id => board.id) }
      let!(:name) { Faker::Name.name }
      scenario "updte success" do
        visit board_path(board.id)
  
        find('span', text: "#{list.title}").click
        find('input').set(name).send_keys(:enter)
        
        expect(page.find("span#list-item-0", text: name, visible: true).text).to eq name 
        expect(page).to have_text("List-Update成功")
        expect(list.reload.title).to eq name
      end
  
      scenario "updte error" do
        visit board_path(board.id)
  
        find('span', text: "#{list.title}").click
        find('input').set(" ").send_keys(:enter)
        expect(page.find("span#list-item-0", text: list.title, visible: true).text).to eq list.title
        expect(page).to have_text("List-Update失敗")
        expect(list.reload.title).not_to eq ""
      end
    end
  end


  

  context "card item" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, :board_id => board.id) }

    scenario "create success" do
      visit board_path(board.id)
      num = 0

      find('span#cardCreateButton', text: "新增卡片", visible: true).click
      3.times {
        name = Faker::Name.name

        find('input').set(name)
        click_button "cardSendCreate"
        expect(page.find("span#card-item-#{num}", text: name, visible: true).text).to eq name
        expect(Card.last.title).to eq name
        expect(page).to have_text("Card新增成功")
        num += 1
      }
    end

    scenario "create fail" do
      visit board_path(board.id)
      find('span#cardCreateButton', text: "新增卡片", visible: true).click
      3.times {
        find('span', text: "新增卡片").click
        find('input').set("")
        click_button "cardSendCreate"
        expect(page).to have_text("Card新增失敗")
      }
    end

    # context "card delete" do
    #   let!(:card) { create(:card, :list_id => list.id) }
    #   scenario "card delete" do
    #     visit board_path(board.id)
  
    #     find('i').click
    #     expect(page).to have_text("卡片刪除成功")
    #   end
    # end
  end
end