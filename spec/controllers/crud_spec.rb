# crud_spec.rb

require "spec_helper"

describe GistsController, " #index" do

  it "renders :index view" do 
    get :index 
    response.should render_template :index 
  end 
end

describe GistsController, " #show" do

  before :each do 
      @gist = Gist.new(snippet: "Snippet title", lang: "c", description: "Moja wrzutka") 
      @gist.save
  end

  it "renders the #show view" do 
    get :show, id: @gist
    response.should render_template :show 
  end
end

describe GistsController, " #create" do
		
	context "valid attributes" do

    it "saves gist" do
      expect do
        post :create, gist: { snippet: "Snippet title", lang: "c", description: "Moja wrzutka" }
      end.to change(Gist, :count).by(1)
    end

    it "redirects to created gist page" do
        post :create, gist: { snippet: "Snippet title", lang: "c", description: "Moja wrzutka" }
      expect(response).to redirect_to "/gists/1"
    end

  end

  context "invalid attributes" do

    it "does not save gist" do
      expect do
        post :create, gist: { lang: "C" }
      end.not_to change(Gist, :count)
    end
  end

end

describe GistsController, " #delete" do

  context "user not logged in" do

    before :each do 
      @gist = Gist.new(snippet: "Snippet title", lang: "c", description: "Moja wrzutka") 
      @gist.save
    end

    it "do not remove gist" do
      expect do
        delete :destroy, id: @gist
      end.to change(Gist, :count).by(0)
    end

    it "redirects to login_required page" do
        delete :destroy, id: @gist
      expect(response).to redirect_to "/static_pages/login_required"
    end
  end

=begin

  context "user logged in" do

      before :each do 
  
        OmniAuth.config.test_mode = true

        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        :provider => 'github',
        :uid => '9999',
        :info => {
          :name => 'ABCXYZ',
        },
        :credentials => {:token => 'token-github'}
        })

        request.env["devise.mapping"] = Devise.mappings[:user] 
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

        @gist = Gist.new(snippet: "Snippet title", lang: "c", description: "Moja wrzutka") 
        @gist.save
      end
      
      it "remove gist" do
      expect do
        delete :destroy, id: @gist
      end.to change(Gist, :count).by(-1)
    end

    it "redirects to gists page" do
        delete :destroy, id: @gist
      expect(response).to redirect_to gists_url 
    end

  end
=end

end

describe GistsController, " #update" do

  context "user not logged in" do
    before :each do 
      @gist = Gist.new(snippet: "Snippet title", lang: "c", description: "Moja wrzutka") 
      @gist.save
    end

    it "do not update gist" do
      @attr = { :snippet => "Snippet title", :lang => "c" , :description => "Tak" }
      put :update, :id => @gist.id, :gist => @attr
          
      @gist.reload 
      expect(response).to redirect_to "/static_pages/login_required"
    end
  end
=begin
  context "user not logged in" do

    before :each do 
      @gist = Gist.new(snippet: "Snippet title", lang: "c", description: "Moja wrzutka") 
      @gist.save
    end

    it "update gist" do
      @attr = { :snippet => "Snippet title", :lang => "c" , :description => "Tak" }
      put :update, :id => @gist.id, :gist => @attr
      
      @gist.reload 
      expect(response).to redirect_to @gist
      @gist.description.should eq("Tak") 
      @gist.lang.should eq("c")
    end
  end
=end
end 
