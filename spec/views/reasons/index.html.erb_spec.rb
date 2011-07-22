require 'spec_helper'

describe "reasons/index.html.erb" do
  before(:each) do
    assign(:reasons, [
      stub_model(Reason,
        :content => "Content"
      ),
      stub_model(Reason,
        :content => "Content"
      )
    ])
  end

  it "renders a list of reasons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
