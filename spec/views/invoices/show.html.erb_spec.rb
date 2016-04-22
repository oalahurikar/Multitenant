require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :amount => "9.99",
      :company => "Company",
      :currency => "Currency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Currency/)
  end
end
