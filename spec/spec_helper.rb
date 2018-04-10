ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require_relative '../app/app'
require_relative '../lib/manager'
require 'pg'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("TRUNCATE bookmarks")
  end
end


