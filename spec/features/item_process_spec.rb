require "rails_helper"

RSpec.feature "ItemProcess", type: :feature, js: true do
  scenario "create board" do
    visit root_path

    click_button "新增看板"
    fill_in "board_title", with: "測試board新增"
    click_button "建立看板"
    sleep(1)
    
    expect(page).to have_current_path(board_path(Board.last.id))
    expect(Board.last.title).to eq "測試board新增"
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

          find("input", class: "listTitleInput", visible: true).set(name)
          click_button "listSendCreate"
          sleep(1)

          expect(page).to have_css("span#list-item-#{number}", text: name, visible: true)
          expect(page).to have_text("類別建立完成")
          expect(List.last.title).to eq name
          number += 1
        }
      end
  
      scenario "create fail" do
        visit board_path(board.id)
  
        click_button "listCreateButton"
        3.times {
          find("input", class: "listTitleInput", visible: true).set("")
          click_button "listSendCreate"
          sleep(1)

          expect(page).not_to have_css('span#list-item-0', visible: true)
          expect(page).to have_text("類別名稱不能空白")
          expect(List.count).to eq 0
        }
      end
    end

    context "list update" do
      let!(:list) { create(:list, :board_id => board.id) }

      scenario "updte success" do
        visit board_path(board.id)
        name = Faker::Name.name 
  
        find('span', text: "#{list.title}").click
        find('input').set(name).send_keys(:enter)
        sleep(1)
        
        expect(page).to have_css("span#list-item-0", text: name, visible: true)
        expect(page).to have_text("類別名稱更新完成")
        expect(list.reload.title).to eq name
      end
  
      scenario "updte error" do
        visit board_path(board.id)
  
        find('span', text: "#{list.title}").click
        find('input').set(" ").send_keys(:enter)
        sleep(1)

        expect(page).to have_css("span#list-item-0", text: list.title, visible: true)
        expect(page).to have_text("類別名稱不能空白")
        expect(list.reload.title).not_to eq ""
      end
    end
  end

  context "card item" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, :board_id => board.id) }

    scenario "create success" do
      visit board_path(board.id)

      find('span', class: "cardCreateButton", text: "新增文章", visible: true).click
      3.times {
        name = Faker::Name.name

        find('input', class: "cardCreateInput", visible: true).set(name)
        click_button "cardSendCreate"
        sleep(1)

        expect(page).to have_css("span#card-item-0", text: name, visible: true)
        expect(page).to have_text("文章新增成功")
        expect(Card.last.title).to eq name
      }
    end

    scenario "create fail" do
      visit board_path(board.id)

      find('span', class: "cardCreateButton" , text: "新增文章", visible: true).click
      3.times {
        find('input', class: "cardCreateInput", visible: true).set("")
        click_button "cardSendCreate"
        sleep(1)

        expect(page).not_to have_css('span#card-item-0', text: "" ,visible: true)
        expect(page).to have_text("文章名稱不能空白")
        expect(Card.count).to eq 0
      }
    end

    context "card delete" do
      let!(:card) { create(:card, :list_id => list.id) }
      scenario "card delete" do
        visit board_path(board.id)
  
        find('i', class: "cardDelete", visible: true).click
        sleep(1)

        expect(page).not_to have_css('span#card-item-0', text: card.title, visible: true)
        expect(page).to have_text("文章刪除成功")
        expect(Card.find_by(id: card.id)).to be_nil
      end
    end
  end
end