require 'spec_helper'

describe "reasons/new.html.erb" do
  before(:each) do
    assign(:reason, stub_model(Reason,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new reason form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reasons_path, :method => "post" do
      assert_select "input#reason_content", :name => "reason[content]"
    end
  end
end
