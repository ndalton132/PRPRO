require "rails_helper"

RSpec.describe ProjectsController, :type => :controller do
    login_user
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:project) { Project.create(title: "Test title", description: "Test description",one: "123",two:"123") }
              it "returns a success response" do
                get :show, params: { id: project.id }
                 expect(response).to have_http_status(:ok)
            end
        end
        context "DELETE #destroy" do
            let!(:project) { Project.create(title: "Test title", description: "Test content", one: "123",two:"123") }
            it "deletes the project" do
                expect {delete :destroy, params: { id: project.id }}.to change(Project, :count).by(-1)
      end
    end
        
    end
end
