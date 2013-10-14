require 'blockade/controller_additions'
require 'pry'

class XController
  def self.before_filter(*args)
    @_before_filters ||= []
    @_before_filters << args.first
  end

  def self.filter(*names)
    names.each do |name|
      method = instance_method(name)
      define_method(name) do
        run_filters
        method.bind(self).call
      end
    end
  end

  include Blockade::ControllerAdditions
  allow :visitor

  def index
  end

  private
  filter :index
  def run_filters
    filters = self.class.instance_variable_get(:@_before_filters)
    filters.each do |method|
      self.class.send(method)
    end
  end
end

describe Blockade::ControllerAdditions do
  let(:controller) { XController.new }

  it "adds a before filter to the controller" do
    XController.should_receive(:allow)

    controller.index
  end
end
