require "spec_helper"

describe Article do
  let!(:article) { Fabricate :article }
  let(:id) { article.id }
  let(:model) { Article }
  subject { model }

  context "model" do
    its(:all) { should == [article] }
    its(:first) { should == article }
  end

  context "existance" do
    subject { article }
    its(:id) { should be_a Integer }
  end

  context ".find" do
    specify { expect(model.find(id)).to eq(article) }
  end

  context ".where" do
    specify { expect(model.where(id: id).first).to eq(article) }
  end

  context "#destroy" do
    subject { article }
    its(:delete) { should be_truthy }
    its(:destroy) { should be_truthy }
  end

  context "#save" do
    subject { article }
    let(:array) { [1, 2, 3] }

    its(:save) { should be_truthy }

    context "when change array field" do
      before { article.some_array = array }
      its(:save) { should be_truthy }
    end
  end
end
