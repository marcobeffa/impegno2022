require "test_helper"

class SublocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sublocation = sublocations(:one)
  end

  test "should get index" do
    get sublocations_url
    assert_response :success
  end

  test "should get new" do
    get new_sublocation_url
    assert_response :success
  end

  test "should create sublocation" do
    assert_difference("Sublocation.count") do
      post sublocations_url, params: { sublocation: { description: @sublocation.description, img_quadrata_url: @sublocation.img_quadrata_url, img_ret_orizzontale: @sublocation.img_ret_orizzontale, img_ret_verticale: @sublocation.img_ret_verticale, name: @sublocation.name, note_id: @sublocation.note_id, num_location: @sublocation.num_location, num_posti_max: @sublocation.num_posti_max } }
    end

    assert_redirected_to sublocation_url(Sublocation.last)
  end

  test "should show sublocation" do
    get sublocation_url(@sublocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_sublocation_url(@sublocation)
    assert_response :success
  end

  test "should update sublocation" do
    patch sublocation_url(@sublocation), params: { sublocation: { description: @sublocation.description, img_quadrata_url: @sublocation.img_quadrata_url, img_ret_orizzontale: @sublocation.img_ret_orizzontale, img_ret_verticale: @sublocation.img_ret_verticale, name: @sublocation.name, note_id: @sublocation.note_id, num_location: @sublocation.num_location, num_posti_max: @sublocation.num_posti_max } }
    assert_redirected_to sublocation_url(@sublocation)
  end

  test "should destroy sublocation" do
    assert_difference("Sublocation.count", -1) do
      delete sublocation_url(@sublocation)
    end

    assert_redirected_to sublocations_url
  end
end
