require 'yaml'
module Skeleton
    class SkeletonController
        @@config_path = './config.yaml'
        @@configurations = Object

        def self.init
            @@configurations = YAML.load(File.read(@@config_path))
            self.update_conf
        end

        def self.update_conf
            File.open(@@config_path, 'w') do |file|
                file.write(@@configurations.to_yaml)
            end
        end

        def self.configurations
            return YAML.load(File.read(@@config_path))
        end
    end
end