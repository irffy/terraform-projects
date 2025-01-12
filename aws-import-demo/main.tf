provider "aws" {
  region = "us-east-1"
}

# resource "aws_instance" "my_instance" {
#   # Arguments will be populated after import
# }

resource "aws_instance" "my_instance" {
    ami                                  = "ami-05576a079321f21f8"
    arn                                  = "arn:aws:ec2:us-east-1:241533162589:instance/i-04097b5ba4faa74d0"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    host_id                              = null
    iam_instance_profile                 = null
    id                                   = "i-04097b5ba4faa74d0"
    instance_initiated_shutdown_behavior = "stop"
    instance_lifecycle                   = null
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = "aws-key"
    monitoring                           = false
    outpost_arn                          = null
    password_data                        = null
    placement_group                      = null
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-0c1474dc7a21da97f"
    private_dns                          = "ip-172-31-35-84.ec2.internal"
    private_ip                           = "172.31.35.84"
    public_dns                           = "ec2-18-212-148-34.compute-1.amazonaws.com"
    public_ip                            = "18.212.148.34"
    secondary_private_ips                = []
    security_groups                      = [
        "launch-wizard-7",
    ]
    source_dest_check                    = true
    spot_instance_request_id             = null
    subnet_id                            = "subnet-06acb1c40cc144f01"
    tags                                 = {
        "Name" = "aws-terraform-import-demo"
    }
    tags_all                             = {
        "Name" = "aws-terraform-import-demo"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-0d20f8c538c9e7e2f",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        amd_sev_snp      = null
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_protocol_ipv6          = "disabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 3000
        kms_key_id            = null
        tags                  = {}
        tags_all              = {}
        throughput            = 125
        volume_id             = "vol-0c26bc9a5492fd161"
        volume_size           = 8
        volume_type           = "gp3"
    }
}