data "template_file" "json" {
  template = file("template.json.tpl")

  vars = {
    age    = 33
    eye    = "Black"
    name   = "Edward"
    gender = "Male"
  }
} #valores que serão substituidos no arquivo de template.json que criei na aula de curso aws terraform

data "archive_file" "json" {
  type        = local.file_ext
  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"
  #esse recurso vai pegar o arquivo gerado da template e gerar um zip
  source {
    content  = data.template_file.json.rendered
    filename = "${local.object_name}.json"
  }
} # com isso esse outro source cria um arquivo na minha pasta que executo o terraform