require 'test_helper'

class Service::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_job = service_jobs(:one)
  end

  test "should get index" do
    get service_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_service_job_url
    assert_response :success
  end

  test "should create service_job" do
    assert_difference('Service::Job.count') do
      post service_jobs_url, params: { service_job: { description: @service_job.description, link: @service_job.link, show: @service_job.show, slave: @service_job.slave, sort: @service_job.sort, title: @service_job.title, url: @service_job.url } }
    end

    assert_redirected_to service_job_url(Service::Job.last)
  end

  test "should show service_job" do
    get service_job_url(@service_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_job_url(@service_job)
    assert_response :success
  end

  test "should update service_job" do
    patch service_job_url(@service_job), params: { service_job: { description: @service_job.description, link: @service_job.link, show: @service_job.show, slave: @service_job.slave, sort: @service_job.sort, title: @service_job.title, url: @service_job.url } }
    assert_redirected_to service_job_url(@service_job)
  end

  test "should destroy service_job" do
    assert_difference('Service::Job.count', -1) do
      delete service_job_url(@service_job)
    end

    assert_redirected_to service_jobs_url
  end
end
