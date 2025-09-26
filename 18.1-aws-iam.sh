{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-09c813fb71547fc4f",
            "InstanceId": "i-0ecef2665fb00d8ef",
            "InstanceType": "t3.micro",
            "LaunchTime": "2025-09-25T15:13:34+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-19-226.ec2.internal",
            "PrivateIpAddress": "172.31.19.226",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-04f58cc3c5f21526f",
            "VpcId": "vpc-001b5bab3e6abf38f",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "de8fb2da-6a11-452a-a020-44be6902916f",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2025-09-25T15:13:34+00:00",
                        "AttachmentId": "eni-attach-09458bb28fe04b18c",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "allo-all-ports",
                            "GroupId": "sg-0f80e4641e406c1e3"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:ff:c7:a2:bd:bd",
                    "NetworkInterfaceId": "eni-0bdb1042ce27e2e3e",
                    "OwnerId": "720215340831",
                    "PrivateDnsName": "ip-172-31-19-226.ec2.internal",
                    "PrivateIpAddress": "172.31.19.226",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-19-226.ec2.internal",
                            "PrivateIpAddress": "172.31.19.226"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-04f58cc3c5f21526f",
                    "VpcId": "vpc-001b5bab3e6abf38f",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "allo-all-ports",
                    "GroupId": "sg-0f80e4641e406c1e3"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "Test"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 2
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "uefi"
        }
    ],
    "OwnerId": "720215340831",
    "ReservationId": "r-0f2827179567d4603"
}


# PrivateIpAddress": "172.31.19.226"   immediately it will available
# public ip address:                    it will take time ok.

#  so front end handle seperately and non front end handle seperately.  ( 17 video -43.44 min)