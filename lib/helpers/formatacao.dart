String refatorarSigno(String valor){
  return valor.toUpperCase().replaceAll("Á", "A").replaceAll("Â", "A").replaceAll("Ê", "E").replaceAll("Ã", "A");
}