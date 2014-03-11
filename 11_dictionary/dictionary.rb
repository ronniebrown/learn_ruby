class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(obj)
    obj = Hash[obj, nil] if obj.kind_of?(String)
    @entries.merge!(obj)
    @keywords = @entries.keys.sort
  end

  def include?(str)
    @keywords.include?(str)
  end

  def find(str)
    @entries.select { |k, _| k =~ /^#{str}/ }
  end

  def printable
    @keywords.map { |key| "[#{key}] \"#{@entries[key]}\"\n" }.join.chop
  end
end