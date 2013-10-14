module Blockade
  module ControllerAdditions
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def allow(*args)
        self.before_filter :allow
      end
    end
  end
end
