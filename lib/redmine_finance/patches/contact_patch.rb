# This file is a part of Redmine Finance (redmine_finance) plugin,
# simple accounting plugin for Redmine
#
# Copyright (C) 2011-2022 RedmineUP
# http://www.redmineup.com/
#
# redmine_finance is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# redmine_finance is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with redmine_finance.  If not, see <http://www.gnu.org/licenses/>.

module RedmineFinance
  module Patches
    module ContactPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          has_many :operations, :dependent => :nullify
        end
      end
    end
  end
end

unless Contact.included_modules.include?(RedmineFinance::Patches::ContactPatch)
  Contact.send(:include, RedmineFinance::Patches::ContactPatch)
end
