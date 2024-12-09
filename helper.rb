class Helper
  def self.get_input(filename = 'input.txt')
    File.open(filename).read
  end
end
