require 'active_record'

module Skeleton
    
    config = Skeleton::SkeletonController::configurations()
    #ActiveRecord::Base.establish_connection(adapter: config[:adapter], database: config[:db])

end