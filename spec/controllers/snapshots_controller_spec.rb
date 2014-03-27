require 'spec_helper'

describe SnapshotsController do
  let(:user){ create(:user) }
  let(:snapshot){ create(:snapshot) }
  let(:valid_attributes) { attributes_for(:snapshot) }

  before :each do
    sign_in user
  end

  context "GET index" do
    it "assigns all snapshots as @snapshots" do
      get :index, user_id: user.id
      expect(assigns(:snapshots)).to eq(Snapshot.all)
    end

  end

  context "GET show" do
    it "assigns the requested snapshot as @snapshot" do
      get :show, {:id => snapshot.to_param}
      expect(assigns(:snapshot)).to eq(snapshot)
    end
  end

  context "GET new" do
    it "assigns a new snapshot as @snapshot" do
      get :new
      expect(assigns(:snapshot)).to be_a_new(Snapshot)
    end
  end

  context "GET edit" do
    it "assigns the requested snapshot as @snapshot" do
      
      get :edit, {:id => snapshot.to_param}
      expect(assigns(:snapshot)).to eq(snapshot)
    end
  end

  context "POST create" do
    context "with valid params" do
      it "creates a new Snapshot" do
        expect {
          post :create, {:snapshot => valid_attributes}
        }.to change(Snapshot, :count).by(1)
      end

      it "assigns a newly created snapshot as @snapshot" do
        post :create, {:snapshot => valid_attributes}
        expect(assigns(:snapshot)).to be_a(Snapshot)
        expect(assigns(:snapshot)).to be_persisted
      end

      it "redirects to the created snapshot" do
        post :create, {:snapshot => valid_attributes}
        response.should redirect_to(Snapshot.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved snapshot as @snapshot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        post :create, {:snapshot => { "user_id" => nil }}
        expect(assigns(:snapshot)).to be_a_new(Snapshot)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        post :create, {:snapshot => { "user_id" => nil }}
        response.should render_template("new")
      end
    end
  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested snapshot" do
        # Assuming there are no other snapshots in the database, this
        # specifies that the Snapshot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Snapshot.any_instance.should_receive(:update).at_least(:once).with({"image" => '../place/images/fish.jpg'}).and_return(true)
        put :update, {id: snapshot.id, user_id: user.id,  snapshot: {image: '../place/images/fish.jpg'} }
      end

      it "assigns the requested snapshot as @snapshot" do
        put :update, {id: snapshot.id, user_id: user.id,  snapshot: valid_attributes }
        expect(assigns(:snapshot)).to eq(snapshot)
      end

      it "redirects to the snapshot" do
        
        put :update, {:id => snapshot.to_param, :snapshot => valid_attributes}
        response.should redirect_to(snapshot)
      end
    end

    context "with invalid params" do
      it "assigns the snapshot as @snapshot" do
        
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        put :update, {id: snapshot.id, user_id: user.id,  snapshot: {image: nil} }
        expect(assigns(:snapshot)).to eq(snapshot)
      end

      it "re-renders the 'edit' template" do
        
        # Trigger the behavior that occurs when invalid params are submitted
        Snapshot.any_instance.stub(:save).and_return(false)
        put :update, {id: snapshot.id, user_id: user.id,  snapshot: {image: nil} }
        response.should render_template("edit")
      end
    end
  end

  context "DELETE destroy" do
    before(:each) { @byebyesnapshot = create(:snapshot) }
    it "destroys the requested snapshot" do
      expect {
        delete :destroy, {id: @byebyesnapshot.id, user_id: user.id}
      }.to change(Snapshot, :count).by(-1)
    end

    it "redirects to the snapshots list" do
      delete :destroy, {id: @byebyesnapshot.id, user_id: user.id}
      response.should redirect_to(snapshots_url)
    end
  end

end
