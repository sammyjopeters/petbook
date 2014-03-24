require 'spec_helper'

describe PetsController do



context "if you're logged in" do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET index" do
      it "assigns all pets as @pets" do
        pet = create(:pet)
        get :index
        expect(:pets).to eq(pet)
      end
    end

    describe "GET show" do
      it "assigns the requested pet as @pet" do
        pet = create(:pet)
        get :show, {:id => pet.to_param}
        assigns(:pet).should eq(pet)
      end
    end

    describe "GET new" do
      it "assigns a new pet as @pet" do
        get :new, {}
        assigns(:pet).should be_a_new(Pet)
      end
    end

    describe "GET edit" do
      it "assigns the requested pet as @pet" do
        pet = create(:pet)
        get :edit, {:id => pet.to_param}
        assigns(:pet).should eq(pet)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Pet" do
          expect {
            post :create, :fido
          }.to change(Pet, :count).by(1)
        end

        it "assigns a newly created pet as @pet" do
          post :create, :fido
          assigns(:pet).should be_a(Pet)
          assigns(:pet).should be_persisted
        end

        it "redirects to the created pet" do
          post :create, :fido
          response.should redirect_to(Pet.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved pet as @pet" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          post :create, {:pet => {  }}
          assigns(:pet).should be_a_new(Pet)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          post :create, {:pet => {  }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested pet" do
          pet = create(:pet)
          # Assuming there are no other pets in the database, this
          # specifies that the Pet created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Pet.any_instance.should_receive(:update).with({ "these" => "params" })
          put :update, {:id => pet.to_param, :pet => { "these" => "params" }}
        end

        it "assigns the requested pet as @pet" do
          pet = create(:pet)
          put :update, {:id => pet.to_param}
          assigns(:pet).should eq(pet)
        end

        it "redirects to the pet" do
          pet = create(:pet)
          put :update, {:id => pet.to_param}
          response.should redirect_to(pet)
        end
      end

      describe "with invalid params" do
        it "assigns the pet as @pet" do
          pet = create(:pet)
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          put :update, {:id => pet.to_param, :pet => {  }}
          assigns(:pet).should eq(pet)
        end

        it "re-renders the 'edit' template" do
          pet = create(:pet)
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          put :update, {:id => pet.to_param, :pet => {  }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested pet" do
        pet = create(:pet)
        expect {
          delete :destroy, {:id => pet.to_param}
        }.to change(Pet, :count).by(-1)
      end

      it "redirects to the pets list" do
        pet = create(:pet)
        delete :destroy, {:id => pet.to_param}
        response.should redirect_to(pets_url)
      end
    end
end

  context "if you're not logged in"

end
