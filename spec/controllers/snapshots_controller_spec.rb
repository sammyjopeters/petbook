require 'spec_helper'

describe SnapshotsController do
  let(:user){ FactoryGirl.create(:user) }
  let(:valid_attributes) { {user_id: user.id} }

  before :each do
    sign_in user
  end

  describe "GET index" do
    it "assigns all snapshots as @snapshots" do
      snapshot = Snapshot.create!
      get :index
      assigns(:snapshots).should eq([snapshot])
    end

    it "collects all the relevant snapshots" do
      more_than_one_snapshot = 5.times(Snapshot.create! valid_attributes)
      get :index
      assigns(:snapshots.length).to eq(5)
    end

  end

  describe "GET show" do
    it "assigns the requested snapshot as @snapshot" do
      snapshot = Snapshot.create! valid_attributes
      get :show, {:id => snapshot.to_param}
      assigns(:snapshot).should eq(snapshot)
    end
  end

  describe "GET new" do
    it "assigns a new snapshot as @snapshot" do
      get :new
      assigns(:snapshot).should be_a_new(Snapshot)
    end
  end

  describe "GET edit" do
    it "assigns the requested snapshot as @snapshot" do
      snapshot = Snapshot.create! valid_attributes
      get :edit, {:id => snapshot.to_param}
      assigns(:snapshot).should eq(snapshot)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Snapshot" do
        expect {
          post :create, {:snapshot => valid_attributes}
        }.to change(Snapshot, :count).by(1)
      end

      it "assigns a newly created snapshot as @snapshot" do
        post :create, {:snapshot => valid_attributes}
        assigns(:snapshot).should be_a(Snapshot)
        assigns(:snapshot).should be_persisted
      end

      it "redirects to the created snapshot" do
        post :create, {:snapshot => valid_attributes}
        response.should redirect_to(Snapshot.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved snapshot as @snapshot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        post :create, {:snapshot => { "user_id" => "invalid value" }}
        assigns(:snapshot).should be_a_new(Snapshot)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        post :create, {:snapshot => { "user_id" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested snapshot" do
        snapshot = Snapshot.create! valid_attributes
        # Assuming there are no other snapshots in the database, this
        # specifies that the Snapshot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Snapshot.any_instance.should_receive(:update).with({ "user" => "" })
        put :update, {:id => snapshot.to_param, :snapshot => { "user" => "" }}
      end

      it "assigns the requested snapshot as @snapshot" do
        snapshot = Snapshot.create! valid_attributes
        put :update, {:id => snapshot.to_param, :snapshot => valid_attributes}
        assigns(:snapshot).should eq(snapshot)
      end

      it "redirects to the snapshot" do
        snapshot = Snapshot.create! valid_attributes
        put :update, {:id => snapshot.to_param, :snapshot => valid_attributes}
        response.should redirect_to(snapshot)
      end
    end

    describe "with invalid params" do
      it "assigns the snapshot as @snapshot" do
        snapshot = Snapshot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => snapshot.to_param, :snapshot => { "user" => "invalid value" }}
        assigns(:snapshot).should eq(snapshot)
      end

      it "re-renders the 'edit' template" do
        snapshot = Snapshot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => snapshot.to_param, :snapshot => { "user" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested snapshot" do
      snapshot = Snapshot.create! valid_attributes
      expect {
        delete :destroy, {:id => snapshot.to_param}
      }.to change(Snapshot, :count).by(-1)
    end

    it "redirects to the snapshots list" do
      snapshot = Snapshot.create! valid_attributes
      delete :destroy, {:id => snapshot.to_param}
      response.should redirect_to(snapshots_url)
    end
  end

end
