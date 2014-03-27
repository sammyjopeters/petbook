require 'spec_helper'

describe PostsController do
  let(:user){ create(:user) }
  let(:thepost){ create(:post) }
  let(:valid_attributes) { attributes_for(:post) }

  before :each do
    sign_in user
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index, user_id: user.id
      expect(assigns(:posts)).to eq(Post.all)
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, {id: thepost.to_param, user_id: user.id}
      expect(assigns(:post)).to eq(thepost)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {user_id: user.id}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      get :edit, {id: thepost.to_param, user_id: user.id}
      expect(assigns(:post)).to eq(thepost)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new post" do
        expect {
          post :create, user_id: user.id, post: valid_attributes
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, user_id: user.id, post: valid_attributes
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, user_id: user.id, post: valid_attributes
        response.should redirect_to "where_i_came_from"
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, { user_id: user.id, post: { user_id: nil } }
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, { user_id: user.id, post: { content: nil } }
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update).at_least(:once).with({"content" => 'blahablablah POST TEXT'}).and_return(true)
        put :update, {id: thepost.id, user_id: user.id,  post: {content: 'blahablablah POST TEXT'} }
      end

      it "assigns the requested post as @post" do
        put :update, {id: thepost.id, user_id: user.id, post: {content: 'blahablablah POST TEXT'} }
        expect(assigns(:post)).to eq(thepost)
      end

      it "redirects to the post" do
        put :update,  {id: thepost.id, user_id: user.id, post: {content: 'blahablablah POST TEXT'} }
        response.should redirect_to "where_i_came_from"
      end

      it "redirects if the params include newsfeed" do
        put :update,  {id: thepost.id, user_id: user.id, post: {content: 'blahablablah POST TEXT', params: 'newsfeed'} }
        expect(response).to render_template("newsfeed")
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update,  {id: thepost.id, user_id: user.id, post: { content: nil } }
        expect(assigns(:post)).to eq(thepost)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {id: thepost.id, user_id: user.id, post: { content: nil } }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      byebyepost = create(:post)
      expect {
        delete :destroy, {id: byebyepost.id, user_id: user.id}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, {id: thepost.id, user_id: user.id}
      response.should redirect_to "where_i_came_from"
    end
  end

end
