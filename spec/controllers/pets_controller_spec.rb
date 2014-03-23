require 'spec_helper'

describe PetsController do

  # This should return the minimal set of attributes required to create a valid
  # Pet. As you add validations to Pet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
    name: 'fido',
    family: 'dog',
    species: 'labrador',
    picture: '../picture.jpg',
    dob: Time.now,
    favourite_toy: 'rubber ball',
    favourite_place: 'the local park!',
    bio: "I'm Fido, and I'm a Labrador from Sydney. I love to go to the park with my owner and throw around my favourite toy, a red rubber ball! I can be found on the couch snoozing most days."
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "associations" do
    it {should belong_to (:user)}
  end

  describe "GET index" do
    it "assigns all pets as @pets" do
      pet = Pet.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pets).should eq([pet])
    end
  end

  describe "GET show" do
    it "assigns the requested pet as @pet" do
      pet = Pet.create! valid_attributes
      get :show, {:id => pet.to_param}, valid_session
      assigns(:pet).should eq(pet)
    end
  end

  describe "GET new" do
    it "assigns a new pet as @pet" do
      get :new, {}, valid_session
      assigns(:pet).should be_a_new(Pet)
    end
  end

  describe "GET edit" do
    it "assigns the requested pet as @pet" do
      pet = Pet.create! valid_attributes
      get :edit, {:id => pet.to_param}, valid_session
      assigns(:pet).should eq(pet)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pet" do
        expect {
          post :create, {:pet => valid_attributes}, valid_session
        }.to change(Pet, :count).by(1)
      end

      it "assigns a newly created pet as @pet" do
        post :create, {:pet => valid_attributes}, valid_session
        assigns(:pet).should be_a(Pet)
        assigns(:pet).should be_persisted
      end

      it "redirects to the created pet" do
        post :create, {:pet => valid_attributes}, valid_session
        response.should redirect_to(Pet.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pet as @pet" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pet.any_instance.stub(:save).and_return(false)
        post :create, {:pet => {  }}, valid_session
        assigns(:pet).should be_a_new(Pet)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pet.any_instance.stub(:save).and_return(false)
        post :create, {:pet => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pet" do
        pet = Pet.create! valid_attributes
        # Assuming there are no other pets in the database, this
        # specifies that the Pet created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pet.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => pet.to_param, :pet => { "these" => "params" }}, valid_session
      end

      it "assigns the requested pet as @pet" do
        pet = Pet.create! valid_attributes
        put :update, {:id => pet.to_param, :pet => valid_attributes}, valid_session
        assigns(:pet).should eq(pet)
      end

      it "redirects to the pet" do
        pet = Pet.create! valid_attributes
        put :update, {:id => pet.to_param, :pet => valid_attributes}, valid_session
        response.should redirect_to(pet)
      end
    end

    describe "with invalid params" do
      it "assigns the pet as @pet" do
        pet = Pet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pet.any_instance.stub(:save).and_return(false)
        put :update, {:id => pet.to_param, :pet => {  }}, valid_session
        assigns(:pet).should eq(pet)
      end

      it "re-renders the 'edit' template" do
        pet = Pet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pet.any_instance.stub(:save).and_return(false)
        put :update, {:id => pet.to_param, :pet => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pet" do
      pet = Pet.create! valid_attributes
      expect {
        delete :destroy, {:id => pet.to_param}, valid_session
      }.to change(Pet, :count).by(-1)
    end

    it "redirects to the pets list" do
      pet = Pet.create! valid_attributes
      delete :destroy, {:id => pet.to_param}, valid_session
      response.should redirect_to(pets_url)
    end
  end

end
