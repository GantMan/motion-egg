#niceeeeeeeeeeeee
unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

class EggConfig

  def initialize(config)
    @config = config
  end

end

module Motion
  module Project
    class Config

      def egg
        @egg ||= EggConfig.new(self)
      end

    end
  end
end