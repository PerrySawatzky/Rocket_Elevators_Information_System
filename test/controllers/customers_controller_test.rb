require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { company_contact_email: @customer.company_contact_email, company_contact_full_name: @customer.company_contact_full_name, company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_name: @customer.company_name, customer_creation_date: @customer.customer_creation_date, headquarters_address: @customer.headquarters_address, service_tech_authority_full_name: @customer.service_tech_authority_full_name, technical_authority_for_service_phone: @customer.technical_authority_for_service_phone, technical_manager_email_for_service: @customer.technical_manager_email_for_service, user_id: @customer.user_id } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { company_contact_email: @customer.company_contact_email, company_contact_full_name: @customer.company_contact_full_name, company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_name: @customer.company_name, customer_creation_date: @customer.customer_creation_date, headquarters_address: @customer.headquarters_address, service_tech_authority_full_name: @customer.service_tech_authority_full_name, technical_authority_for_service_phone: @customer.technical_authority_for_service_phone, technical_manager_email_for_service: @customer.technical_manager_email_for_service, user_id: @customer.user_id } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
