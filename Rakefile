#!/usr/bin/env ruby
# Copyright (C) )2012 Erich Douglass
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
def lnk_file(src, dst)
    puts "Linking #{src} to #{dst}"
    system %Q{ln -s #{src} #{dst}}
end

def del_file(file)
    puts "Removing #{file}"
    system %Q{rm -rf #{file}}
end

def replace_file(src, dst)
    del_file(dst)
    lnk_file(src, dst)
end

desc "Install dotfiles"
task :install do
    replace_all = false
    Dir.glob("*/**{.link}").each do |path|
        file = path.split("/").last.split(".link").last
        next if ['Rakefile', 'README', 'LICENSE'].include? file

        src = File.join(ENV['PWD'],  "#{path}")
        dst = File.join(ENV['HOME'], ".#{file}")
        if File.exist?(dst) or File.symlink?(dst)
            if replace_all
                replace_file(src, dst)
            else
                print "Overwrite #{dst}? [ynaq] "
                case $stdin.gets.chomp
                    when 'a'
                        replace_all = true
                        replace_file(src, dst)
                    when 'y'
                        replace_file(src, dst)
                    when 'q'
                        exit
                    else
                        puts "Skipping #{dst}"
                end
            end
        else
            lnk_file(src, dst)
        end
    end
end

desc "Uninstall dotfiles"
task :uninstall do
    Dir.glob("**/*.link").each do |path|
        file = path.split("/").last.split(".link").last
        dst  = File.join(ENV['HOME'], ".#{file}")
        if File.symlink?(dst)
            del_file(dst)
        end
    end
end

task :default => "install"