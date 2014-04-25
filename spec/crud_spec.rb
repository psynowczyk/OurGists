# crud_spec.rb

require "spec_helper"

describe GistsController, "#create" do
		
	context "valid attributes" do

    it "saves gists" do
      expect do
        post :create, params: { snippet: "Article title", lang: "c", description: "Moja wrzutka"}
      end.to change(Gist, :count).by(1)
    end

    it "redirects to articles page" do
      post :create, params: { snippet: "Article title", lang: "c", description: "Moja wrzutka" }
      expect(response).to redirect_to articles_path
    end

  end

  context "invalid attributes" do

    it "does not save article" do
      expect do
        post :create, params: { title: "Article title" }
      end.not_to change(Article, :count)
    end

    it "renders new template" do
      post :create, params: { title: "Article title" }
      expect(response).to render_template "new"
    end

  end

end