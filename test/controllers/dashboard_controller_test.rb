require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get note" do
    get dashboard_note_url
    assert_response :success
  end

  test "should get eventi" do
    get dashboard_eventi_url
    assert_response :success
  end

  test "should get soldi" do
    get dashboard_soldi_url
    assert_response :success
  end

  test "should get energie" do
    get dashboard_energie_url
    assert_response :success
  end

  test "should get accessi" do
    get dashboard_accessi_url
    assert_response :success
  end

  test "should get attenzione" do
    get dashboard_attenzione_url
    assert_response :success
  end

  test "should get luoghi" do
    get dashboard_luoghi_url
    assert_response :success
  end

  test "should get abilita" do
    get dashboard_abilita_url
    assert_response :success
  end

  test "should get attivita" do
    get dashboard_attivita_url
    assert_response :success
  end
end
