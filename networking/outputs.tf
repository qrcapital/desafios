output "subnetPrivateA" {
    value = aws_subnet.subnetPrivateA.id
}

output "subnetPrivateB" {
    value = aws_subnet.subnetPrivateB.id
}

output "subnetPublicA" {
    value = aws_subnet.subnetPublicA.id
}

output "subnetPublicB" {
    value = aws_subnet.subnetPublicB.id
}

output "esantosVPC"{
    value = aws_vpc.vpc.id
}

