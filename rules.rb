#
# Author:: Timur Batyrshin <erthad@gmail.com>
#
# Loosely based on the similar rule by Seth Vargo <sethvargo@gmail.com>
#
# Copyright 2015, Timur Batyrshin
# Copyright 2012, Seth Vargo, CustomInk, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

rule 'TIMB001', 'Single-quoted #{} sustitution' do
  tags %w{style strings timurb}

  cookbook do |path|
    recipes  = Dir["#{path}/{#{standard_cookbook_subdirs.join(',')}}/**/*.rb"]
    recipes += Dir["#{path}/*.rb"]

    recipes.collect do |recipe|
      lines = File.readlines(recipe)

      lines.each_with_index.map do |line, index|
        if line.match('\'(.*)#{(.*)}(.*)\'')
          {
            :filename => recipe,
            :matched => recipe,
            :line => index + 1,
            :column => 0
          }
        end
      end.compact
    end.flatten
  end
end
