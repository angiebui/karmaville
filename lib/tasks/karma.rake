require 'benchmark'

namespace :karma do
  desc "Update the total_karam field for all users"
  task :update_for_users => :environment do

    time = Benchmark.measure do
      User.find_in_batches do |users|
        users.each do |user|
          user.update_attribute :total_karma, user.sum_total_karma
        end
      end
    end

    puts time
  end
end
