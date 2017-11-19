module RootHelper

  def active?(index)
    index.zero? ? 'active' : ''
  end

end
