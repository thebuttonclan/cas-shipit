Rake::Task["cron:minutely"].clear
namespace :cron do
  desc "Updates deployed revisions"
  task minutely: :environment do
    Shipit::Stack.refresh_deployed_revisions
    Shipit::Stack.schedule_continuous_delivery
    # Shipit::GithubStatus.refresh_status # broken Shopify/shipit-engine#881
    Shipit::PullRequest.schedule_merges
  end
end
