import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.0.113:8080/api";

class Api {
  static Future getClientes() async {
    var url = baseUrl + "/clientes";
    return await http.get(url);
  }

  static Future getFornecedores() async {
    var url = baseUrl + "/fornecedores";
    return await http.get(url);
  }

  static Future getProdutos() async {
    var url = baseUrl + "/produtos";
    return await http.get(url);
  }

  static Future getVendas() async {
    var url = baseUrl + "/vendas";
    return await http.get(url);
  }
}