resource "aws_security_group" "web" { # o nome é web pois ele será o responsável por receber requisições 
  # direcionada a nossas instancias  
  name        = "Web"
  description = "Allow public inbound traffic"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 80 # http
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 443 # https
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1 # adcionar -1 e protocol icmp para monitorar o erros no nosso health check 
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 3306 # colocamos egress para emitir conexão para o banco de dados Mysql
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.this["pvt_a"].cidr_block] #cidr block precisar ser o da subnet que escolher
  }

  tags = merge(local.common_tags, { Name = "Web Server" })

}

resource "aws_security_group" "db" {
  name        = "DB"
  description = "Allow incoming database connections"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port       = 3306 #porta padrão para o mysql
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    from_port   = 22 #porta direcionada para utilizar o ssh
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.this.cidr_block] #cidr block da vpc
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.this.cidr_block] #cidr block da vpc
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "Database MySQL" })
}
