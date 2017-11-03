require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I fill in the car make and model year' do
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1970'
      end
      And 'I can submit the information' do
        click_button 'Create new car'
      end
      Then 'I can see the car I created' do
        expect(page).to have_content("Make: DeLorean")
        expect(page).to have_content("Model year: 1970")
      end
      And 'I can see if the lights are on or off' do
        expect(page).to have_content("Lights: Off")
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content("Speed: 0 km/h")
      end
      When 'I click the accelerate button' do
        click_button 'accelerate'
      end
      Then 'I can see the speed increment by 10 km/h' do
        expect(page).to have_content("Speed: 10 km/h")
      end
      When 'I click the brake button' do
        click_button 'brake'
      end
      Then 'I can see the speed decrease by 7 km/h' do
        expect(page).to have_content("Speed: 3 km/h")
      end
      When "I hit the brake, I can't go in the negatives." do
        click_button 'brake'
      end
      Then 'Speed should not go below zero' do
        expect(page).to have_content("Speed: 0 km/h")
      end
      When 'I hit the button to toggle lights it should switch them on' do
        click_button 'lights'
      end
      Then 'when i toggle the lights they should toggle' do
        expect(page).to have_content("Lights: On")
      end
      When 'page is created, there will be two radio buttons for e-brake.' do
        click_button 'e_brake_on'
      end
      Then 'when e_brake_off is clicked, it will toggle.' do
        expect(page).to have_content("e-brake on")
      end
    end
  end
end
