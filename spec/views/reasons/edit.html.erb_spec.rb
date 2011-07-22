require 'spec_helper'

describe "reasons/edit.html.erb" do
  before(:each) do
    @reason = assign(:reason, stub_model(Reason,
      :content => "MyString"
    ))
  end

  it "renders the edit reason form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reasons_path(@reason), :method => "post" do
      assert_select "input#reason_content", :name => "reason[content]"
    end
  end
end
