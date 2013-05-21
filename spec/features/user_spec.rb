require 'spec_helper'

describe User do
  describe 'at index' do
    it 'sees the famous user table' do
      visit root_path
      page.should have_content("KarmaVille's Most Famous")
    end

    it 'sees some user' do
      user = create(:user_with_karma)
      visit root_path
      page.should have_content(user.username)
      page.should have_content(user.total_karma)
    end

    it 'sees next and previous buttons' do
      visit root_path
      page.should have_content('Prev')
      page.should have_content('Next')
    end

    it 'sees a disabled previous button' do
      visit root_path
      within('.disabled') do
        page.should have_content('Prev')
      end
    end

    it 'sees the 51st user on page 2' do
      pagination = double(Pagination, :pagination_limit => 3, :offset => 3)
      4.times { create(:user) }
      user = User.page(pagination).first
      visit root_path
      within('.pagination') { click_link '2' }
      page.should have_content(user.username)
    end


  end
end
