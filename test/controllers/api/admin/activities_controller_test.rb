require 'test_helper'

class Api::Admin::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:one)
    @token = @admin.token
    @user = users(:two)
    @activity = activities(:one)
  end

  test 'GET index, should display all the activities' do
    get api_admin_activities_url, headers: {
      'Authorization' => "Bearer #{@token}"
    }

    data = JSON.parse(response.body)

    assert_response :success
    assert_equal data['data'].count, Activity.count
  end

  test 'GET index, should be forbidden' do
    get api_admin_activities_url, headers: {
      'Authorization' => "Bearer #{@user.token}"
    }

    assert_response :forbidden
  end

  test 'POST create, should create a new activity' do
    count = Activity.count

    post api_admin_activities_url, headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        name: 'Yoga',
        kind: 'online'
      }
    }

    assert_response :success
    assert_equal Activity.count, count + 1
  end

  test 'POST schedule, should schedule an activity' do
    count = Schedule.count
    post schedule_api_admin_activity_url(@activity), headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        place: 'My home',
        date: 'Sat, 30 Nov 2020 13:30'
      }
    }

    assert_response :success
    assert_equal Schedule.count, count + 1
  end
end
