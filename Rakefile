namespace :admin do
  desc "Interactively delete all files in /temp"
  task :clean_tmp do
    Dir["/tmp/*"].each do |f|
      next unless File.file?(f)
      print "Delete #{f}?"
      answer = $stdin.gets
      case answer
      when /^y/
        File.unlink(f)
      when /^q/
        break
      end
    end
  end
end

namespace :test do
  desc "greeting the screen"
  task :greet do
    puts "hola mundo"
  end
end
