require 'spec_helper'

describe "requisitions/new.html.erb" do
  before(:each) do
    assign(:requisition, stub_model(Requisition,
      :req_id => 1,
      :account_name => "MyString",
      :reason_id => 1,
      :user_id => 1,
      :note => "MyText",
      :category_id => 1,
      :is_borrowed => false
    ).as_new_record)
  end

  it "renders new requisition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requisitions_path, :method => "post" do
      assert_select "input#requisition_req_id", :name => "requisition[req_id]"
      assert_select "input#requisition_account_name", :name => "requisition[account_name]"
      assert_select "input#requisition_reason_id", :name => "requisition[reason_id]"
      assert_select "input#requisition_user_id", :name => "requisition[user_id]"
      assert_select "textarea#requisition_note", :name => "requisition[note]"
      assert_select "input#requisition_category_id", :name => "requisition[category_id]"
      assert_select "input#requisition_is_borrowed", :name => "requisition[is_borrowed]"
    end
  end
end
