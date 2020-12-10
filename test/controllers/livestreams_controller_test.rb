require 'test_helper'

class LivestreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @livestream = livestreams(:one)
  end

  test "should get index" do
    get livestreams_url, as: :json
    assert_response :success
  end

  test "should create livestream" do
    assert_difference('Livestream.count') do
      post livestreams_url, params: { livestream: { band: @livestream.band, img: @livestream.img, show_day: @livestream.show_day, show_link: @livestream.show_link, user_id: @livestream.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show livestream" do
    get livestream_url(@livestream), as: :json
    assert_response :success
  end

  test "should update livestream" do
    patch livestream_url(@livestream), params: { livestream: { band: @livestream.band, img: @livestream.img, show_day: @livestream.show_day, show_link: @livestream.show_link, user_id: @livestream.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy livestream" do
    assert_difference('Livestream.count', -1) do
      delete livestream_url(@livestream), as: :json
    end

    assert_response 204
  end
end
