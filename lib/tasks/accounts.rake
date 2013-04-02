namespace :accounts do
  desc "Sync all accounts that are marked for auto sync"
  task :sync => [:environment] do
    Account.sync_all!
  end
end
