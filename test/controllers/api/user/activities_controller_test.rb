require 'test_helper'

class Api::User::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:one)
    @user = users(:two)
    @token = @user.token
    @activity = activities(:one)
  end

  test 'GET index, should display all the activities' do
    get api_user_activities_url, headers: {
      'Authorization' => "Bearer #{@token}"
    }

    data = JSON.parse(response.body)

    assert_response :success
    assert_equal data['data'].count, Activity.count
  end

  test 'GET index, should be forbidden' do
    get api_user_activities_url, headers: {
      'Authorization' => "Bearer #{@admin.token}"
    }

    assert_response :forbidden
  end

  test 'POST book, should book an activity' do
    count = Booking.count
    schedule = @activity.schedules.create(
      place: 'My home',
      date: DateTime.tomorrow,
      owner: @user
    )

    post book_api_user_activity_url(@activity), headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        schedule_id: schedule.id
      }
    }

    assert_response :success
    assert_equal Booking.count, count + 1
  end

  test 'POST book, should not found activity' do
    post book_api_user_activity_url(-1), headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        schedule_id: 1
      }
    }

    assert_response :not_found
  end

  test 'POST book, should not found a schedule' do
    post book_api_user_activity_url(@activity), headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        schedule_id: -1
      }
    }

    assert_response :not_found
  end

  test 'POST book, should not have a valid params' do
    post book_api_user_activity_url(@activity), headers: {
      'Authorization' => "Bearer #{@token}"
    }, params: {
      data: {
        dummy: ''
      }
    }

    assert_response :bad_request
  end
end
