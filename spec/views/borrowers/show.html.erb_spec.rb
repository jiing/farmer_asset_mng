require 'spec_helper'

describe "borrowers/show.html.erb" do
  before(:each) do
    @borrower = assign(:borrower, stub_model(Borrower,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
