require 'spec_helper'

describe "Example API", type: :apivore, order: :defined do
  include Apivore::RspecMatchers
  include Apivore::RspecHelpers

  subject { Apivore::SwaggerChecker.instance_for("/swagger-doc.json") }

  context "has valid paths" do
    it "documents /services.json" do
      expect(subject).to document(:get, "/services.json", 200)
    end

    it "documents /services.json" do
      expect(subject).to document(
        :post, "/services.json", 204, {'name' => 'hello world'}
      )
    end

    it "documents /services/{id}.json" do
      expect(subject).to document(
        :get, "/services/{id}.json", 200, {'id' => 1}
      )
    end

    it "documents /services/{id}.json" do
      expect(subject).to document(
        :put, "/services/{id}.json", 204, {'id' => 1}
      )
    end

    it "documents /services/{id}.json" do
      expect(subject).to document(
        :delete, "/services/{id}.json", 204, {'id' => 1}
      )
    end

    it "documents /services/{id}.json" do
      expect(subject).to document(
        :patch, "/services/{id}.json", 204, {'id' => 1}
      )
    end
  end

  context 'and' do
    it 'tests all documented routes' do
      expect(subject).to document_all_paths
    end
    # it 'has definitions consistent with the master docs' do
    #   expect(subject).to be_consistent_with_swagger_definitions(
    #     "api.westfield.io", 'deal'
    #   )
    # end
  end

end
