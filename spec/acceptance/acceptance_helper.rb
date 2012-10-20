require 'spec_helper'

def login_as_administrator
  @user = create(:user)
  login_as @user.email, @user.password
end

def speak_english!
  page.driver.header 'Accept-Language', 'en'
end

def click_dropdown_link(link, opts = {})
  dropdown  = find(:xpath, ".//li[@class='dropdown']", text: link)
  menu_item = dropdown.find(:xpath, './/ul//li', text: link)
  menu_item.click_link link
end

Capybara.add_selector(:header) do
  xpath { './/thead/tr[1]' }
end

Capybara.add_selector(:record_name) do
  xpath { |num| ".//dl/dt[#{num}]" }
end

Capybara.add_selector(:record_value) do
  xpath { |num| ".//dl/dd[#{num}]" }
end

Capybara.add_selector(:row) do
  xpath { |num| ".//tbody/tr[#{num}]" }
end

Capybara.add_selector(:section_header) do
  xpath { ".//h3" }
end
