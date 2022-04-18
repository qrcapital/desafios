output "albSg"{
    value = aws_security_group.albSg.id
}

output "serviceSg"{
    value = aws_security_group.serviceSg.id
}

output "databaseSg"{
    value = aws_security_group.databaseSg.id
}