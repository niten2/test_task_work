require_relative '../acceptance_helper'

feature 'integration test' do
  given!(:user) { create(:user) }
  given!(:companies) { create_list(:company, 2) }
  given!(:person) { create(:person, company: companies[0]) }

  scenario 'user sign in' do
    visit new_user_session_path

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'

    within '.actions' do
      click_on 'Log in'
    end

    within '.notice' do
      expect(page).to have_content "Signed in successfully."
    end

    expect(current_path).to eq root_path
  end

  scenario 'Companies list on page' do
    sign_in(user)

    visit root_path

    companies.each do |company|
      expect(page).to have_content company.name
    end
  end

  scenario "add companies and person to favorite", js: true do
    sign_in(user)

    visit root_path

    companies.each do |company|
      find("a[data-favorite='Company-#{company.id}']").click
    end

    visit company_path(companies[0])
    find("a[data-favorite='Person-#{companies[0].persons.first.id}']").click

    visit favorites_path

    companies.each do |company|
      expect(page).to have_content company.name
    end

    expect(page).to have_content person.first_name
  end
end