namespace :brakeman do

  desc "Run Brakeman"
  task :run, :output_files do |t, args|
    require 'brakeman'

    files = args[:output_files].split(' ') if args[:output_files]
    Brakeman.run :app_path => ".", :output_files => files, :print_report => true
  end

  desc "Check your code with Brakeman"
  task :check do
    require 'brakeman'
    result = Brakeman.run app_path: '.', print_report: true

    # TODO: There are some false positives that are going to take a bit of time
    # to get pushed to master so I'm manually filtering them here. This should
    # be removed once the fixes are released. See the following PR/issues for
    # more info:
    #
    # https://github.com/presidentbeef/brakeman/pull/45#issuecomment-148863250
    # https://github.com/presidentbeef/brakeman/issues/744
    filtered_warnings = result.filtered_warnings.reject{|warning| warning.format_message =~ /current_user.bars\.find\(/}

    exit Brakeman::Warnings_Found_Exit_Code unless filtered_warnings.empty?
  end
end
