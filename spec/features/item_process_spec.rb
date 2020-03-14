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

    scenario "list create item" do
      visit board_path(board.id)

      click_button "新增列表"
      fill_in "list_title", with: "測試list新增"
      click_button "送出"
      expect(page).to have_text("List新增成功")

      fill_in "list_title", with: ""
      click_button "送出"
      expect(page).to have_text("List名稱不能空白")
    end

    context "list update" do
      let!(:list) { create(:list, :board_id => board.id) }
      scenario "updte success" do
        visit board_path(board.id)
  
        find('span', text: "#{list.title}").click
        find('input').set("update").send_keys(:enter)
  
        expect(page).to have_text("List更新成功")
        expect(list.reload.title).to eq "update"
      end
  
      scenario "updte error" do
        visit board_path(board.id)
  
        find('span', text: "#{list.title}").click
        find('input').set("").send_keys(:enter)
  
        expect(page).to have_text("List更新失敗")
        expect(list.reload.title).not_to eq ""
      end
    end
  end

  context "card item" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, :board_id => board.id) }
    scenario "create success" do
      visit board_path(board.id)

      find('span', text: "新增卡片").click
      find('input').set("card")
      click_button "新增卡片"
      expect(page).to have_text("CARD新增成功")
    end

    scenario "create success" do
      visit board_path(board.id)

      find('span', text: "新增卡片").click
      find('input').set("")
      click_button "新增卡片"
      expect(page).to have_text("CARD新增失敗")
    end

    context "card delete" do
      let!(:card) { create(:card, :list_id => list.id) }
      scenario "card delete" do
        visit board_path(board.id)
  
        find('i').click
        expect(page).to have_text("卡片刪除成功")
      end
    end
  end
end