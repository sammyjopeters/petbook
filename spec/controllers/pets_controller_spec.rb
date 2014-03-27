require 'spec_helper'

describe PetsController do
  let(:user){ create(:user) }
  let(:pet){ create(:pet) }
  let(:valid_attributes) { attributes_for(:pet) }

  before :each do
    sign_in user
  end

    describe "GET index" do
      it "assigns all pets as @pets" do
        get :index, user_id: user.id
        expect(assigns(:pets)).to eq(Pet.all)
      end
    end

    describe "GET show" do
      it "assigns the requested pet as @pet" do
        get :show, {id: pet.to_param, user_id: user.id}
        expect(assigns(:pet)).to eq(pet)
      end
    end

    describe "GET new" do
      it "assigns a new pet as @pet" do
        get :new, {user_id: user.id}
        expect(assigns(:pet)).to be_a_new(Pet)
      end
    end

    describe "GET edit" do
      it "assigns the requested pet as @pet" do
        get :edit, {id: pet.to_param, user_id: user.id}
        expect(assigns(:pet)).to eq(pet)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Pet" do
          expect {
            post :create, user_id: user.id, pet: valid_attributes
          }.to change(Pet, :count).by(1)
        end

        it "assigns a newly created pet as @pet" do
          post :create, user_id: user.id, pet: valid_attributes
          expect(assigns(:pet)).to be_a(Pet)
          expect(assigns(:pet)).to be_persisted
        end

        it "redirects to the created pet" do
          post :create, user_id: user.id, pet: valid_attributes
          response.should redirect_to(Pet.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved pet as @pet" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          post :create, { user_id: user.id, pet: { user_id: "invalid value" } }
          expect(assigns(:pet)).to be_a_new(Pet)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          post :create, {  user_id: user.id, pet: { user_id: "invalid value" } }
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested pet" do
          # Assuming there are no other pets in the database, this
          # specifies that the Pet created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Pet.any_instance.should_receive(:update).at_least(:once).with({"name" => 'rex'}).and_return(true)
          put :update, {id: pet.id, user_id: user.id,  pet: {name: 'rex'} }
        end

        it "assigns the requested pet as @pet" do
          put :update, {id: pet.id, user_id: user.id, pet: {name: 'rex'} }
          expect(assigns(:pet)).to eq(pet)
        end

        it "redirects to the pet" do
          put :update, {id: pet.id, user_id: user.id, pet: {name: 'rex'} }
          response.should redirect_to(pet)
        end
      end

      describe "with invalid params" do
        it "assigns the pet as @pet" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:save).and_return(false)
          put :update, {id: pet.id, user_id: user.id, pet: { user_id: nil } }
          expect(assigns(:pet)).to eq(pet)
        end

        it "re-renders the 'edit' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Pet.any_instance.stub(:update).and_return(false)
          put :update, {id: pet.id, user_id: user.id,  pet: { user_id: nil } }
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested pet" do
        byebyepet = create(:pet)
        expect {
          delete :destroy, {id: byebyepet.id, user_id: user.id}
        }.to change(Pet, :count).by(-1)
      end

      it "redirects to the pets list" do
        delete :destroy, {id: pet.id, user_id: user.id}
        response.should redirect_to(pets_url)
      end
    end


end
