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

class OperationObject < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable

  attr_protected :id if ActiveRecord::VERSION::MAJOR <= 4
  safe_attributes 'operationable', 'operation_id', 'operationable_id', 'operationable_type'

  belongs_to :operation
  belongs_to :operationable, :polymorphic => true

  validates_presence_of :operationable, :operation
  validates_uniqueness_of :operation_id, :scope => [:operationable_id, :operationable_type]
end
