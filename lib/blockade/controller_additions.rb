module Blockade
  class AccessDenied < StandardError; end

  module ControllerAdditions
    def self.included(base)
      base.extend ClassMethods
    end

    def roles
      raise NotImplementedError
    end

    def allowx(*args)
      allowed = false
      self.class.instance_variable_get(:@roles).each do |role, permissions|
        if roles.public_send("#{role}?")
          allowed = true
          break
        end
      end
      raise Blockade::AccessDenied unless allowed
    end

    module ClassMethods
      def allow(*args)
        @roles ||= {}
        @roles[args.first] = []
        self.before_filter :allowx
      end
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Blockade::ControllerAdditions
  end
end
