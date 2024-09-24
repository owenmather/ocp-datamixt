"Terraform has been successfully initialized!"
"[INFO] running Terraform command: /home/ec2-user/ocp-install/terraform/bin/terraform apply -no-color -auto-approve -input=false -var-file=/tmp/openshift-install-cluster-2129481985/terraform.tfvars.json -var-file=/tmp/openshift-install-cluster-2129481985/terraform.platform.auto.tfvars.json -lock=true -parallelism=10 -refresh=true"

"Terraform used the selected providers to generate the following execution"
"plan. Resource actions are indicated with the following symbols:"
 create"

"Terraform will perform the following actions:"

 # module.dns.aws_route53_record.api_external_internal_zone_alias[0] will be created"
 resource "aws_route53_record" "api_external_internal_zone_alias" {
     allow_overwrite = (known after apply)"
     fqdn            = (known after apply)"
     id              = (known after apply)"
     name            = "api.hub.ocp.datamixt.com"
     type            = "A"
     zone_id         = "XXXXXXXXXXXXXXX"

     alias {
         evaluate_target_health = false"
         name                   = (known after apply)"
         zone_id                = (known after apply)"
       }
   }

 # module.dns.aws_route53_record.api_internal_alias[0] will be created"
 resource "aws_route53_record" "api_internal_alias" {
     allow_overwrite = (known after apply)"
     fqdn            = (known after apply)"
     id              = (known after apply)"
     name            = "api-int.hub.ocp.datamixt.com"
     type            = "A"
     zone_id         = "XXXXXXXXXXXXXXX"

     alias {
         evaluate_target_health = false"
         name                   = (known after apply)"
         zone_id                = (known after apply)"
       }
   }

 # module.iam.aws_iam_instance_profile.worker will be created"
 resource "aws_iam_instance_profile" "worker" {
     arn         = (known after apply)"
     create_date = (known after apply)"
     id          = (known after apply)"
     name        = "hub-crnlt-worker-profile"
     path        = "/"
     role        = "hub-crnlt-worker-role"
     tags_all    = (known after apply)"
     unique_id   = (known after apply)"
   }

 # module.iam.aws_iam_role.worker_role[0] will be created"
 resource "aws_iam_role" "worker_role" {
     arn                   = (known after apply)"
     assume_role_policy    = jsonencode("
           {
             Statement = [
                 {
                     Action    = "sts:AssumeRole"
                     Effect    = "Allow"
                     Principal = {
                         Service = "ec2.amazonaws.com"
                       }
                     Sid       = ""
                   },"
               ]
             Version   = "2012-10-17"
           }
       )"
     create_date           = (known after apply)"
     force_detach_policies = false"
     id                    = (known after apply)"
     managed_policy_arns   = (known after apply)"
     max_session_duration  = 3600"
     name                  = "hub-crnlt-worker-role"
     name_prefix           = (known after apply)"
     path                  = "/"
     tags                  = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-worker-role"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all              = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-worker-role"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     unique_id             = (known after apply)"

     inline_policy {
         name   = (known after apply)"
         policy = (known after apply)"
       }
   }

 # module.iam.aws_iam_role_policy.worker_policy[0] will be created"
 resource "aws_iam_role_policy" "worker_policy" {
     id     = (known after apply)"
     name   = "hub-crnlt-worker-policy"
     policy = jsonencode("
           {
             Statement = [
                 {
                     Action   = [
                         "ec2:DescribeInstances","
                         "ec2:DescribeRegions","
                       ]
                     Effect   = "Allow"
                     Resource = "*"
                   },"
               ]
             Version   = "2012-10-17"
           }
       )"
     role   = (known after apply)"
   }

 # module.masters.aws_iam_instance_profile.master will be created"
 resource "aws_iam_instance_profile" "master" {
     arn         = (known after apply)"
     create_date = (known after apply)"
     id          = (known after apply)"
     name        = "hub-crnlt-master-profile"
     path        = "/"
     role        = "hub-crnlt-master-role"
     tags_all    = (known after apply)"
     unique_id   = (known after apply)"
   }

 # module.masters.aws_iam_role.master_role[0] will be created"
 resource "aws_iam_role" "master_role" {
     arn                   = (known after apply)"
     assume_role_policy    = jsonencode("
           {
             Statement = [
                 {
                     Action    = "sts:AssumeRole"
                     Effect    = "Allow"
                     Principal = {
                         Service = "ec2.amazonaws.com"
                       }
                     Sid       = ""
                   },"
               ]
             Version   = "2012-10-17"
           }
       )"
     create_date           = (known after apply)"
     description           = "Created By OpenShift Installer"
     force_detach_policies = false"
     id                    = (known after apply)"
     managed_policy_arns   = (known after apply)"
     max_session_duration  = 3600"
     name                  = "hub-crnlt-master-role"
     name_prefix           = (known after apply)"
     path                  = "/"
     tags                  = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-role"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all              = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-role"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     unique_id             = (known after apply)"

     inline_policy {
         name   = (known after apply)"
         policy = (known after apply)"
       }
   }

 # module.masters.aws_iam_role_policy.master_policy[0] will be created"
 resource "aws_iam_role_policy" "master_policy" {
     id     = (known after apply)"
     name   = "hub-crnlt-master-policy"
     policy = jsonencode("
           {
             Statement = [
                 {
                     Action   = [
                         "ec2:AttachVolume","
                         "ec2:AuthorizeSecurityGroupIngress","
                         "ec2:CreateSecurityGroup","
                         "ec2:CreateTags","
                         "ec2:CreateVolume","
                         "ec2:DeleteSecurityGroup","
                         "ec2:DeleteVolume","
                         "ec2:Describe*","
                         "ec2:DetachVolume","
                         "ec2:ModifyInstanceAttribute","
                         "ec2:ModifyVolume","
                         "ec2:RevokeSecurityGroupIngress","
                         "elasticloadbalancing:AddTags","
                         "elasticloadbalancing:AttachLoadBalancerToSubnets","
                         "elasticloadbalancing:ApplySecurityGroupsToLoadBalancer","
                         "elasticloadbalancing:CreateListener","
                         "elasticloadbalancing:CreateLoadBalancer","
                         "elasticloadbalancing:CreateLoadBalancerPolicy","
                         "elasticloadbalancing:CreateLoadBalancerListeners","
                         "elasticloadbalancing:CreateTargetGroup","
                         "elasticloadbalancing:ConfigureHealthCheck","
                         "elasticloadbalancing:DeleteListener","
                         "elasticloadbalancing:DeleteLoadBalancer","
                         "elasticloadbalancing:DeleteLoadBalancerListeners","
                         "elasticloadbalancing:DeleteTargetGroup","
                         "elasticloadbalancing:DeregisterInstancesFromLoadBalancer","
                         "elasticloadbalancing:DeregisterTargets","
                         "elasticloadbalancing:Describe*","
                         "elasticloadbalancing:DetachLoadBalancerFromSubnets","
                         "elasticloadbalancing:ModifyListener","
                         "elasticloadbalancing:ModifyLoadBalancerAttributes","
                         "elasticloadbalancing:ModifyTargetGroup","
                         "elasticloadbalancing:ModifyTargetGroupAttributes","
                         "elasticloadbalancing:RegisterInstancesWithLoadBalancer","
                         "elasticloadbalancing:RegisterTargets","
                         "elasticloadbalancing:SetLoadBalancerPoliciesForBackendServer","
                         "elasticloadbalancing:SetLoadBalancerPoliciesOfListener","
                         "kms:DescribeKey","
                       ]
                     Effect   = "Allow"
                     Resource = "*"
                   },"
               ]
             Version   = "2012-10-17"
           }
       )"
     role   = (known after apply)"
   }

 # module.masters.aws_instance.master[0] will be created"
 resource "aws_instance" "master" {
     ami                                  = "ami-04fa8ddcead8110a9"
     arn                                  = (known after apply)"
     associate_public_ip_address          = (known after apply)"
     availability_zone                    = (known after apply)"
     cpu_core_count                       = (known after apply)"
     cpu_threads_per_core                 = (known after apply)"
     disable_api_stop                     = (known after apply)"
     disable_api_termination              = (known after apply)"
     ebs_optimized                        = (known after apply)"
     get_password_data                    = false"
     host_id                              = (known after apply)"
     host_resource_group_arn              = (known after apply)"
     iam_instance_profile                 = "hub-crnlt-master-profile"
     id                                   = (known after apply)"
     instance_initiated_shutdown_behavior = (known after apply)"
     instance_state                       = (known after apply)"
     instance_type                        = "t3a.xlarge"
     ipv6_address_count                   = (known after apply)"
     ipv6_addresses                       = (known after apply)"
     key_name                             = (known after apply)"
     monitoring                           = (known after apply)"
     outpost_arn                          = (known after apply)"
     password_data                        = (known after apply)"
     placement_group                      = (known after apply)"
     placement_partition_number           = (known after apply)"
     primary_network_interface_id         = (known after apply)"
     private_dns                          = (known after apply)"
     private_ip                           = (known after apply)"
     public_dns                           = (known after apply)"
     public_ip                            = (known after apply)"
     secondary_private_ips                = (known after apply)"
     security_groups                      = (known after apply)"
     subnet_id                            = (known after apply)"
     tags                                 = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-0"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all                             = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-0"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tenancy                              = (known after apply)"
     user_data                            = (sensitive)"
     user_data_base64                     = (known after apply)"
     user_data_replace_on_change          = false"
     volume_tags                          = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-0-vol"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     vpc_security_group_ids               = (known after apply)"

     capacity_reservation_specification {
         capacity_reservation_preference = (known after apply)"

         capacity_reservation_target {
             capacity_reservation_id                 = (known after apply)"
             capacity_reservation_resource_group_arn = (known after apply)"
           }
       }

     ebs_block_device {
         delete_on_termination = (known after apply)"
         device_name           = (known after apply)"
         encrypted             = (known after apply)"
         iops                  = (known after apply)"
         kms_key_id            = (known after apply)"
         snapshot_id           = (known after apply)"
         tags                  = (known after apply)"
         throughput            = (known after apply)"
         volume_id             = (known after apply)"
         volume_size           = (known after apply)"
         volume_type           = (known after apply)"
       }

     enclave_options {
         enabled = (known after apply)"
       }

     ephemeral_block_device {
         device_name  = (known after apply)"
         no_device    = (known after apply)"
         virtual_name = (known after apply)"
       }

     maintenance_options {
         auto_recovery = (known after apply)"
       }

     metadata_options {
         http_endpoint               = "enabled"
         http_put_response_hop_limit = (known after apply)"
         http_tokens                 = "required"
         instance_metadata_tags      = (known after apply)"
       }

     network_interface {
         delete_on_termination = false"
         device_index          = 0"
         network_card_index    = 0"
         network_interface_id  = (known after apply)"
       }

     private_dns_name_options {
         enable_resource_name_dns_a_record    = (known after apply)"
         enable_resource_name_dns_aaaa_record = (known after apply)"
         hostname_type                        = (known after apply)"
       }

     root_block_device {
         delete_on_termination = true"
         device_name           = (known after apply)"
         encrypted             = true"
         iops                  = 0"
         kms_key_id            = "alias/aws/ebs"
         throughput            = (known after apply)"
         volume_id             = (known after apply)"
         volume_size           = 120"
         volume_type           = "gp3"
       }
   }

 # module.masters.aws_lb_target_group_attachment.master[0] will be created"
 resource "aws_lb_target_group_attachment" "master" {
     id               = (known after apply)"
     target_group_arn = (known after apply)"
     target_id        = (known after apply)"
   }

 # module.masters.aws_lb_target_group_attachment.master[1] will be created"
 resource "aws_lb_target_group_attachment" "master" {
     id               = (known after apply)"
     target_group_arn = (known after apply)"
     target_id        = (known after apply)"
   }

 # module.masters.aws_network_interface.master[0] will be created"
 resource "aws_network_interface" "master" {
     arn                       = (known after apply)"
     description               = "Created By OpenShift Installer"
     id                        = (known after apply)"
     interface_type            = (known after apply)"
     ipv4_prefix_count         = (known after apply)"
     ipv4_prefixes             = (known after apply)"
     ipv6_address_count        = (known after apply)"
     ipv6_address_list         = (known after apply)"
     ipv6_address_list_enabled = false"
     ipv6_addresses            = (known after apply)"
     ipv6_prefix_count         = (known after apply)"
     ipv6_prefixes             = (known after apply)"
     mac_address               = (known after apply)"
     outpost_arn               = (known after apply)"
     owner_id                  = (known after apply)"
     private_dns_name          = (known after apply)"
     private_ip                = (known after apply)"
     private_ip_list           = (known after apply)"
     private_ip_list_enabled   = false"
     private_ips               = (known after apply)"
     private_ips_count         = (known after apply)"
     security_groups           = (known after apply)"
     source_dest_check         = true"
     subnet_id                 = "subnet-03b6ed93b4303797c"
     tags                      = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-0"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all                  = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-0"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }

     attachment {
         attachment_id = (known after apply)"
         device_index  = (known after apply)"
         instance      = (known after apply)"
       }
   }

 # module.vpc.aws_lb.api_internal will be created"
 resource "aws_lb" "api_internal" {
     arn                              = (known after apply)"
     arn_suffix                       = (known after apply)"
     dns_name                         = (known after apply)"
     enable_cross_zone_load_balancing = true"
     enable_deletion_protection       = false"
     id                               = (known after apply)"
     internal                         = true"
     ip_address_type                  = (known after apply)"
     load_balancer_type               = "network"
     name                             = "hub-crnlt-int"
     security_groups                  = (known after apply)"
     subnets                          = [
         "subnet-03b6ed93b4303797c","
       ]
     tags                             = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-int"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all                         = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-int"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     vpc_id                           = (known after apply)"
     zone_id                          = (known after apply)"

     subnet_mapping {
         allocation_id        = (known after apply)"
         ipv6_address         = (known after apply)"
         outpost_id           = (known after apply)"
         private_ipv4_address = (known after apply)"
         subnet_id            = (known after apply)"
       }

     timeouts {
         create = "20m"
       }
   }

 # module.vpc.aws_lb_listener.api_internal_api will be created"
 resource "aws_lb_listener" "api_internal_api" {
     arn               = (known after apply)"
     id                = (known after apply)"
     load_balancer_arn = (known after apply)"
     port              = 6443"
     protocol          = "TCP"
     ssl_policy        = (known after apply)"
     tags_all          = (known after apply)"

     default_action {
         order            = (known after apply)"
         target_group_arn = (known after apply)"
         type             = "forward"
       }
   }

 # module.vpc.aws_lb_listener.api_internal_services will be created"
 resource "aws_lb_listener" "api_internal_services" {
     arn               = (known after apply)"
     id                = (known after apply)"
     load_balancer_arn = (known after apply)"
     port              = 22623"
     protocol          = "TCP"
     ssl_policy        = (known after apply)"
     tags_all          = (known after apply)"

     default_action {
         order            = (known after apply)"
         target_group_arn = (known after apply)"
         type             = "forward"
       }
   }

 # module.vpc.aws_lb_target_group.api_internal will be created"
 resource "aws_lb_target_group" "api_internal" {
     arn                                = (known after apply)"
     arn_suffix                         = (known after apply)"
     connection_termination             = false"
     deregistration_delay               = "300"
     id                                 = (known after apply)"
     ip_address_type                    = (known after apply)"
     lambda_multi_value_headers_enabled = false"
     load_balancing_algorithm_type      = (known after apply)"
     name                               = "hub-crnlt-aint"
     port                               = 6443"
     preserve_client_ip                 = (known after apply)"
     protocol                           = "TCP"
     protocol_version                   = (known after apply)"
     proxy_protocol_v2                  = false"
     slow_start                         = 0"
     tags                               = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-aint"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all                           = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-aint"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     target_type                        = "ip"
     vpc_id                             = "vpc-0576491433680c881"

     health_check {
         enabled             = true"
         healthy_threshold   = 2"
         interval            = 10"
         matcher             = (known after apply)"
         path                = "/readyz"
         port                = "6443"
         protocol            = "HTTPS"
         timeout             = (known after apply)"
         unhealthy_threshold = 2"
       }

     stickiness {
         cookie_duration = (known after apply)"
         cookie_name     = (known after apply)"
         enabled         = (known after apply)"
         type            = (known after apply)"
       }
   }

 # module.vpc.aws_lb_target_group.services will be created"
 resource "aws_lb_target_group" "services" {
     arn                                = (known after apply)"
     arn_suffix                         = (known after apply)"
     connection_termination             = false"
     deregistration_delay               = "300"
     id                                 = (known after apply)"
     ip_address_type                    = (known after apply)"
     lambda_multi_value_headers_enabled = false"
     load_balancing_algorithm_type      = (known after apply)"
     name                               = "hub-crnlt-sint"
     port                               = 22623"
     preserve_client_ip                 = (known after apply)"
     protocol                           = "TCP"
     protocol_version                   = (known after apply)"
     proxy_protocol_v2                  = false"
     slow_start                         = 0"
     tags                               = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-sint"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all                           = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-sint"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     target_type                        = "ip"
     vpc_id                             = "vpc-0576491433680c881"

     health_check {
         enabled             = true"
         healthy_threshold   = 2"
         interval            = 10"
         matcher             = (known after apply)"
         path                = "/healthz"
         port                = "22623"
         protocol            = "HTTPS"
         timeout             = (known after apply)"
         unhealthy_threshold = 2"
       }

     stickiness {
         cookie_duration = (known after apply)"
         cookie_name     = (known after apply)"
         enabled         = (known after apply)"
         type            = (known after apply)"
       }
   }

 # module.vpc.aws_security_group.master will be created"
 resource "aws_security_group" "master" {
     arn                    = (known after apply)"
     description            = "Created By OpenShift Installer"
     egress                 = (known after apply)"
     id                     = (known after apply)"
     ingress                = (known after apply)"
     name                   = (known after apply)"
     name_prefix            = (known after apply)"
     owner_id               = (known after apply)"
     revoke_rules_on_delete = false"
     tags                   = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-sg"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all               = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-master-sg"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     vpc_id                 = "vpc-0576491433680c881"

     timeouts {
         create = "20m"
       }
   }

 # module.vpc.aws_security_group.worker will be created"
 resource "aws_security_group" "worker" {
     arn                    = (known after apply)"
     description            = "Created By OpenShift Installer"
     egress                 = (known after apply)"
     id                     = (known after apply)"
     ingress                = (known after apply)"
     name                   = (known after apply)"
     name_prefix            = (known after apply)"
     owner_id               = (known after apply)"
     revoke_rules_on_delete = false"
     tags                   = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-worker-sg"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     tags_all               = {
         "Environment"                     = "hub"
         "Name"                            = "hub-crnlt-worker-sg"
         "clusterDomain"                   = "datamixt"
         "kubernetes.io/cluster/hub-crnlt" = "owned"
         "provisionedBy"                   = "Owen"
       }
     vpc_id                 = "vpc-0576491433680c881"

     timeouts {
         create = "20m"
       }
   }

 # module.vpc.aws_security_group_rule.master_egress will be created"
 resource "aws_security_group_rule" "master_egress" {
     cidr_blocks              = [
         "0.0.0.0/0","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "-1"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "egress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_esp will be created"
 resource "aws_security_group_rule" "master_ingress_esp" {
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "50"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_esp_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_esp_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "50"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_etcd will be created"
 resource "aws_security_group_rule" "master_ingress_etcd" {
     description              = "Created By OpenShift Installer"
     from_port                = 2379"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 2380"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_geneve will be created"
 resource "aws_security_group_rule" "master_ingress_geneve" {
     description              = "Created By OpenShift Installer"
     from_port                = 6081"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 6081"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_geneve_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_geneve_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 6081"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 6081"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_https will be created"
 resource "aws_security_group_rule" "master_ingress_https" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 6443"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 6443"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_icmp will be created"
 resource "aws_security_group_rule" "master_ingress_icmp" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = -1"
     id                       = (known after apply)"
     protocol                 = "icmp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = -1"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ike will be created"
 resource "aws_security_group_rule" "master_ingress_ike" {
     description              = "Created By OpenShift Installer"
     from_port                = 500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ike_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_ike_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ike_nat_t will be created"
 resource "aws_security_group_rule" "master_ingress_ike_nat_t" {
     description              = "Created By OpenShift Installer"
     from_port                = 4500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 4500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ike_nat_t_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_ike_nat_t_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 4500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 4500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_internal will be created"
 resource "aws_security_group_rule" "master_ingress_internal" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_internal_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_internal_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_internal_from_worker_udp will be created"
 resource "aws_security_group_rule" "master_ingress_internal_from_worker_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_internal_udp will be created"
 resource "aws_security_group_rule" "master_ingress_internal_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kube_controller_manager will be created"
 resource "aws_security_group_rule" "master_ingress_kube_controller_manager" {
     description              = "Created By OpenShift Installer"
     from_port                = 10257"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 10257"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kube_controller_manager_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_kube_controller_manager_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 10257"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 10257"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kube_scheduler will be created"
 resource "aws_security_group_rule" "master_ingress_kube_scheduler" {
     description              = "Created By OpenShift Installer"
     from_port                = 10259"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 10259"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kube_scheduler_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_kube_scheduler_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 10259"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 10259"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kubelet_secure will be created"
 resource "aws_security_group_rule" "master_ingress_kubelet_secure" {
     description              = "Created By OpenShift Installer"
     from_port                = 10250"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 10250"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_kubelet_secure_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_kubelet_secure_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 10250"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 10250"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ovndb will be created"
 resource "aws_security_group_rule" "master_ingress_ovndb" {
     description              = "Created By OpenShift Installer"
     from_port                = 6641"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 6642"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ovndb_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_ovndb_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 6641"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 6642"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_services_tcp will be created"
 resource "aws_security_group_rule" "master_ingress_services_tcp" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_services_tcp_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_services_tcp_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_services_udp will be created"
 resource "aws_security_group_rule" "master_ingress_services_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_services_udp_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_services_udp_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_ssh will be created"
 resource "aws_security_group_rule" "master_ingress_ssh" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 22"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 22"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_vxlan will be created"
 resource "aws_security_group_rule" "master_ingress_vxlan" {
     description              = "Created By OpenShift Installer"
     from_port                = 4789"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 4789"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_ingress_vxlan_from_worker will be created"
 resource "aws_security_group_rule" "master_ingress_vxlan_from_worker" {
     description              = "Created By OpenShift Installer"
     from_port                = 4789"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 4789"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.master_mcs will be created"
 resource "aws_security_group_rule" "master_mcs" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 22623"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 22623"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_egress will be created"
 resource "aws_security_group_rule" "worker_egress" {
     cidr_blocks              = [
         "0.0.0.0/0","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "-1"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "egress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_esp will be created"
 resource "aws_security_group_rule" "worker_ingress_esp" {
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "50"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_esp_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_esp_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 0"
     id                       = (known after apply)"
     protocol                 = "50"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 0"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_geneve will be created"
 resource "aws_security_group_rule" "worker_ingress_geneve" {
     description              = "Created By OpenShift Installer"
     from_port                = 6081"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 6081"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_geneve_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_geneve_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 6081"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 6081"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_icmp will be created"
 resource "aws_security_group_rule" "worker_ingress_icmp" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = -1"
     id                       = (known after apply)"
     protocol                 = "icmp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = -1"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_ike will be created"
 resource "aws_security_group_rule" "worker_ingress_ike" {
     description              = "Created By OpenShift Installer"
     from_port                = 500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_ike_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_ike_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_ike_nat_t will be created"
 resource "aws_security_group_rule" "worker_ingress_ike_nat_t" {
     description              = "Created By OpenShift Installer"
     from_port                = 4500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 4500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_internal will be created"
 resource "aws_security_group_rule" "worker_ingress_internal" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_internal_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_internal_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_internal_from_master_udp will be created"
 resource "aws_security_group_rule" "worker_ingress_internal_from_master_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_internal_udp will be created"
 resource "aws_security_group_rule" "worker_ingress_internal_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 9000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 9999"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_kubelet_insecure will be created"
 resource "aws_security_group_rule" "worker_ingress_kubelet_insecure" {
     description              = "Created By OpenShift Installer"
     from_port                = 10250"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 10250"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_kubelet_insecure_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_kubelet_insecure_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 10250"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 10250"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_nat_t_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_nat_t_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 4500"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 4500"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_services_tcp will be created"
 resource "aws_security_group_rule" "worker_ingress_services_tcp" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_services_tcp_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_services_tcp_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_services_udp will be created"
 resource "aws_security_group_rule" "worker_ingress_services_udp" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_services_udp_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_services_udp_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 30000"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 32767"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_ssh will be created"
 resource "aws_security_group_rule" "worker_ingress_ssh" {
     cidr_blocks              = [
         "10.0.2.0/24","
       ]
     description              = "Created By OpenShift Installer"
     from_port                = 22"
     id                       = (known after apply)"
     protocol                 = "tcp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 22"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_vxlan will be created"
 resource "aws_security_group_rule" "worker_ingress_vxlan" {
     description              = "Created By OpenShift Installer"
     from_port                = 4789"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = true"
     source_security_group_id = (known after apply)"
     to_port                  = 4789"
     type                     = "ingress"
   }

 # module.vpc.aws_security_group_rule.worker_ingress_vxlan_from_master will be created"
 resource "aws_security_group_rule" "worker_ingress_vxlan_from_master" {
     description              = "Created By OpenShift Installer"
     from_port                = 4789"
     id                       = (known after apply)"
     protocol                 = "udp"
     security_group_id        = (known after apply)"
     self                     = false"
     source_security_group_id = (known after apply)"
     to_port                  = 4789"
     type                     = "ingress"
   }

"Plan: 74 to add, 0 to change, 0 to destroy."