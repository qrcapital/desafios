output "alb" {
    value = aws_lb.alb.id
}

output "tgA" {
    value = aws_lb_target_group.tgA.arn
}