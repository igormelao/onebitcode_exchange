require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
      #page.execute_script("$('#quantity').blur()")
    end

    #save_and_open_page
    #expect(page).to have_content("value")
    #expect(page).to_not have_content("Simule sua conversão!")
    #expect(page).to have_content("EUR")
  end
end
