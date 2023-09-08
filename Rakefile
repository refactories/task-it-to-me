require "rubygems"

desc "Generates a coverage report"
task :coverage do
  puts `COVERAGE=true bundle exec rspec`
end

desc 'Generate reek report in "metrics/reek.txt"'
task :reek do
  puts `bundle exec reek lib > metrics/reek.txt`
end

desc 'Generate Flog scoring in "metrics/flog.txt"'
task :flog do
  puts `bundle exec flog -a -c -d -s -v lib > metrics/flog.txt`
end

desc 'Generate rubycritic report "metrics/flog.txt"'
task :rubycritic do
  puts `bundle exec rubycritic lib --path=metrics`
end

task default: [:coverage, :rubycritic]
