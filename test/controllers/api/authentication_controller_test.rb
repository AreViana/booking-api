require 'test_helper'

class Api::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'POST sign_up should create a new user' do
    count = User.count
    post api_sign_up_url, params: {
      data: {
        name: 'Arely',
        email: 'arely@example.com',
        password: '123',
        password_confirmation: '123'
      }
    }
    assert_response :success
    assert_equal User.count, count + 1
  end

  test 'POST sign_up should be already registered' do
    post api_sign_up_url, params: {
      data: {
        name: 'Arely',
        email: 'are@example.com',
        password: '123',
        password_confirmation: '123'
      }
    }
    assert_response :bad_request
  end

  test 'POST sign_in should be success login' do
    post api_sign_in_url, params: {
      data: {
        email: 'are@example.com',
        password: '42password'
      }
    }
    assert_response :success
  end

  test 'POST sign_in should have invalid credentials' do
    post api_sign_in_url, params: {
      data: {
        email: 'are@example.com',
        password: 'myPassword'
      }
    }
    assert_response :bad_request
  end

  test 'DELETE sign_out should remove the token' do
    token = @user.token
    delete api_sign_out_url, params: {
      data: { token: token }
    }, headers: { 'Authorization' => "Bearer #{token}" }

    @user.reload
    assert_response :success
    assert_nil @user.token
  end
end
