class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
    @path = path 
  end
  
  def files 
  files = []
  Dir.entries(path).grep(/.*\.mp3/){|file| files << file}
  files
  end
  
  def import 
    self.files.each {|file| Song.new_by_filename(file)}
  end
    
end