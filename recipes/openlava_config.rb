#
# Cookbook Name:: cfncluster
# Recipe:: openlava_config
#
# Copyright 2013-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/asl/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'cfncluster::base_config'
include_recipe 'cfncluster::openlava_install'

# case node['cfncluster']['cfn_node_type']
case node['cfncluster']['cfn_node_type']
when 'MasterServer'
  include_recipe 'cfncluster::_master_openlava_config'
when 'ComputeFleet'
  include_recipe 'cfncluster::_compute_openlava_config'
else
  fail "cfn_node_type must be MasterServer or ComputeFleet"
end

link '/etc/profile.d/openlava.sh' do
  to '/opt/openlava/etc/openlava.sh'
end

link '/etc/profile.d/openlava.csh' do
  to '/opt/openlava/etc/openlava.csh'
end
