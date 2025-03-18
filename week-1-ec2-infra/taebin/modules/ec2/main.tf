resource "aws_instance" "this" {
    subnet_id = var.config.subnet_id
    ami = var.config.ami
    instance_type = var.config.instance_type
    iam_instance_profile = var.config.create_instance_profile ? aws_iam_instance_profile.this[0].name : var.config.profile_name
    root_block_device {
        volume_size = var.config.root_volume_size
        iops = 3000
        throughput = 125
        volume_type = "gp3"
    }
    associate_public_ip_address = var.config.associate_public_ip_address
    security_groups = var.config.security_groups
    user_data = var.config.user_data != "" ? var.config.user_data : null
    tags = {
        Name = var.config.name
    }
    
    depends_on = [ aws_iam_instance_profile.this]
}

resource "aws_iam_instance_profile" "this" {
    count = var.config.create_instance_profile ? 1 : 0
    name = "${var.config.role_name}-profile"
    role = var.config.create_iam_role ? aws_iam_role.this[0].name : var.config.role_name
    depends_on = [ aws_iam_role.this ]
}

resource "aws_iam_role" "this" {
    count = var.config.create_iam_role ? 1 : 0
    name = var.config.role_name == "" ? "${var.config.name}-ec2-role" : var.config.role_name
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Effect = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "this" {
    for_each = { for policy in var.config.policy_arns : policy => policy }
    policy_arn = each.value
    role = aws_iam_role.this[0].name
    depends_on = [ aws_iam_role.this ]
}