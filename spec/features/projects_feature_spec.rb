require "rails_helper"

RSpec.feature "Projects", type: :feature do
    context "Update project" do
      let(:project) { Project.create(title: "Test title", description: "Test content", one: "123",two:"123") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_project_path(project)
      end
 
 
      scenario "should be successful" do

        within("form") do
          fill_in "Title", with: "stuff"
          fill_in "Description", with: "New description content"
          fill_in "One", with: "123"
          fill_in "Two", with: "123"
        end
    
        click_button "Update Project"
        expect(page).to have_content("Project was successfully updated.")
      end
 
 
      scenario "should fail" do
       
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Title can't be blank")
      end
    end

    context "Login" do
      scenario "should sign up" do
        visit root_path
        click_link 'Sign up'
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
        end
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
  
  
      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
    end
  
end

RSpec.feature "Projects", type: :feature do


    context "Create project" do
      let(:project) { Project.create(title: "Test title", description: "Test content", one: "123",two:"123") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_project_path
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Title", with: "This is the title"
          fill_in "Description", with: "New description content"
          fill_in "One", with: "123"
          fill_in "Two", with: "123"
        end
        click_button "Create Project"
        expect(page).to have_content("Project was successfully created.")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Create Project"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Title", with: "helo"
          fill_in "Description", with: "New description content"
          fill_in "One", with: ""
          fill_in "Two", with: "123"
        end
        click_button "Create Project"
        expect(page).to have_content("One can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Create Project"
        expect(page).to have_content("Title can't be blank")
      end
    end
end

RSpec.feature "Projects", type: :feature do

    context "Delete Project" do
      let(:project) { Project.create(title: "Test title", description: "Test content", one: "123",two:"123") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
      end
 
 
      scenario "should be successful" do
        click_button "Destroy"
        expect(page).to have_content("Are you sure?")
      end
 
    end
end

RSpec.feature "Projects", type: :feature do

    context "New Project" do
      let(:project) { Project.create(title: "Test title", description: "Test content", one: "123",two:"123") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit projects_path
      end
 
 
      scenario "should be successful" do
        click_button "New Project"
        expect(page).to have_content("New Project")
      end
 
    end
end


RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see projects" do
      visit projects_path
      expect(page).to have_text("PRPRO")
    end
  end