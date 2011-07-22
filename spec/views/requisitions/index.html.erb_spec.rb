require 'spec_helper'

describe "requisitions/index.html.erb" do
  before(:each) do
    assign(:requisitions, [
      stub_model(Requisition,
        :req_id => 1,
        :account_name => "Account Name",
        :reason_id => 1,
        :user_id => 1,
        :note => "MyText",
        :category_id => 1,
        :is_borrowed => false
      ),
      stub_model(Requisition,
        :req_id => 1,
        :account_name => "Account Name",
        :reason_id => 1,
        :user_id => 1,
        :note => "MyText",
        :category_id => 1,
        :is_borrowed => false
      )
    ])
  end

  it "renders a list of requisitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
