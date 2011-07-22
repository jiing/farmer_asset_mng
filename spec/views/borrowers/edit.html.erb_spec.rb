require 'spec_helper'

describe "borrowers/edit.html.erb" do
  before(:each) do
    @borrower = assign(:borrower, stub_model(Borrower,
      :name => "MyString"
    ))
  end

  it "renders the edit borrower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => borrowers_path(@borrower), :method => "post" do
      assert_select "input#borrower_name", :name => "borrower[name]"
    end
  end
end
