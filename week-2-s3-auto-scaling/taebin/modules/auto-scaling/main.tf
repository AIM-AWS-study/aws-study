resource "aws_launch_template" "this" {
  name = var.config.name
  image_id = var.config.image_id
  instance_type = var.config.instance_type
  user_data = var.config.user_data != "" ? base64encode(var.config.user_data) : null
  iam_instance_profile {
    name = aws_iam_instance_profile.this[0].name
  }
  network_interfaces {
    associate_public_ip_address = var.config.associate_public_ip_address
    security_groups = var.config.security_groups
  }
}

resource "aws_autoscaling_group" "this" {
  name = var.config.name
  min_size = var.config.min_size
  max_size = var.config.max_size
  vpc_zone_identifier = var.config.vpc_zone_identifier
  health_check_type = var.config.health_check_type
  desired_capacity = var.config.min_size
  launch_template {
    id = aws_launch_template.this.id
  }
  target_group_arns = var.config.target_group_arns
}

resource "aws_iam_instance_profile" "this" {
    count = var.config.create_instance_profile ? 1 : 0
    name = "${var.config.name}-profile"
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

# resource "aws_autoscaling_policy" "this" {
#   name                   = "${var.config.name}-policy"
#   autoscaling_group_name = aws_autoscaling_group.this.name
#   adjustment_type        = var.config.adjustment_type
#   policy_type            = var.config.policy_type
#   estimated_instance_warmup = var.config.estimated_instance_warmup
# }
