# example
## Public
resource "aws_route_table_association" "example-public-1a" {
  subnet_id      = aws_subnet.example-public-1a.id
  route_table_id = aws_route_table.example-igw.id
}

resource "aws_route_table_association" "example-public-1c" {
  subnet_id      = aws_subnet.example-public-1c.id
  route_table_id = aws_route_table.example-igw.id
}

## Private
resource "aws_route_table_association" "example-private-1a" {
  subnet_id      = aws_subnet.example-private-1a.id
  route_table_id = aws_route_table.example-natgw.id
}

resource "aws_route_table_association" "example-private-1c" {
  subnet_id      = aws_subnet.example-private-1c.id
  route_table_id = aws_route_table.example-natgw.id
}
