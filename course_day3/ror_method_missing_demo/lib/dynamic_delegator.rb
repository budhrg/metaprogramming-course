class DynamicDelegator
  def initialize(target)
    @target = target
  end

  def method_missing(*args, &block)
    @target.send(*args, &block)
  end
end

