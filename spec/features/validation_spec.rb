feature 'Validate url' do
  scenario 'raises error when user creates bookmark with invalid URL' do
    visit('/bookmarks')
    fill_in('url', with: 'google.com')
    click_button('Add')

    expect(page).not_to have_content('google.com')
    expect(page).to have_content('Please enter a valid URL')
  end

end