#exportando variaveis
output "ecsRole"{
    value = aws_iam_role.ecsRole.arn
}