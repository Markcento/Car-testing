require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/cargame/index'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome to the car game")
      end
    end
  end
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/cargame/register'
      end
      When 'I fill in the car make and model year' do
          fill_in 'make', with: 'DeLorean'
          fill_in 'year', with: '1985'
          fill_in 'model', with: 'AMC'
      end
      And 'I can submit the information' do
        click_button 'Create your car'
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('0Mph')
      end
      And 'I can see that the speed increases' do
        click_button 'Go Faster'
        expect(page).to have_content('10Mph')
      end
      And 'I can see that the speed decreases' do
        click_button 'Go Slower'
        expect(page).to have_content('3Mph')
      end
      And 'I can see that the speed stops at 0' do
        click_button 'Go Slower'
        click_button 'Go Slower'
        click_button 'Go Slower'
        click_button 'Go Slower'
        click_button 'Go Slower'
        click_button 'Go Slower'
        expect(page).to have_content('0Mph')
      end
      And 'I can see the status of the lights' do
        expect(page).to have_content('off')
        click_button 'Toggle Lights'
        expect(page).to have_content('on')
      end
      And 'I can set the E-brake to be on' do
        choose 'on'
        expect(find_field("on")).to be_checked

      end
    end
  end
end
