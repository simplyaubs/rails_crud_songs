require 'spec_helper'

feature 'CRUD favorite songs' do
  scenario 'User can create a list of songs' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a song'
    fill_in 'Title', with: 'Thriller'
    fill_in 'Artist', with: 'Michael Jackson'
    click_on 'Add song'
    expect(page).to have_content 'Thriller'
    expect(page).to have_content 'Michael Jackson'
  end

  scenario 'User can update a song from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a song'
    fill_in 'Title', with: 'Thriller'
    fill_in 'Artist', with: 'Michael Jackson'
    click_on 'Add song'
    expect(page).to have_content 'Thriller'
    expect(page).to have_content 'Michael Jackson'
    click_on 'Thriller'
    expect(page).to have_content 'Thriller'
    expect(page).to have_content 'Michael Jackson'
    click_on 'Edit'
    fill_in 'Title', with: 'Roar'
    fill_in 'Artist', with: 'Katy Perry'
    click_on 'Update song'
    expect(page).to have_content 'Roar'
    expect(page).to have_content 'Katy Perry'
    expect(page).to_not have_content 'Thriller'
    expect(page).to_not have_content 'Michael Jackson'
  end

  scenario 'User can delete a song from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a song'
    fill_in 'Title', with: 'Thriller'
    fill_in 'Artist', with: 'Michael Jackson'
    click_on 'Add song'
    expect(page).to have_content 'Thriller'
    expect(page).to have_content 'Michael Jackson'
    click_on 'Thriller'
    click_on 'Delete song'
    expect(page).to_not have_content 'Thriller'
    expect(page).to_not have_content 'Michael Jackson'
  end
end