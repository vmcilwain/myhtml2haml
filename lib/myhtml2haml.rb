require_relative "myhtml2haml/version"
require 'thor'
require 'html2haml'
require 'html2haml/exec'

module Myhtml2haml
  class Myhtml2haml < Thor
    include Thor::Actions

    no_commands do
      def delete_file(file)
        File.delete file
      end

      def file_status(file)
        say "Converting: #{file}"
      end

      def warning
        exit_app unless allowed?
      end

      def exit_app
        abort('Aborting...')
      end

      def allowed?
        say "Location: #{Dir.pwd}"
        yes?("Are you sure? This action can't be undone")
      end

      def formatted_output(file)
        name = ""
        name << "#{directory_name(file)}/"
        name << "#{directory_name(file)}_" if options[:dir_prefix]
        name << "#{file_name(file)}.html.haml"
        name+=".dup" if File.exist?(name)
        name
      end

      def directory_name(file)
        File.basename(File.dirname(file))
      end

      def file_name(file)
        File.basename(file.split(/\./).first)
      end

      def convert_file(file)
        file_status(file)
        unless File.directory?(file)
          Html2haml::Exec::HTML2Haml.new([file, formatted_output(file)]).parse
          @file_counts[:converted] += 1
          delete_file(file) if options[:obliviate]
        end
      end

      def closing_status
        say 'Files Converted:'
        @file_counts.each {|key, value| say "#{key}: #{value}"}
      end
    end

    method_option :dir_prefix, type: :boolean, default: false, aliases: :d
    method_option :obliviate, type: :boolean, default: false, aliases: :o
    method_option :pattern, type: :string, aliases: :p
    desc 'convert', 'Changes html templates to haml templates'
    long_desc <<-LONGDESC
    -d    --dir_prefix
          Append parent directory name to file on conversion.
    -o    --obliviate
          Destroy original file after conversion.
    -p    --pattern
           The matching regexp of the file(s) to be converted.
           example: -p [.erb|.rhtml] to convert files with .erb or .rhtml extension.
    LONGDESC
    def convert
      warning if options[:obliviate]

      files = Dir["**/*#{options[:pattern]}"]
      @file_counts = {total: files.size, converted: 0}
      files.each {|file| convert_file(file)}
      closing_status
    end

    desc 'reset', 'Remove all haml templates'
    def reset
      warning
      files = Dir['**/*.haml']
      files.each {|file| File.delete file}
      say "Files deleted: #{files.size}"
    end
  end
end

Myhtml2haml::Myhtml2haml.start(ARGV)
